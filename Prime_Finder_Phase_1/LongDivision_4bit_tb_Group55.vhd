--------------------------------------------------------------------------------
-- Testbench: LongDivision_4bit_Group55
-- Test key cases of the 4-bit divider
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity LongDivision_4bit_tb is
end entity LongDivision_4bit_tb;

architecture test of LongDivision_4bit_tb is

    -- Unit Under Test
    component LongDivision_4bit_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Test signals
    signal Dividend_tb  : std_logic_vector(3 downto 0) := "0000";
    signal Divisor_tb   : std_logic_vector(3 downto 0) := "0001";
    signal CLK_tb       : std_logic := '0';
    signal Load_tb      : std_logic := '0';
    signal Quotient_tb  : std_logic_vector(3 downto 0);
    signal Remainder_tb : std_logic_vector(3 downto 0);

    -- Clock period
    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instantiate Unit Under Test
    UUT: LongDivision_4bit_Group55 port map(
        Dividend  => Dividend_tb,
        Divisor   => Divisor_tb,
        CLK       => CLK_tb,
        Load      => Load_tb,
        Quotient  => Quotient_tb,
        Remainder => Remainder_tb
    );

    -- Clock generation
    CLK_GEN: process
    begin
        CLK_tb <= '0'; wait for CLK_PERIOD/2;
        CLK_tb <= '1'; wait for CLK_PERIOD/2;
    end process CLK_GEN;

    -- Test process (simplified version - 4 typical examples, suitable for video demo)
    -- Total time approximately 800ns
    STIM: process
    begin
        wait for CLK_PERIOD * 2;  -- 40ns initialization
        
        -- Test 1: 15 / 3 = 5 remainder 0 (exact division)
        Dividend_tb <= "1111"; Divisor_tb <= "0011";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 10;
        
        -- Test 2: 7 / 2 = 3 remainder 1 (with remainder)
        Dividend_tb <= "0111"; Divisor_tb <= "0010";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -- Test 3: 5 / 7 = 0 remainder 5 (dividend < divisor)
        Dividend_tb <= "0101"; Divisor_tb <= "0111";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 6;
        
        -- Test 4: 8 / 0 = 15 remainder 8 (divide by zero)
        Dividend_tb <= "1000"; Divisor_tb <= "0000";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 6;
        
        -- Test complete
        wait;
    end process STIM;

end architecture test;
