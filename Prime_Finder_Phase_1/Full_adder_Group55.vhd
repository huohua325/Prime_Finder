--------------------------------------------------------------------------------
-- Module Name: Full_adder_Group55
-- Description: Full adder, adds two single bits with carry input
-- Design Requirement: Must be built using AND, OR, XOR logic gates
-- Hierarchy: Sub-module, called by Multiplier_4bit and RipSub_4bit
-- Truth Table:
--   A B Cin | Sum Cout
--   0 0  0  |  0   0
--   0 0  1  |  1   0
--   0 1  0  |  1   0
--   0 1  1  |  0   1
--   1 0  0  |  1   0
--   1 0  1  |  0   1
--   1 1  0  |  0   1
--   1 1  1  |  1   1
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adder_Group55 is
    port(
        A    : in  std_logic;  -- Addend A
        B    : in  std_logic;  -- Addend B
        Cin  : in  std_logic;  -- Carry input
        Sum  : out std_logic;  -- Sum output
        Cout : out std_logic   -- Carry output
    );
end entity Full_adder_Group55;

architecture rtl of Full_adder_Group55 is
begin
    -- Sum = A XOR B XOR Cin
    -- Sum is 1 when there is an odd number of 1s in inputs
    Sum <= A xor B xor Cin;
    
    -- Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)
    -- Carry is generated when at least two inputs are 1
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture rtl;
