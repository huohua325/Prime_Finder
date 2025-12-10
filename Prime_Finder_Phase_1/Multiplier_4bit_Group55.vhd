--------------------------------------------------------------------------------
-- Module Name: Multiplier_4bit_Group55
-- Description: 4-bit array multiplier, multiplies two 4-bit binary numbers to produce 8-bit result
-- Design Requirement: Must use component and port map to instantiate And_2bit and Full_adder
-- Hierarchy: Multiplier_4bit is parent of And_2bit and Full_adder
-- Reference: EBU6335-24_20-Arithmetic, slide 24
--
-- Slide diagram structure (4x4 array multiplier):
--
--                A3    A2    A1    A0
--                 |     |     |     |
--                AND   AND   AND   AND  <- B0
--                 |     |     |     |
--           '0'  PP03  PP02  PP01  PP00 ──────────────────────→ S0
--            |    |     |     |     |
--           [FA]-[FA]-[FA]-[FA]   AND  <- B1 (Row 1 FA)
--            |    |     |     |     |
--           C14  S13   S12   S11   PP10 ---------------------> S1
--            |    |     |     |     |
--           [FA]-[FA]-[FA]-[FA]   AND  <- B2 (Row 2 FA)
--            |    |     |     |     |
--           C24  S23   S22   S21   PP20 ---------------------> S2
--            |    |     |     |     |
--           [FA]-[FA]-[FA]-[FA]   AND  <- B3 (Row 3 FA)
--            |    |     |     |     |
--            S7   S6    S5    S4    S3 ---------------------> S3
--
-- Each FA connection:
--   - A input: Sum output from previous row (or partial product)
--   - B input: Current row's partial product (A(i) AND B(row))
--   - Cin: Cout from right FA (rightmost FA's Cin='0')
--   - Cout: Passed to left FA's Cin
--   - Sum: Passed to corresponding position FA in next row (or direct output)
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Multiplier_4bit_Group55 is
    port(
        A       : in  std_logic_vector(3 downto 0);  -- Multiplicand (4-bit)
        B       : in  std_logic_vector(3 downto 0);  -- Multiplier (4-bit)
        Product : out std_logic_vector(7 downto 0)   -- Product (8-bit)
    );
end entity Multiplier_4bit_Group55;

architecture structural of Multiplier_4bit_Group55 is

    -- Sub-module declaration: 2-bit AND gate
    component And_2bit_Group55 is
        port(
            A : in  std_logic;
            B : in  std_logic;
            Y : out std_logic
        );
    end component;

    -- Sub-module declaration: Full adder
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
    -- Partial product signals: PP_ij = A(j) AND B(i)
    -- Corresponds to each AND gate output in the slide diagram
    ---------------------------------------------------------------------------
    signal PP_00, PP_01, PP_02, PP_03 : std_logic;  -- B0 row: A(j) AND B(0)
    signal PP_10, PP_11, PP_12, PP_13 : std_logic;  -- B1 row: A(j) AND B(1)
    signal PP_20, PP_21, PP_22, PP_23 : std_logic;  -- B2 row: A(j) AND B(2)
    signal PP_30, PP_31, PP_32, PP_33 : std_logic;  -- B3 row: A(j) AND B(3)
    
    ---------------------------------------------------------------------------
    -- Row 1 FA output signals (corresponds to slide diagram Row1)
    ---------------------------------------------------------------------------
    signal S1_0, S1_1, S1_2, S1_3 : std_logic;  -- Sum output
    signal C1_0, C1_1, C1_2, C1_3 : std_logic;  -- Carry output
    
    ---------------------------------------------------------------------------
    -- Row 2 FA output signals (corresponds to slide diagram Row2)
    ---------------------------------------------------------------------------
    signal S2_0, S2_1, S2_2, S2_3 : std_logic;  -- Sum output
    signal C2_0, C2_1, C2_2, C2_3 : std_logic;  -- Carry output
    
    ---------------------------------------------------------------------------
    -- Row 3 FA output signals (corresponds to slide diagram Row3)
    ---------------------------------------------------------------------------
    signal S3_0, S3_1, S3_2, S3_3 : std_logic;  -- Sum output
    signal C3_0, C3_1, C3_2, C3_3 : std_logic;  -- Carry output

begin

    ---------------------------------------------------------------------------
    -- Generate all partial products (16 AND gates)
    -- PP_ij = A(j) AND B(i)
    ---------------------------------------------------------------------------
    
    -- B0 row: PP_0j = A(j) AND B(0)
    AND_00: And_2bit_Group55 port map(A => A(0), B => B(0), Y => PP_00);
    AND_01: And_2bit_Group55 port map(A => A(1), B => B(0), Y => PP_01);
    AND_02: And_2bit_Group55 port map(A => A(2), B => B(0), Y => PP_02);
    AND_03: And_2bit_Group55 port map(A => A(3), B => B(0), Y => PP_03);
    
    -- B1 row: PP_1j = A(j) AND B(1)
    AND_10: And_2bit_Group55 port map(A => A(0), B => B(1), Y => PP_10);
    AND_11: And_2bit_Group55 port map(A => A(1), B => B(1), Y => PP_11);
    AND_12: And_2bit_Group55 port map(A => A(2), B => B(1), Y => PP_12);
    AND_13: And_2bit_Group55 port map(A => A(3), B => B(1), Y => PP_13);
    
    -- B2 row: PP_2j = A(j) AND B(2)
    AND_20: And_2bit_Group55 port map(A => A(0), B => B(2), Y => PP_20);
    AND_21: And_2bit_Group55 port map(A => A(1), B => B(2), Y => PP_21);
    AND_22: And_2bit_Group55 port map(A => A(2), B => B(2), Y => PP_22);
    AND_23: And_2bit_Group55 port map(A => A(3), B => B(2), Y => PP_23);
    
    -- B3 row: PP_3j = A(j) AND B(3)
    AND_30: And_2bit_Group55 port map(A => A(0), B => B(3), Y => PP_30);
    AND_31: And_2bit_Group55 port map(A => A(1), B => B(3), Y => PP_31);
    AND_32: And_2bit_Group55 port map(A => A(2), B => B(3), Y => PP_32);
    AND_33: And_2bit_Group55 port map(A => A(3), B => B(3), Y => PP_33);

    ---------------------------------------------------------------------------
    -- S0: Direct output PP_00
    ---------------------------------------------------------------------------
    Product(0) <= PP_00;

    ---------------------------------------------------------------------------
    -- Row 1 FA (Row 1): Process B1 row
    -- Corresponds to 4 FAs from right to left in slide diagram
    -- Carry direction: right->left (C1_0 -> C1_1 -> C1_2 -> C1_3)
    ---------------------------------------------------------------------------
    
    -- FA1_0 (rightmost): A=PP_01, B=PP_10, Cin='0'
    FA1_0: Full_adder_Group55 port map(
        A    => PP_01,
        B    => PP_10,
        Cin  => '0',
        Sum  => S1_0,      -- -> S1 output
        Cout => C1_0       -- -> FA1_1's Cin
    );
    
    -- FA1_1: A=PP_02, B=PP_11, Cin=C1_0
    FA1_1: Full_adder_Group55 port map(
        A    => PP_02,
        B    => PP_11,
        Cin  => C1_0,
        Sum  => S1_1,      -- -> Next row FA2_0's A input
        Cout => C1_1       -- -> FA1_2's Cin
    );
    
    -- FA1_2: A=PP_03, B=PP_12, Cin=C1_1
    FA1_2: Full_adder_Group55 port map(
        A    => PP_03,
        B    => PP_12,
        Cin  => C1_1,
        Sum  => S1_2,      -- -> Next row FA2_1's A input
        Cout => C1_2       -- -> FA1_3's Cin
    );
    
    -- FA1_3 (leftmost): A='0', B=PP_13, Cin=C1_2
    FA1_3: Full_adder_Group55 port map(
        A    => '0',
        B    => PP_13,
        Cin  => C1_2,
        Sum  => S1_3,      -- -> Next row FA2_2's A input
        Cout => C1_3       -- -> Next row FA2_3's A input
    );
    
    -- S1 output
    Product(1) <= S1_0;

    ---------------------------------------------------------------------------
    -- Row 2 FA (Row 2): Process B2 row
    -- A input from previous row's Sum/Cout, B input is PP_2j
    ---------------------------------------------------------------------------
    
    -- FA2_0 (rightmost): A=S1_1, B=PP_20, Cin='0'
    FA2_0: Full_adder_Group55 port map(
        A    => S1_1,
        B    => PP_20,
        Cin  => '0',
        Sum  => S2_0,      -- -> S2 output
        Cout => C2_0       -- -> FA2_1's Cin
    );
    
    -- FA2_1: A=S1_2, B=PP_21, Cin=C2_0
    FA2_1: Full_adder_Group55 port map(
        A    => S1_2,
        B    => PP_21,
        Cin  => C2_0,
        Sum  => S2_1,      -- -> Next row FA3_0's A input
        Cout => C2_1       -- -> FA2_2's Cin
    );
    
    -- FA2_2: A=S1_3, B=PP_22, Cin=C2_1
    FA2_2: Full_adder_Group55 port map(
        A    => S1_3,
        B    => PP_22,
        Cin  => C2_1,
        Sum  => S2_2,      -- -> Next row FA3_1's A input
        Cout => C2_2       -- -> FA2_3's Cin
    );
    
    -- FA2_3 (leftmost): A=C1_3, B=PP_23, Cin=C2_2
    FA2_3: Full_adder_Group55 port map(
        A    => C1_3,
        B    => PP_23,
        Cin  => C2_2,
        Sum  => S2_3,      -- -> Next row FA3_2's A input
        Cout => C2_3       -- -> Next row FA3_3's A input
    );
    
    -- S2 output
    Product(2) <= S2_0;

    ---------------------------------------------------------------------------
    -- Row 3 FA (Row 3): Process B3 row (last row)
    -- A input from previous row's Sum/Cout, B input is PP_3j
    ---------------------------------------------------------------------------
    
    -- FA3_0 (rightmost): A=S2_1, B=PP_30, Cin='0'
    FA3_0: Full_adder_Group55 port map(
        A    => S2_1,
        B    => PP_30,
        Cin  => '0',
        Sum  => S3_0,      -- -> S3 output
        Cout => C3_0       -- -> FA3_1's Cin
    );
    
    -- FA3_1: A=S2_2, B=PP_31, Cin=C3_0
    FA3_1: Full_adder_Group55 port map(
        A    => S2_2,
        B    => PP_31,
        Cin  => C3_0,
        Sum  => S3_1,      -- -> S4 output
        Cout => C3_1       -- -> FA3_2's Cin
    );
    
    -- FA3_2: A=S2_3, B=PP_32, Cin=C3_1
    FA3_2: Full_adder_Group55 port map(
        A    => S2_3,
        B    => PP_32,
        Cin  => C3_1,
        Sum  => S3_2,      -- -> S5 output
        Cout => C3_2       -- -> FA3_3's Cin
    );
    
    -- FA3_3 (leftmost): A=C2_3, B=PP_33, Cin=C3_2
    FA3_3: Full_adder_Group55 port map(
        A    => C2_3,
        B    => PP_33,
        Cin  => C3_2,
        Sum  => S3_3,      -- -> S6 output
        Cout => Product(7) -- -> S7 output (MSB)
    );
    
    -- S3-S6 output
    Product(3) <= S3_0;
    Product(4) <= S3_1;
    Product(5) <= S3_2;
    Product(6) <= S3_3;

end architecture structural;
