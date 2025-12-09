# Phase 2 开发指南 - 精简版

> 基于阶段1代码最小化修改，4个优化共8个新文件

---

## 文件总览

| 优化 | 源文件 | Testbench | 测试用例数 |
|:----:|--------|-----------|:----------:|
| 1 | `Prime_Finder_Parallel_Group55.vhd` | `Parallel_tb.vhd` | 2 |
| 2 | `LongDivision_CLA_Pipeline_Group55.vhd` | `CLA_Pipeline_tb.vhd` | 3 |
| 3 | `Prime_Finder_6k1_Group55.vhd` | `Algorithm_6k1_tb.vhd` | 2 |
| 4 | `Prime_Finder_16bit_Top_Group55.vhd` | `Extend_16bit_tb.vhd` | 2 |

---

## 优化1: 并行除法器

### 源文件: `Prime_Finder_Parallel_Group55.vhd`

```vhdl
-- 并行实例化3个除法器，同时测试÷2, ÷3, ÷5

entity Prime_Finder_Parallel_Group55 is
    port(
        N        : in  std_logic_vector(3 downto 0);
        CLK      : in  std_logic;
        Load     : in  std_logic;
        Is_Prime : out std_logic;
        Done     : out std_logic
    );
end entity;

architecture rtl of Prime_Finder_Parallel_Group55 is
    component LongDivision_4bit_Group55 is
        port(
            Dividend, Divisor : in  std_logic_vector(3 downto 0);
            CLK, Load         : in  std_logic;
            Q_out, R_out      : out std_logic_vector(3 downto 0);
            Done              : out std_logic
        );
    end component;
    
    signal R2, R3, R5 : std_logic_vector(3 downto 0);
    signal Done2, Done3, Done5 : std_logic;
begin
    DIV2: LongDivision_4bit_Group55 port map(N, "0010", CLK, Load, open, R2, Done2);
    DIV3: LongDivision_4bit_Group55 port map(N, "0011", CLK, Load, open, R3, Done3);
    DIV5: LongDivision_4bit_Group55 port map(N, "0101", CLK, Load, open, R5, Done5);
    
    Done <= Done2 and Done3 and Done5;
    
    Is_Prime <= '0' when N < "0010" else
                '0' when (R2 = "0000" and N /= "0010") else
                '0' when (R3 = "0000" and N /= "0011") else
                '0' when (R5 = "0000" and N /= "0101") else
                '1';
end architecture;
```

### Testbench: `Parallel_tb.vhd`

**只需2个测试用例**:

| 用例 | 输入 | 期望输出 | 展示目的 |
|:----:|:----:|:--------:|----------|
| 1 | N=7 | Is_Prime=1 | 质数：3个除法器都返回非0余数 |
| 2 | N=9 | Is_Prime=0 | 合数：÷3返回余数0 |

**波形关键点**:
```
观察点1: Done2, Done3, Done5 在同一时刻变为'1'
         → 证明3个除法器并行工作

观察点2: 从Load上升沿到Done='1'的周期数
         → 与串行方案对比 (并行应快3倍)
```

---

## 优化2: CLA减法器 + 流水线 (合并)

### 源文件: `LongDivision_CLA_Pipeline_Group55.vhd`

