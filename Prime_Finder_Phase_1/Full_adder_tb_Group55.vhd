--------------------------------------------------------------------------------
-- Testbench: Full_adder_Group55
-- Test all 8 input combinations of the full adder
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adder_tb is
end entity Full_adder_tb;

architecture test of Full_adder_tb is

    -- Unit Under Test
    component Full_adder_Group55 is
        port(
            A    : in  std_logic;
            B    : in  std_logic;
            Cin  : in  std_logic;
            Sum  : out std_logic;
            Cout : out std_logic
        );
    end component;

    -- Test signals
    signal A_tb, B_tb, Cin_tb : std_logic := '0';
    signal Sum_tb, Cout_tb   : std_logic;

begin

    -- Instantiate Unit Under Test
    UUT: Full_adder_Group55 port map(
        A    => A_tb,
        B    => B_tb,
        Cin  => Cin_tb,
        Sum  => Sum_tb,
        Cout => Cout_tb
    );

    -- Test process
    STIM: process
    begin
        -- Test all 8 input combinations
        -- A B Cin | Sum Cout
        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns;  -- 0+0+0=00
        A_tb <= '0'; B_tb <= '0'; Cin_tb <= '1'; wait for 10 ns;  -- 0+0+1=01
        A_tb <= '0'; B_tb <= '1'; Cin_tb <= '0'; wait for 10 ns;  -- 0+1+0=01
        A_tb <= '0'; B_tb <= '1'; Cin_tb <= '1'; wait for 10 ns;  -- 0+1+1=10
        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns;  -- 1+0+0=01
        A_tb <= '1'; B_tb <= '0'; Cin_tb <= '1'; wait for 10 ns;  -- 1+0+1=10
        A_tb <= '1'; B_tb <= '1'; Cin_tb <= '0'; wait for 10 ns;  -- 1+1+0=10
        A_tb <= '1'; B_tb <= '1'; Cin_tb <= '1'; wait for 10 ns;  -- 1+1+1=11
        
        -- Test complete
        wait;
    end process STIM;

end architecture test;
