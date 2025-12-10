--------------------------------------------------------------------------------
-- Module Name: RipSub_4bit_Group55
-- Description: 4-bit ripple subtractor, computes A - B (dataflow implementation)
-- Design Requirements: Must use AND, OR, XOR, NOT logic gates
-- Hierarchy: Independent module, called by LongDivision_4bit
--
-- Implementation Principle: Two's complement subtraction
--   A - B = A + (~B) + 1
--   Where Bn = NOT(B) is bitwise inversion of B
--   C(0) = '1' implements +1
--
-- Carry Formula (full adder carry expansion):
--   C(i+1) = (A(i) AND Bn(i)) OR (A(i) AND C(i)) OR (Bn(i) AND C(i))
--
-- Difference Formula:
--   Diff = A XOR Bn XOR C
--
-- Borrow Output:
--   Bout = NOT(COUT), no carry means has borrow
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity RipSub_4bit_Group55 is
    port(
        A    : in  std_logic_vector(3 downto 0);  -- Minuend
        B    : in  std_logic_vector(3 downto 0);  -- Subtrahend
        Diff : out std_logic_vector(3 downto 0);  -- Difference (A - B)
        Bout : out std_logic                       -- Borrow output (1 means borrow, i.e., A<B)
    );
end entity RipSub_4bit_Group55;

architecture dataflow of RipSub_4bit_Group55 is
    -- Bn: Bitwise inversion of B
    signal Bn : std_logic_vector(3 downto 0);
    
    -- C: Carry chain (C(0) to C(3) are intermediate carries, COUT is the final carry)
    signal C : std_logic_vector(3 downto 0);
    signal COUT : std_logic;
begin
    ---------------------------------------------------------------------------
    -- Step 1: Bitwise inversion of B
    ---------------------------------------------------------------------------
    Bn <= not B;
    
    ---------------------------------------------------------------------------
    -- Step 2: Calculate carry chain
    -- C(0) = '1' implements +1 for 2's complement
    -- C(i+1) = (A(i) AND Bn(i)) OR (A(i) AND C(i)) OR (Bn(i) AND C(i))
    ---------------------------------------------------------------------------
    C(0) <= '1';  -- extra '1' for 2's complement
    C(1) <= (A(0) and Bn(0)) or (A(0) and C(0)) or (Bn(0) and C(0));
    C(2) <= (A(1) and Bn(1)) or (A(1) and C(1)) or (Bn(1) and C(1));
    C(3) <= (A(2) and Bn(2)) or (A(2) and C(2)) or (Bn(2) and C(2));
    COUT <= (A(3) and Bn(3)) or (A(3) and C(3)) or (Bn(3) and C(3));
    
    ---------------------------------------------------------------------------
    -- 第三步: 计算差值
    -- Diff = A XOR Bn XOR C
    ---------------------------------------------------------------------------
    Diff <= A xor Bn xor C;
    
    ---------------------------------------------------------------------------
    -- 第四步: 借位输出
    -- 在补码减法中: 有进位(COUT=1)表示A>=B，无进位(COUT=0)表示A<B
    ---------------------------------------------------------------------------
    Bout <= not COUT;

end architecture dataflow;