```vhdl
-- 使用CLA减法器的流水线除法器
-- CLA: 减少单次减法延迟
-- 流水线: 提高连续处理吞吐量

entity LongDivision_CLA_Pipeline_Group55 is
    port(
        Dividend : in  std_logic_vector(3 downto 0);
        Divisor  : in  std_logic_vector(3 downto 0);
        CLK      : in  std_logic;
        Load     : in  std_logic;
        Q_out    : out std_logic_vector(3 downto 0);
        R_out    : out std_logic_vector(3 downto 0);
        Done     : out std_logic
    );
end entity;

architecture rtl of LongDivision_CLA_Pipeline_Group55 is
    ---------------------------------------------------------------------------
    -- CLA减法器 (内嵌，替代RipSub)
    ---------------------------------------------------------------------------
    function cla_subtract(A, B : std_logic_vector(3 downto 0)) 
        return std_logic_vector is
        variable Bn : std_logic_vector(3 downto 0);
        variable G, P : std_logic_vector(3 downto 0);
        variable C : std_logic_vector(4 downto 0);
        variable Diff : std_logic_vector(3 downto 0);
    begin
        Bn := not B;
        G := A and Bn;
        P := A xor Bn;
        C(0) := '1';
        C(1) := G(0) or (P(0) and C(0));
        C(2) := G(1) or (P(1) and G(0)) or (P(1) and P(0));
        C(3) := G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0));
        C(4) := G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1))
                     or (P(3) and P(2) and P(1) and G(0));
        Diff := P xor C(3 downto 0);
        return Diff;
    end function;
    
    function cla_borrow(A, B : std_logic_vector(3 downto 0)) 
        return std_logic is
        variable Bn : std_logic_vector(3 downto 0);
        variable G, P : std_logic_vector(3 downto 0);
        variable C4 : std_logic;
    begin
        Bn := not B;
        G := A and Bn;
        P := A xor Bn;
        C4 := G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1))
                   or (P(3) and P(2) and P(1) and G(0))
                   or (P(3) and P(2) and P(1) and P(0));
        return not C4;  -- 无进位=有借位
    end function;
    
    ---------------------------------------------------------------------------
    -- 流水线寄存器
    ---------------------------------------------------------------------------
    -- Stage 1: 输入锁存
    signal s1_dividend, s1_divisor : std_logic_vector(3 downto 0);
    signal s1_valid : std_logic := '0';
    
    -- Stage 2+: 迭代减法
    signal reg_dividend : std_logic_vector(3 downto 0);
    signal reg_quotient : std_logic_vector(3 downto 0);
    signal computing : std_logic := '0';
    signal done_internal : std_logic := '0';
    
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            -- Stage 1: 锁存输入 (流水线入口)
            if Load = '1' then
                s1_dividend <= Dividend;
                s1_divisor <= Divisor;
                s1_valid <= '1';
            elsif s1_valid = '1' then
                reg_dividend <= s1_dividend;
                reg_quotient <= "0000";
                computing <= '1';
                s1_valid <= '0';
            end if;
            
            -- Stage 2+: 迭代减法 (使用CLA)
            if computing = '1' then
                if cla_borrow(reg_dividend, s1_divisor) = '0' then
                    reg_dividend <= cla_subtract(reg_dividend, s1_divisor);
                    reg_quotient <= reg_quotient + 1;
                else
                    done_internal <= '1';
                    computing <= '0';
                end if;
            end if;
            
            -- 清除done
            if done_internal = '1' and Load = '0' then
                done_internal <= '0';
            end if;
        end if;
    end process;
    
    Q_out <= reg_quotient;
    R_out <= reg_dividend;
    Done <= done_internal;
end architecture;
```

### Testbench: `CLA_Pipeline_tb.vhd`

**只需3个连续输入**:

| 时刻 | 操作 | 展示目的 |
|:----:|:----:|----------|
| T1 | Load N=7÷3 | 进入Stage1 |
| T2 | Load N=8÷3 | N=7进入计算, N=8进入Stage1 |
| T3 | Load N=9÷3 | 流水线填满 |
| T4-T6 | 等待 | 依次输出结果 |

**波形关键点**:
```
┌────────────────────────────────────────────────────────┐
│                   CLA效果展示                          │
├────────────────────────────────────────────────────────┤
│ 对比: 同时实例化RipSub版和CLA版除法器                   │
│ 观察: CLA版的Done信号更早变为'1'                       │
│ 量化: 记录两者从Load到Done的周期数差异                 │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│                  流水线效果展示                         │
├────────────────────────────────────────────────────────┤
│ 连续输入: N=7, N=8, N=9 (间隔1周期)                    │
│ 观察: 3个结果依次输出，间隔约1周期                     │
│ 量化: 处理3个数的总周期 << 3 × 单个周期                │
└────────────────────────────────────────────────────────┘
```

**Testbench代码结构**:
```vhdl
-- CLA_Pipeline_tb.vhd

-- 同时实例化两个版本用于对比
UUT_CLA: LongDivision_CLA_Pipeline_Group55 port map(...);
UUT_RIP: LongDivision_4bit_Group55 port map(...);  -- 原版

-- 测试过程
process
begin
    -- Test 1: 单次操作对比CLA vs RipSub
    Dividend <= "0111"; Divisor <= "0011"; Load <= '1';
    wait for CLK_PERIOD;
    Load <= '0';
    wait until Done_CLA = '1';  -- 记录CLA完成时间
    wait until Done_Rip = '1';  -- 记录RipSub完成时间
    -- 对比: CLA应该更快
    
    -- Test 2: 连续输入展示流水线
    for i in 7 to 9 loop
        Dividend <= conv_std_logic_vector(i, 4);
        Load <= '1';
        wait for CLK_PERIOD;
    end loop;
    Load <= '0';
    -- 观察: 3个Done信号依次触发
    
    wait;
end process;
```

