--------------------------------------------------------------------------------
-- 模块名称: Multiplier_4bit_Group55
-- 功能描述: 4位阵列乘法器，将两个4位二进制数相乘产生8位结果
-- 设计要求: 必须使用component和port map实例化And_2bit和Full_adder
-- 层级关系: Multiplier_4bit是And_2bit和Full_adder的父级
-- 参考: EBU6335-24_20-Arithmetic, slide 24
--
-- 课件图结构 (4x4 阵列乘法器):
--
--                A3    A2    A1    A0
--                 |     |     |     |
--                AND   AND   AND   AND  ← B0
--                 |     |     |     |
--           '0'  PP03  PP02  PP01  PP00 ──────────────────────→ S0
--            |    |     |     |     |
--           [FA]─[FA]─[FA]─[FA]   AND  ← B1 (第1行FA)
--            |    |     |     |     |
--           C14  S13   S12   S11   PP10 ─────────────────────→ S1
--            |    |     |     |     |
--           [FA]─[FA]─[FA]─[FA]   AND  ← B2 (第2行FA)
--            |    |     |     |     |
--           C24  S23   S22   S21   PP20 ────────────────────→ S2
--            |    |     |     |     |
--           [FA]─[FA]─[FA]─[FA]   AND  ← B3 (第3行FA)
--            |    |     |     |     |
--            S7   S6    S5    S4    S3 ─────────────────────→ S3
--
-- 每个FA的连接:
--   - A输入: 上一行的Sum输出 (或部分积)
--   - B输入: 当前行的部分积 (A(i) AND B(row))
--   - Cin: 右边FA的Cout (最右边FA的Cin='0')
--   - Cout: 传给左边FA的Cin
--   - Sum: 传给下一行对应位置的FA (或直接输出)
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplier_4bit_Group55 is
    port(
        A       : in  std_logic_vector(3 downto 0);  -- 被乘数 (4位)
        B       : in  std_logic_vector(3 downto 0);  -- 乘数 (4位)
        Product : out std_logic_vector(7 downto 0)   -- 乘积 (8位)
    );
end entity Multiplier_4bit_Group55;

