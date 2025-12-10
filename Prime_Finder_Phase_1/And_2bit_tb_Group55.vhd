--------------------------------------------------------------------------------
-- Testbench: And_2bit_Group55
-- Test all input combinations of the 2-bit AND gate
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity And_2bit_tb is
end entity And_2bit_tb;

architecture test of And_2bit_tb is

    -- Unit Under Test
    component And_2bit_Group55 is
        port(
            A : in  std_logic;
            B : in  std_logic;
            Y : out std_logic
        );
    end component;

    -- Test signals
    signal A_tb, B_tb : std_logic := '0';
    signal Y_tb       : std_logic;

begin

    -- Instantiate Unit Under Test
    UUT: And_2bit_Group55 port map(
        A => A_tb,
        B => B_tb,
        Y => Y_tb
    );

    -- Test process
    STIM: process
    begin
        -- Test all 4 input combinations
        A_tb <= '0'; B_tb <= '0'; wait for 10 ns;  -- Expected Y=0
        A_tb <= '0'; B_tb <= '1'; wait for 10 ns;  -- Expected Y=0
        A_tb <= '1'; B_tb <= '0'; wait for 10 ns;  -- Expected Y=0
        A_tb <= '1'; B_tb <= '1'; wait for 10 ns;  -- Expected Y=1
        
        -- Test complete
        wait;
    end process STIM;

end architecture test;