---

## 优化3: 6k±1算法

### 源文件: `Prime_Finder_6k1_Group55.vhd`

```vhdl
-- 使用6k±1数学优化减少除法次数

entity Prime_Finder_6k1_Group55 is
    port(
        N            : in  std_logic_vector(3 downto 0);
        CLK          : in  std_logic;
        Load         : in  std_logic;
        Is_Prime     : out std_logic;
        Done         : out std_logic;
        Div_Count    : out std_logic_vector(3 downto 0)  -- 除法次数计数器
    );
end entity;

architecture rtl of Prime_Finder_6k1_Group55 is
    type state_type is (IDLE, CHECK_2, WAIT_2, CHECK_3, WAIT_3, 
                        GEN_6K, CHECK_6K, WAIT_6K, DONE_P, DONE_NP);
    signal state : state_type := IDLE;
    signal current_divisor : std_logic_vector(3 downto 0);
    signal div_count_reg : std_logic_vector(3 downto 0) := "0000";
    signal test_minus : std_logic;  -- 1=测6k-1, 0=测6k+1
    
    -- 复用除法器
    component LongDivision_4bit_Group55 ... end component;
    signal div_load, div_done : std_logic;
    signal div_remainder : std_logic_vector(3 downto 0);
begin
    DIV: LongDivision_4bit_Group55 port map(
        Dividend => N,
        Divisor => current_divisor,
        CLK => CLK,
        Load => div_load,
        R_out => div_remainder,
        Done => div_done
    );
    
    process(CLK)
    begin
        if rising_edge(CLK) then
            div_load <= '0';  -- 默认
            
            case state is
                when IDLE =>
                    if Load = '1' then
                        div_count_reg <= "0000";
                        if N < "0010" then state <= DONE_NP;
                        elsif N = "0010" or N = "0011" then state <= DONE_P;
                        else
                            current_divisor <= "0010";
                            div_load <= '1';
                            state <= WAIT_2;
                        end if;
                    end if;
                    
                when WAIT_2 =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then state <= DONE_NP;
                        else
                            current_divisor <= "0011";
                            div_load <= '1';
                            state <= WAIT_3;
                        end if;
                    end if;
                    
                when WAIT_3 =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then state <= DONE_NP;
                        else
                            current_divisor <= "0101";  -- 6×1-1=5
                            test_minus <= '0';
                            state <= GEN_6K;
                        end if;
                    end if;
                    
                when GEN_6K =>
                    if current_divisor >= N then
                        state <= DONE_P;  -- 测试完毕，是质数
                    else
                        div_load <= '1';
                        state <= WAIT_6K;
                    end if;
                    
                when WAIT_6K =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then 
                            state <= DONE_NP;
                        else
                            -- 生成下一个6k±1
                            if test_minus = '0' then
                                current_divisor <= current_divisor + 2;  -- 5→7
                                test_minus <= '1';
                            else
                                current_divisor <= current_divisor + 4;  -- 7→11
                                test_minus <= '0';
                            end if;
                            state <= GEN_6K;
                        end if;
                    end if;
                    
                when DONE_P =>
                    Is_Prime <= '1'; Done <= '1';
                    if Load = '0' then state <= IDLE; Done <= '0'; end if;
                    
                when DONE_NP =>
                    Is_Prime <= '0'; Done <= '1';
                    if Load = '0' then state <= IDLE; Done <= '0'; end if;
                    
                when others => state <= IDLE;
            end case;
        end if;
    end process;
    
    Div_Count <= div_count_reg;
end architecture;
```

### Testbench: `Algorithm_6k1_tb.vhd`

**只需2个测试用例**:

| 用例 | 输入 | 期望 | 传统次数 | 6k±1次数 | 展示目的 |
|:----:|:----:|:----:|:--------:|:--------:|----------|
| 1 | N=13 | 质数 | 11次 | 2次 | 大幅减少 |
| 2 | N=9 | 合数 | 2次 | 2次 | 快速发现因子 |

