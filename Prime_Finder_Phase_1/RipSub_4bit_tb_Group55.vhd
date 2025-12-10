--------------------------------------------------------------------------------
-- Testbench: RipSub_4bit_Group55
-- Test key cases of the 4-bit subtractor
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity RipSub_4bit_tb is
end entity RipSub_4bit_tb;

architecture test of RipSub_4bit_tb is

    -- Unit Under Test
    component RipSub_4bit_Group55 is
        port(
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            Diff : out std_logic_vector(3 downto 0);
            Bout : out std_logic
        );
    end component;

    -- Test signals
    signal A_tb, B_tb   : std_logic_vector(3 downto 0) := "0000";
    signal Diff_tb      : std_logic_vector(3 downto 0);
    signal Bout_tb      : std_logic;

begin

    -- Instantiate Unit Under Test
    UUT: RipSub_4bit_Group55 port map(
        A    => A_tb,
        B    => B_tb,
        Diff => Diff_tb,
        Bout => Bout_tb
    );

    -- Test process (simplified version - 4 typical examples, suitable for video demo)
    -- Total time approximately 100ns
    STIM: process
    begin
        -- Test 1: 10 - 7 = 3, Bout=0 (normal subtraction)
        A_tb <= "1010"; B_tb <= "0111"; wait for 20 ns;
        
        -- Test 2: 3 - 5 = 14, Bout=1 (borrow/underflow)
        A_tb <= "0011"; B_tb <= "0101"; wait for 20 ns;
        
        -- Test 3: 15 - 15 = 0, Bout=0 (equal)
        A_tb <= "1111"; B_tb <= "1111"; wait for 20 ns;
        
        -- Test 4: 0 - 1 = 15, Bout=1 (boundary underflow)
        A_tb <= "0000"; B_tb <= "0001"; wait for 20 ns;
        
        -- Test complete
        wait;
    end process STIM;

end architecture test;
