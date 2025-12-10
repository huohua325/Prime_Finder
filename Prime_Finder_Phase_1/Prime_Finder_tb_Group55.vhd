--------------------------------------------------------------------------------
-- Testbench: Prime_Finder_Group55
-- Test prime number detector
-- 
-- Test Method:
--   New prime detection logic based on divider's quotient and remainder
--   Need to test different dividend and divisor combinations to verify:
--   1. Division results are correct
--   2. When factor found, Is_Prime=0
--   3. When no factor found, Is_Prime=1
--   4. Special cases (0, 1) handled correctly
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_tb is
end entity Prime_Finder_tb;

architecture test of Prime_Finder_tb is

    -- Unit Under Test
    component Prime_Finder_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Q_out     : out std_logic_vector(3 downto 0);
            R_out     : out std_logic_vector(3 downto 0);
            Is_Prime  : out std_logic
        );
    end component;

    -- Test signals
    signal Dividend_tb : std_logic_vector(3 downto 0) := "0000";
    signal Divisor_tb  : std_logic_vector(3 downto 0) := "0010";
    signal CLK_tb      : std_logic := '0';
    signal Load_tb     : std_logic := '0';
    signal Q_out_tb    : std_logic_vector(3 downto 0);
    signal R_out_tb    : std_logic_vector(3 downto 0);
    signal Is_Prime_tb : std_logic;

    -- Clock period
    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instantiate Unit Under Test
    UUT: Prime_Finder_Group55 port map(
        Dividend  => Dividend_tb,
        Divisor   => Divisor_tb,
        CLK       => CLK_tb,
        Load      => Load_tb,
        Q_out     => Q_out_tb,
        R_out     => R_out_tb,
        Is_Prime  => Is_Prime_tb
    );

    -- Clock generation
    CLK_GEN: process
    begin
        CLK_tb <= '0'; wait for CLK_PERIOD/2;
        CLK_tb <= '1'; wait for CLK_PERIOD/2;
    end process CLK_GEN;

    -- Test process (simplified version - 5 typical examples, suitable for video demo)
    -- Total time approximately 1200ns
    STIM: process
    begin
        wait for CLK_PERIOD * 2;  -- 40ns initialization
        
        -----------------------------------------------------------------------
        -- Test 1: Special case - 1 is not prime
        -- Expected: Is_Prime = 0
        -----------------------------------------------------------------------
        Dividend_tb <= "0001"; Divisor_tb <= "0010";  -- 1 / 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- Test 2: Non-prime 6 / 2 = 3 remainder 0 (factor found)
        -- Expected: Q=3, R=0, Is_Prime=0
        -----------------------------------------------------------------------
        Dividend_tb <= "0110"; Divisor_tb <= "0010";  -- 6 / 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- Test 3: Prime 7 / 2 = 3 remainder 1 (not divisible)
        -- Expected: Q=3, R=1, Is_Prime=1
        -----------------------------------------------------------------------
        Dividend_tb <= "0111"; Divisor_tb <= "0010";  -- 7 / 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- Test 4: Non-prime 9 / 3 = 3 remainder 0 (factor found)
        -- Expected: Q=3, R=0, Is_Prime=0
        -----------------------------------------------------------------------
        Dividend_tb <= "1001"; Divisor_tb <= "0011";  -- 9 / 3
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- Test 5: Prime 13 / 2 = 6 remainder 1 (not divisible)
        -- Expected: Q=6, R=1, Is_Prime=1
        -----------------------------------------------------------------------
        Dividend_tb <= "1101"; Divisor_tb <= "0010";  -- 13 / 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 10;
        
        -- Test complete
        wait;
    end process STIM;

end architecture test;