**波形关键点**:
```
┌────────────────────────────────────────────────────────┐
│                关键观察: Div_Count信号                  │
├────────────────────────────────────────────────────────┤
│ N=13测试:                                               │
│   传统方法: 需测试 2,3,4,5,6,7,8,9,10,11,12 = 11次     │
│   6k±1优化: 只测试 2,3 (5>√13,停止) = 2次              │
│                                                         │
│ 波形显示: Div_Count最终值 = 0010 (2次)                 │
└────────────────────────────────────────────────────────┘
```

**Testbench代码结构**:
```vhdl
-- Algorithm_6k1_tb.vhd

process
begin
    -- Test 1: N=13 (质数)
    N <= "1101"; Load <= '1';
    wait for CLK_PERIOD;
    Load <= '0';
    wait until Done = '1';
    assert Is_Prime = '1' report "N=13 should be prime" severity error;
    assert Div_Count = "0010" report "Should only do 2 divisions" severity error;
    
    wait for CLK_PERIOD * 5;
    
    -- Test 2: N=9 (合数, 被3整除)
    N <= "1001"; Load <= '1';
    wait for CLK_PERIOD;
    Load <= '0';
    wait until Done = '1';
    assert Is_Prime = '0' report "N=9 should not be prime" severity error;
    -- Div_Count = 2 (测2不整除, 测3整除)
    
    report "All tests passed!";
    wait;
end process;
```

---

## 优化4: 16位扩展

### 源文件: `Prime_Finder_16bit_Top_Group55.vhd`

```vhdl
-- 16位质数检测顶层 (时分复用输入)

entity Prime_Finder_16bit_Top_Group55 is
    port(
        MAX10_CLK1_50 : in  std_logic;
        SW            : in  std_logic_vector(9 downto 0);
        KEY           : in  std_logic_vector(1 downto 0);
        HEX0 to HEX5  : out std_logic_vector(6 downto 0);
        LEDR          : out std_logic_vector(9 downto 0)
    );
end entity;

architecture rtl of Prime_Finder_16bit_Top_Group55 is
    type state_type is (WAIT_HIGH, WAIT_LOW, COMPUTING, SHOW_RESULT);
    signal state : state_type := WAIT_HIGH;
    
    signal data_high, data_low : std_logic_vector(7 downto 0);
    signal data_full : std_logic_vector(15 downto 0);
    signal key0_edge, key1_edge : std_logic;
    signal key0_prev, key1_prev : std_logic;
begin
    -- 按键边沿检测
    process(MAX10_CLK1_50)
    begin
        if rising_edge(MAX10_CLK1_50) then
            key0_prev <= KEY(0);
            key1_prev <= KEY(1);
        end if;
    end process;
    key0_edge <= key0_prev and not KEY(0);
    key1_edge <= key1_prev and not KEY(1);
    
    -- 状态机
    process(MAX10_CLK1_50)
    begin
        if rising_edge(MAX10_CLK1_50) then
            case state is
                when WAIT_HIGH =>
                    LEDR(8) <= '1'; LEDR(7) <= '0';  -- 指示输入高位
                    if key0_edge = '1' then
                        data_high <= SW(7 downto 0);
                        state <= WAIT_LOW;
                    end if;
                    
                when WAIT_LOW =>
                    LEDR(8) <= '0'; LEDR(7) <= '1';  -- 指示输入低位
                    if key1_edge = '1' then
                        data_low <= SW(7 downto 0);
                        data_full <= data_high & SW(7 downto 0);
                        state <= COMPUTING;
                    end if;
                    
                when COMPUTING =>
                    LEDR(8) <= '1'; LEDR(7) <= '1';  -- 计算中
                    -- 启动质数检测...
                    if prime_done = '1' then
                        state <= SHOW_RESULT;
                    end if;
                    
                when SHOW_RESULT =>
                    -- 显示结果，KEY0重新开始
                    if key0_edge = '1' then
                        state <= WAIT_HIGH;
                    end if;
            end case;
        end if;
    end process;
    
    -- HEX显示16位数的十进制值 (需要5位: 0-65535)
    -- ... 二进制转BCD逻辑 ...
    
    LEDR(9) <= is_prime_result;
end architecture;
```

### Testbench: `Extend_16bit_tb.vhd`

**只需2个测试用例**:

| 用例 | 输入 | 操作步骤 | 期望 | 展示目的 |
|:----:|:----:|----------|:----:|----------|
| 1 | N=17 | 高位=0x00, 低位=0x11 | 质数 | 验证基本功能 |
| 2 | N=1009 | 高位=0x03, 低位=0xF1 | 质数 | 验证大数处理 |

