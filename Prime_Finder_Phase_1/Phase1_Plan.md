# 阶段1开发计划

## 项目结构

```
Prime_Finder/
├── Prime_Finder.qpf          -- Quartus项目文件
├── Prime_Finder.qsf          -- Quartus设置文件（含引脚分配）
├── db/                       -- Quartus数据库（自动生成）
├── And_2bit_Group55.vhd       -- 2位与门模块
├── Full_adder_Group55.vhd     -- 全加器模块
├── RipSub_4bit_Group55.vhd    -- 4位纹波减法器
├── Multiplier_4bit_Group55.vhd -- 4位乘法器
├── LongDivision_4bit_Group55.vhd -- 4位长除法器
├── Prime_Finder_Group55.vhd   -- 顶层模块
└── *_tb.vhd                  -- 各模块测试文件
```

---

## 开发顺序

按依赖关系从底层到顶层开发：

```
1. And_2bit ──────┐
                  ├──> 3. Multiplier_4bit ──┐
2. Full_adder ────┘                         │
                                            ├──> 5. LongDivision_4bit ──> 6. Prime_Finder
4. RipSub_4bit ─────────────────────────────┘
```

---

## 第一步：And_2bit 模块

**文件**：`And_2bit_Group55.vhd`

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity And_2bit_Group55 is
    port(
        A, B : in  std_logic;
        Y    : out std_logic
    );
end entity;

architecture rtl of And_2bit_Group55 is
begin
    Y <= A and B;
end architecture;
```

**测试要点**：
- [ ] 00→0, 01→0, 10→0, 11→1

---

## 第二步：Full_adder 模块

**文件**：`Full_adder_Group55.vhd`

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adder_Group55 is
    port(
        A, B, Cin : in  std_logic;
        Sum, Cout : out std_logic
    );
end entity;

architecture rtl of Full_adder_Group55 is
begin
    -- 必须使用 AND, OR, XOR 门实现
    Sum  <= A xor B xor Cin;
    Cout <= (A and B) or (Cin and (A xor B));
end architecture;
```

**测试要点**：
- [ ] 测试全部8种输入组合（000~111）
- [ ] 验证进位链正确

---

## 第三步：Multiplier_4bit 模块

**文件**：`Multiplier_4bit_Group55.vhd`

**关键要求**：
- 必须使用 `component` 和 `port map` 实例化子模块
- 需要16个 And_2bit 生成部分积
- 需要多个 Full_adder 进行累加

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplier_4bit_Group55 is
    port(
        A, B    : in  std_logic_vector(3 downto 0);
        Product : out std_logic_vector(7 downto 0)
    );
end entity;

architecture structural of Multiplier_4bit_Group55 is
    component And_2bit_Group55 is
        port(A, B : in std_logic; Y : out std_logic);
    end component;
    
    component Full_adder_Group55 is
        port(A, B, Cin : in std_logic; Sum, Cout : out std_logic);
    end component;
    
    -- 部分积信号
    signal pp : std_logic_vector(15 downto 0);
    -- 中间进位和求和信号...
begin
    -- 生成部分积：pp(i*4+j) = A(i) and B(j)
    -- 使用全加器阵列累加部分积
end architecture;
```

**测试要点**：
- [ ] 0×0=0, 1×1=1
- [ ] 15×15=225, 7×8=56
- [ ] 3×5=15, 12×11=132

---

## 第四步：RipSub_4bit 模块

**文件**：`RipSub_4bit_Group55.vhd`

**实现原理**：A - B = A + (~B) + 1（补码减法）

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;

entity RipSub_4bit_Group55 is
    port(
        A, B : in  std_logic_vector(3 downto 0);
        Diff : out std_logic_vector(3 downto 0);
        Bout : out std_logic
    );
end entity;

architecture structural of RipSub_4bit_Group55 is
    component Full_adder_Group55 is
        port(A, B, Cin : in std_logic; Sum, Cout : out std_logic);
    end component;
    
    signal B_inv : std_logic_vector(3 downto 0);
    signal carry : std_logic_vector(4 downto 0);
begin
    B_inv <= not B;  -- 取反
    carry(0) <= '1'; -- +1（初始进位）
    
    -- 4个全加器级联
    GEN: for i in 0 to 3 generate
        FA: Full_adder_Group55 port map(
            A => A(i), B => B_inv(i), Cin => carry(i),
            Sum => Diff(i), Cout => carry(i+1)
        );
    end generate;
    
    Bout <= not carry(4); -- 借位 = 无进位
end architecture;
```

**测试要点**：
- [ ] 5-3=2, 10-7=3
- [ ] 3-5=14（下溢）, 0-1=15
- [ ] 15-15=0, 8-8=0

---

## 第五步：LongDivision_4bit 模块

**文件**：`LongDivision_4bit_Group55.vhd`