architecture structural of Multiplier_4bit_Group55 is

    -- 声明子模块: 2位与门
    component And_2bit_Group55 is
        port(
            A : in  std_logic;
            B : in  std_logic;
            Y : out std_logic
        );
    end component;

    -- 声明子模块: 全加器
    component Full_adder_Group55 is
        port(
            A    : in  std_logic;
            B    : in  std_logic;
            Cin  : in  std_logic;
            Sum  : out std_logic;
            Cout : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- 部分积信号: PP_ij = A(j) AND B(i)
    -- 对应课件图中每个AND门的输出
    ---------------------------------------------------------------------------
    signal PP_00, PP_01, PP_02, PP_03 : std_logic;  -- B0行: A(j) AND B(0)
    signal PP_10, PP_11, PP_12, PP_13 : std_logic;  -- B1行: A(j) AND B(1)
    signal PP_20, PP_21, PP_22, PP_23 : std_logic;  -- B2行: A(j) AND B(2)
    signal PP_30, PP_31, PP_32, PP_33 : std_logic;  -- B3行: A(j) AND B(3)
    
    ---------------------------------------------------------------------------
    -- 第1行FA的输出信号 (对应课件图Row1)
    ---------------------------------------------------------------------------
    signal S1_0, S1_1, S1_2, S1_3 : std_logic;  -- Sum输出
    signal C1_0, C1_1, C1_2, C1_3 : std_logic;  -- Carry输出
    
    ---------------------------------------------------------------------------
    -- 第2行FA的输出信号 (对应课件图Row2)
    ---------------------------------------------------------------------------
    signal S2_0, S2_1, S2_2, S2_3 : std_logic;  -- Sum输出
    signal C2_0, C2_1, C2_2, C2_3 : std_logic;  -- Carry输出
    
    ---------------------------------------------------------------------------
    -- 第3行FA的输出信号 (对应课件图Row3)
    ---------------------------------------------------------------------------
    signal S3_0, S3_1, S3_2, S3_3 : std_logic;  -- Sum输出
    signal C3_0, C3_1, C3_2, C3_3 : std_logic;  -- Carry输出

begin

    ---------------------------------------------------------------------------
    -- 生成所有部分积 (16个AND门)
    -- PP_ij = A(j) AND B(i)
    ---------------------------------------------------------------------------
    
    -- B0行: PP_0j = A(j) AND B(0)
    AND_00: And_2bit_Group55 port map(A => A(0), B => B(0), Y => PP_00);
    AND_01: And_2bit_Group55 port map(A => A(1), B => B(0), Y => PP_01);
    AND_02: And_2bit_Group55 port map(A => A(2), B => B(0), Y => PP_02);
    AND_03: And_2bit_Group55 port map(A => A(3), B => B(0), Y => PP_03);
    
    -- B1行: PP_1j = A(j) AND B(1)
    AND_10: And_2bit_Group55 port map(A => A(0), B => B(1), Y => PP_10);
    AND_11: And_2bit_Group55 port map(A => A(1), B => B(1), Y => PP_11);
    AND_12: And_2bit_Group55 port map(A => A(2), B => B(1), Y => PP_12);
    AND_13: And_2bit_Group55 port map(A => A(3), B => B(1), Y => PP_13);
    
    -- B2行: PP_2j = A(j) AND B(2)
    AND_20: And_2bit_Group55 port map(A => A(0), B => B(2), Y => PP_20);
    AND_21: And_2bit_Group55 port map(A => A(1), B => B(2), Y => PP_21);
    AND_22: And_2bit_Group55 port map(A => A(2), B => B(2), Y => PP_22);
    AND_23: And_2bit_Group55 port map(A => A(3), B => B(2), Y => PP_23);
    
    -- B3行: PP_3j = A(j) AND B(3)
    AND_30: And_2bit_Group55 port map(A => A(0), B => B(3), Y => PP_30);
    AND_31: And_2bit_Group55 port map(A => A(1), B => B(3), Y => PP_31);
    AND_32: And_2bit_Group55 port map(A => A(2), B => B(3), Y => PP_32);
    AND_33: And_2bit_Group55 port map(A => A(3), B => B(3), Y => PP_33);

    ---------------------------------------------------------------------------
    -- S0: 直接输出 PP_00
    ---------------------------------------------------------------------------
    Product(0) <= PP_00;

    ---------------------------------------------------------------------------
    -- 第1行FA (Row 1): 处理B1行
    -- 对应课件图从右到左的4个FA
    -- 进位方向: 右→左 (C1_0 → C1_1 → C1_2 → C1_3)
    ---------------------------------------------------------------------------
    
    -- FA1_0 (最右边): A=PP_01, B=PP_10, Cin='0'
    FA1_0: Full_adder_Group55 port map(
        A    => PP_01,
        B    => PP_10,
        Cin  => '0',
        Sum  => S1_0,      -- → S1 输出
        Cout => C1_0       -- → FA1_1的Cin
    );
    
    -- FA1_1: A=PP_02, B=PP_11, Cin=C1_0
    FA1_1: Full_adder_Group55 port map(
        A    => PP_02,
        B    => PP_11,
        Cin  => C1_0,
        Sum  => S1_1,      -- → 下一行FA2_0的A输入
        Cout => C1_1       -- → FA1_2的Cin
    );
    
    -- FA1_2: A=PP_03, B=PP_12, Cin=C1_1
    FA1_2: Full_adder_Group55 port map(
        A    => PP_03,
        B    => PP_12,
        Cin  => C1_1,
        Sum  => S1_2,      -- → 下一行FA2_1的A输入
        Cout => C1_2       -- → FA1_3的Cin
    );
    
    -- FA1_3 (最左边): A='0', B=PP_13, Cin=C1_2
    FA1_3: Full_adder_Group55 port map(
        A    => '0',
        B    => PP_13,
        Cin  => C1_2,
        Sum  => S1_3,      -- → 下一行FA2_2的A输入
        Cout => C1_3       -- → 下一行FA2_3的A输入
    );
    
    -- S1 输出
    Product(1) <= S1_0;

    ---------------------------------------------------------------------------
    -- 第2行FA (Row 2): 处理B2行
    -- A输入来自上一行的Sum/Cout, B输入是PP_2j
    ---------------------------------------------------------------------------
    
    -- FA2_0 (最右边): A=S1_1, B=PP_20, Cin='0'
    FA2_0: Full_adder_Group55 port map(
        A    => S1_1,
        B    => PP_20,
        Cin  => '0',
        Sum  => S2_0,      -- → S2 输出
        Cout => C2_0       -- → FA2_1的Cin
    );
    
    -- FA2_1: A=S1_2, B=PP_21, Cin=C2_0
    FA2_1: Full_adder_Group55 port map(
        A    => S1_2,
        B    => PP_21,
        Cin  => C2_0,
        Sum  => S2_1,      -- → 下一行FA3_0的A输入
        Cout => C2_1       -- → FA2_2的Cin
    );
    
    -- FA2_2: A=S1_3, B=PP_22, Cin=C2_1
    FA2_2: Full_adder_Group55 port map(
        A    => S1_3,
        B    => PP_22,
        Cin  => C2_1,
        Sum  => S2_2,      -- → 下一行FA3_1的A输入
        Cout => C2_2       -- → FA2_3的Cin
    );
    
    -- FA2_3 (最左边): A=C1_3, B=PP_23, Cin=C2_2
    FA2_3: Full_adder_Group55 port map(
        A    => C1_3,
        B    => PP_23,
        Cin  => C2_2,
        Sum  => S2_3,      -- → 下一行FA3_2的A输入
        Cout => C2_3       -- → 下一行FA3_3的A输入
    );
    
    -- S2 输出
    Product(2) <= S2_0;

    ---------------------------------------------------------------------------
    -- 第3行FA (Row 3): 处理B3行 (最后一行)
    -- A输入来自上一行的Sum/Cout, B输入是PP_3j
    ---------------------------------------------------------------------------
    
    -- FA3_0 (最右边): A=S2_1, B=PP_30, Cin='0'
    FA3_0: Full_adder_Group55 port map(
        A    => S2_1,
        B    => PP_30,
        Cin  => '0',
        Sum  => S3_0,      -- → S3 输出
        Cout => C3_0       -- → FA3_1的Cin
    );
    
    -- FA3_1: A=S2_2, B=PP_31, Cin=C3_0
    FA3_1: Full_adder_Group55 port map(
        A    => S2_2,
        B    => PP_31,
        Cin  => C3_0,
        Sum  => S3_1,      -- → S4 输出
        Cout => C3_1       -- → FA3_2的Cin
    );
    
    -- FA3_2: A=S2_3, B=PP_32, Cin=C3_1
    FA3_2: Full_adder_Group55 port map(
        A    => S2_3,
        B    => PP_32,
        Cin  => C3_1,
        Sum  => S3_2,      -- → S5 输出
        Cout => C3_2       -- → FA3_3的Cin
    );
    
    -- FA3_3 (最左边): A=C2_3, B=PP_33, Cin=C3_2
    FA3_3: Full_adder_Group55 port map(
        A    => C2_3,
        B    => PP_33,
        Cin  => C3_2,
        Sum  => S3_3,      -- → S6 输出
        Cout => Product(7) -- → S7 输出 (最高位)
    );
    
    -- S3-S6 输出
    Product(3) <= S3_0;
    Product(4) <= S3_1;
    Product(5) <= S3_2;
    Product(6) <= S3_3;

end architecture structural;
