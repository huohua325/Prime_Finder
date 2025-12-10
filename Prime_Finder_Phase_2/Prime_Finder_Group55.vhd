--------------------------------------------------------------------------------
-- Module Name: Prime_Finder_Group55
-- Description: Top-level module to determine if a 4-bit binary number is prime
-- Design Requirements:
--   1. Must have CLK and Load signals
--   2. Calls LongDivision_4bit submodule
--   3. Checks divider quotient and remainder to determine primality
-- Hierarchy: Prime_Finder is parent of LongDivision_4bit (top-level module)
--
-- Prime Detection Logic (using divider results):
--   Primes in 4-bit range 0-15: 2, 3, 5, 7, 11, 13
--
-- Detection Method:
--   1. If N < 2, not prime (0, 1)
--   2. If N = 2, is prime
--   3. Check division results:
--      - If remainder=0 and quotient>1 and divisor>1 and divisor<N, N is divisible, not prime
--      - Otherwise, based on current division result, may be prime
--
-- Usage:
--   User sets dividend and divisor, observes:
--   - If remainder R_out=0 and quotient Q_out>1, divisible, Is_Prime=0
--   - User can manually test divisors 2,3,4... to verify primality
--
-- Interface:
--   Dividend: Number to check (connected to SW7-SW4)
--   Divisor:  Test divisor (connected to SW3-SW0)
--   Load:     Load new data (connected to SW9)
--   CLK:      Clock signal (connected to MAX10_CLK1_50)
--   Q_out:    Quotient output (displayed on HEX0-HEX1)
--   R_out:    Remainder output (displayed on HEX4-HEX5)
--   Is_Prime: Prime flag (connected to LED9)
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  -- For comparison operations

entity Prime_Finder_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- Number to check
        Divisor   : in  std_logic_vector(3 downto 0);  -- Divisor input
        CLK       : in  std_logic;                      -- Clock signal
        Load      : in  std_logic;                      -- Load signal
        Q_out     : out std_logic_vector(3 downto 0);  -- Quotient output
        R_out     : out std_logic_vector(3 downto 0);  -- Remainder output
        Is_Prime  : out std_logic                       -- Prime flag (1=is prime)
    );
end entity Prime_Finder_Group55;

architecture rtl of Prime_Finder_Group55 is

    ---------------------------------------------------------------------------
    -- Submodule Declaration: Long Divider
    ---------------------------------------------------------------------------
    component LongDivision_4bit_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0);
            Done      : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- Internal Signals
    ---------------------------------------------------------------------------
    -- Divider outputs
    signal div_quotient  : std_logic_vector(3 downto 0);
    signal div_remainder : std_logic_vector(3 downto 0);
    
    -- Prime detection related signals
    signal is_divisible    : std_logic;  -- Divisible flag
    signal special_case    : std_logic;  -- Special case (0, 1, or invalid divisor)
    signal prime_result    : std_logic;
    
begin

    ---------------------------------------------------------------------------
    -- Instantiate Long Divider
    ---------------------------------------------------------------------------
    DIVIDER: LongDivision_4bit_Group55 port map(
        Dividend  => Dividend,
        Divisor   => Divisor,
        CLK       => CLK,
        Load      => Load,
        Quotient  => div_quotient,
        Remainder => div_remainder,
        Done      => open  -- Phase 1 does not use Done signal
    );

    ---------------------------------------------------------------------------
    -- Output Quotient and Remainder (for user to observe division results)
    ---------------------------------------------------------------------------
    Q_out <= div_quotient;
    R_out <= div_remainder;

    ---------------------------------------------------------------------------
    -- Prime Detection Logic (based on divider quotient and remainder)
    ---------------------------------------------------------------------------
    
    -- Check if divisible:
    -- Condition: remainder=0 and quotient>1 and divisor>1 and divisor<dividend
    -- This means Dividend = Divisor × Quotient, and not trivial factor (1 or itself)
    DIVISIBILITY_CHECK: process(div_remainder, div_quotient, Divisor, Dividend)
    begin
        if div_remainder = "0000" and      -- Remainder is 0 (divisible)
           div_quotient > "0001" and       -- Quotient > 1 (not dividing by itself)
           Divisor > "0001" and            -- Divisor > 1 (not dividing by 1)
           Divisor < Dividend then         -- Divisor < Dividend (valid factor)
            is_divisible <= '1';           -- Found non-trivial factor, not prime
        else
            is_divisible <= '0';
        end if;
    end process DIVISIBILITY_CHECK;
    
    -- Handle special cases: 0 and 1 are not prime
    SPECIAL_CASE_CHECK: process(Dividend)
    begin
        if Dividend = "0000" or Dividend = "0001" then
            special_case <= '1';  -- 0 and 1 are not prime
        else
            special_case <= '0';
        end if;
    end process SPECIAL_CASE_CHECK;
    
    -- Final prime determination:
    -- Is_Prime = 1 if and only if:
    --   1. Not a special case (not 0 or 1)
    --   2. Current division did not find non-trivial factor
    -- Note: User needs to test multiple divisors (2,3,4...) for complete verification
    prime_result <= '1' when (special_case = '0' and is_divisible = '0') else '0';
    
    -- Output prime detection result
    Is_Prime <= prime_result;

end architecture rtl;