**关键要求**：
- 必须有 CLK 和 Load 信号
- 使用 process + if 语句
- 可用 `std_logic_unsigned` 仅限计数器增减

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  -- 仅用于计数器

entity LongDivision_4bit_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);
        Divisor   : in  std_logic_vector(3 downto 0);
        CLK       : in  std_logic;
        Load      : in  std_logic;
        Quotient  : out std_logic_vector(3 downto 0);
        Remainder : out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of LongDivision_4bit_Group55 is
    -- 实例化子模块
    component Multiplier_4bit_Group55 is ... end component;
    component RipSub_4bit_Group55 is ... end component;
    
    signal counter : std_logic_vector(3 downto 0);
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                -- 加载新数据，重置计数器
            else
                -- 长除法逻辑
                -- 可使用: counter <= counter + 1;
            end if;
        end if;
    end process;
end architecture;
```

**测试要点**：
- [ ] 15÷3=5余0, 13÷4=3余1
- [ ] 7÷2=3余1, 5÷7=0余5
- [ ] 0÷5=0余0, 除以0处理

---

## 第六步：Prime_Finder 顶层模块

**文件**：`Prime_Finder_Group55.vhd`

**质数判断逻辑**（0-15范围）：
- 质数：2, 3, 5, 7, 11, 13
- 非质数：0, 1, 4, 6, 8, 9, 10, 12, 14, 15

```vhdl
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);
        Divisor   : in  std_logic_vector(3 downto 0);
        CLK       : in  std_logic;
        Load      : in  std_logic;
        Q_out     : out std_logic_vector(3 downto 0);
        R_out     : out std_logic_vector(3 downto 0);
        Is_Prime  : out std_logic
    );
end entity;

architecture rtl of Prime_Finder_Group55 is
    component LongDivision_4bit_Group55 is ... end component;
begin
    -- 实例化除法器
    -- 实现质数判断状态机
end architecture;
```

**测试要点**：
- [ ] Is_Prime=1：2,3,5,7,11,13
- [ ] Is_Prime=0：0,1,4,6,8,9,10,12,14,15

---

## 第七步：七段显示器驱动

**功能**：将4位二进制转为十进制显示

| 输入 | HEX1(十位) | HEX0(个位) |
|------|------------|------------|
| 0-9  | 显示0      | 显示0-9    |
| 10-15| 显示1      | 显示0-5    |

**七段编码**（共阳极，低电平有效）：
```
0: 1000000  1: 1111001  2: 0100100  3: 0110000  4: 0011001
5: 0010010  6: 0000010  7: 1111000  8: 0000000  9: 0010000
```

---

## 第八步：引脚分配

在 `Prime_Finder.qsf` 中配置：

| 信号 | DE10-Lite引脚 | 说明 |
|------|---------------|------|
| CLK | PIN_P11 | MAX10_CLK1_50 |
| Dividend[3:0] | PIN_A12,B12,A13,A14 | SW7-SW4 |
| Divisor[3:0] | PIN_C10,C11,D12,C12 | SW3-SW0 |
| Load | PIN_B14 | SW9 |
| Is_Prime | PIN_B11 | LED9 |
| HEX0[6:0] | PIN_C14-C17,D17,E16,C16 | 个位(Q) |
| HEX1[6:0] | ... | 十位(Q) |
| HEX4[6:0] | ... | 个位(R) |
| HEX5[6:0] | ... | 十位(R) |

---

## 第九步：编译与板级测试

1. **Quartus编译**
   - [ ] Analysis & Synthesis 通过
   - [ ] Fitter 通过
   - [ ] 无严重警告

2. **下载到DE10-Lite**
   - [ ] Programmer连接成功
   - [ ] 下载.sof文件

3. **功能验证**
   - [ ] SW输入正确响应
   - [ ] 七段显示器显示十进制
   - [ ] LED9质数指示正确

---

## 第十步：录制演示视频

视频内容：
1. [ ] 展示6个模块VHDL代码
2. [ ] 展示ModelSim仿真波形
3. [ ] 演示DE10-Lite运行
4. [ ] 测试质数和非质数输入

---

## 进度检查清单

| 步骤 | 任务 | 状态 |
|------|------|------|
| 1 | And_2bit 完成并测试 | ⬜ |
| 2 | Full_adder 完成并测试 | ⬜ |
| 3 | Multiplier_4bit 完成并测试 | ⬜ |
| 4 | RipSub_4bit 完成并测试 | ⬜ |
| 5 | LongDivision_4bit 完成并测试 | ⬜ |
| 6 | Prime_Finder 完成并测试 | ⬜ |
| 7 | 七段显示器驱动完成 | ⬜ |
| 8 | 引脚分配完成 | ⬜ |
| 9 | 板级测试通过 | ⬜ |
| 10 | 演示视频录制 | ⬜ |

**状态**：⬜ 未开始 | 🔄 进行中 | ✅ 已完成