**波形关键点**:
```
┌────────────────────────────────────────────────────────┐
│              时分复用输入过程展示                       │
├────────────────────────────────────────────────────────┤
│ 步骤1: SW=00000000, 按KEY0 → data_high=0x00            │
│ 步骤2: SW=00010001, 按KEY1 → data_low=0x11             │
│        data_full = 0x0011 = 17                         │
│ 步骤3: 等待计算完成 → Is_Prime=1                       │
│                                                         │
│ N=1009 (0x03F1):                                        │
│ 步骤1: SW=00000011 (0x03), 按KEY0                      │
│ 步骤2: SW=11110001 (0xF1), 按KEY1                      │
│        data_full = 0x03F1 = 1009                       │
│ 步骤3: Is_Prime=1 (1009是质数)                         │
└────────────────────────────────────────────────────────┘
```

**Testbench代码结构**:
```vhdl
-- Extend_16bit_tb.vhd

process
begin
    -- Test 1: N=17 (小质数验证功能)
    SW <= "0000000000";  -- 高位 = 0x00
    KEY <= "10";  -- 按下KEY0
    wait for CLK_PERIOD;
    KEY <= "11";  -- 释放
    wait for CLK_PERIOD * 5;
    
    SW <= "0000010001";  -- 低位 = 0x11 = 17
    KEY <= "01";  -- 按下KEY1
    wait for CLK_PERIOD;
    KEY <= "11";
    
    wait until Done = '1';
    assert Is_Prime = '1' report "17 should be prime" severity error;
    
    -- 复位，测试下一个
    KEY <= "10"; wait for CLK_PERIOD; KEY <= "11";
    wait for CLK_PERIOD * 5;
    
    -- Test 2: N=1009 (大质数)
    SW <= "0000000011";  -- 高位 = 0x03
    KEY <= "10"; wait for CLK_PERIOD; KEY <= "11";
    wait for CLK_PERIOD * 5;
    
    SW <= "0011110001";  -- 低位 = 0xF1
    KEY <= "01"; wait for CLK_PERIOD; KEY <= "11";
    
    wait until Done = '1';
    assert Is_Prime = '1' report "1009 should be prime" severity error;
    
    report "All 16-bit tests passed!";
    wait;
end process;
```

---

## 开发顺序

```
┌─────────────────────────────────────────────────────────────┐
│  Day 1 (4h)                                                 │
│  ├── 优化3: 6k±1算法 (2h) - 状态机 + 除法次数计数          │
│  └── 优化1: 并行除法器 (2h) - 复用现有除法器               │
├─────────────────────────────────────────────────────────────┤
│  Day 2 (4h)                                                 │
│  └── 优化2: CLA+流水线 (4h) - 合并实现                     │
├─────────────────────────────────────────────────────────────┤
│  Day 3 (5h)                                                 │
│  └── 优化4: 16位扩展 (5h) - 时分复用 + 8位除法器           │
├─────────────────────────────────────────────────────────────┤
│  Day 4 (3h)                                                 │
│  ├── 整合测试 (1h)                                         │
│  └── 视频录制 (2h)                                         │
└─────────────────────────────────────────────────────────────┘
```

---

## 新建文件清单 (8个)

| 序号 | 文件名 | 类型 |
|:----:|--------|:----:|
| 1 | `Prime_Finder_Parallel_Group55.vhd` | 源 |
| 2 | `Parallel_tb.vhd` | TB |
| 3 | `LongDivision_CLA_Pipeline_Group55.vhd` | 源 |
| 4 | `CLA_Pipeline_tb.vhd` | TB |
| 5 | `Prime_Finder_6k1_Group55.vhd` | 源 |
| 6 | `Algorithm_6k1_tb.vhd` | TB |
| 7 | `Prime_Finder_16bit_Top_Group55.vhd` | 源 |
| 8 | `Extend_16bit_tb.vhd` | TB |

---

## Testbench演示要点总结

| 优化 | 测试数 | 关键波形 | 演示时长 |
|:----:|:------:|----------|:--------:|
| 1 | 2 | Done2/Done3/Done5同时变化 | 30s |
| 2 | 3 | CLA vs RipSub延迟对比 + 连续输出 | 45s |
| 3 | 2 | Div_Count计数器值 | 30s |
| 4 | 2 | 时分复用state变化 + data_full | 30s |

**总演示时长: ~2分钟** (波形部分)

---

*设计原则: 每个Testbench用最少例子展示核心功能差异*
