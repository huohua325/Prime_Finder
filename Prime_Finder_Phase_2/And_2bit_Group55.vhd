--------------------------------------------------------------------------------
-- Module Name: And_2bit_Group55
-- Description: 2-input AND gate
-- Design Requirements: Basic logic gate
-- Hierarchy: Called by Multiplier_4bit
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity And_2bit_Group55 is
    port(
        A : in  std_logic;  -- Input A
        B : in  std_logic;  -- Input B
        Y : out std_logic   -- Output Y = A AND B
    );
end entity And_2bit_Group55;

architecture rtl of And_2bit_Group55 is
begin
    -- AND gate logic
    Y <= A and B;
end architecture rtl;
