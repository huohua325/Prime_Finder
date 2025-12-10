--------------------------------------------------------------------------------
-- Module Name: Prime_Finder_Parallel_Group55
-- Description: Parallel prime detector, using 3 dividers to test ÷2, ÷3, ÷5 simultaneously
-- Optimization: Phase 2 Optimization 1 - Parallel dividers
-- 
-- Principle:
--   Phase 1 has only 1 divider, needs to test each divisor serially
--   This module instantiates 3 independent dividers, testing 3 divisors simultaneously
--   Utilizes FPGA hardware parallelism, speed improves ~3x
--
-- Applicable Range:
--   For 4-bit numbers (0-15), only need to test divisors 2, 3, 5 to determine primality
--   Because sqrt(15) ≈ 3.87, only need to test primes not exceeding 4
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_Parallel_Group55 is
    port(
        N         : in  std_logic_vector(3 downto 0);  -- Number to check (0-15)
        CLK       : in  std_logic;                      -- Clock signal
        Load      : in  std_logic;                      -- Load signal
        Is_Prime  : out std_logic;                      -- Prime flag
        Done      : out std_logic;                      -- Detection complete flag
        Sub_Count : out std_logic_vector(7 downto 0)   -- Total subtraction count (NEW)
    );
end entity Prime_Finder_Parallel_Group55;

architecture rtl of Prime_Finder_Parallel_Group55 is

    ---------------------------------------------------------------------------
    -- Submodule Declaration: Reuse Phase 1 divider
    ---------------------------------------------------------------------------
    component LongDivision_4bit_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0);
            Done      : out std_logic;
            Sub_Count : out std_logic_vector(3 downto 0)
        );
    end component;

    ---------------------------------------------------------------------------
    -- Internal Signals
    ---------------------------------------------------------------------------
    -- Remainder outputs from 3 dividers
    signal R2, R3, R5 : std_logic_vector(3 downto 0);
    
    -- Done flags from 3 dividers
    signal Done2, Done3, Done5 : std_logic;
    
    -- All dividers complete flag
    signal all_done : std_logic;
    
    -- Prime determination result
    signal is_prime_internal : std_logic;
    
    -- Latched input value for judgment
    signal N_reg : std_logic_vector(3 downto 0);
    
    -- Subtraction counts from each divider (NEW)
    signal SC2, SC3, SC5 : std_logic_vector(3 downto 0);
    signal total_sub : std_logic_vector(7 downto 0);

begin

    ---------------------------------------------------------------------------
    -- Instantiate 3 dividers in parallel
    ---------------------------------------------------------------------------
    
    -- Divider 1: N ÷ 2
    DIV_BY_2: LongDivision_4bit_Group55 port map(
        Dividend  => N,
        Divisor   => "0010",  -- Divisor = 2
        CLK       => CLK,
        Load      => Load,
        Quotient  => open,    -- Quotient not needed
        Remainder => R2,      -- Only care about remainder
        Done      => Done2,
        Sub_Count => SC2      -- Subtraction count
    );
    
    -- Divider 2: N ÷ 3
    DIV_BY_3: LongDivision_4bit_Group55 port map(
        Dividend  => N,
        Divisor   => "0011",  -- Divisor = 3
        CLK       => CLK,
        Load      => Load,
        Quotient  => open,
        Remainder => R3,
        Done      => Done3,
        Sub_Count => SC3      -- Subtraction count
    );
    
    -- Divider 3: N ÷ 5
    DIV_BY_5: LongDivision_4bit_Group55 port map(
        Dividend  => N,
        Divisor   => "0101",  -- Divisor = 5
        CLK       => CLK,
        Load      => Load,
        Quotient  => open,
        Remainder => R5,
        Done      => Done5,
        Sub_Count => SC5      -- Subtraction count
    );
    
    -- Total subtraction count (sum of all 3 dividers)
    total_sub <= ("0000" & SC2) + ("0000" & SC3) + ("0000" & SC5);

    ---------------------------------------------------------------------------
    -- Latch Input Value
    ---------------------------------------------------------------------------
    process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                N_reg <= N;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Done Flag: All dividers complete
    ---------------------------------------------------------------------------
    all_done <= Done2 and Done3 and Done5;
    Done <= all_done;

    ---------------------------------------------------------------------------
    -- Prime Determination Logic
    ---------------------------------------------------------------------------
    -- Rules:
    --   N < 2       -> Not prime (0, 1)
    --   N = 2       -> Is prime (special case, since 2÷2=0 remainder 0)
    --   N = 3       -> Is prime (special case, since 3÷3=0 remainder 0)
    --   N = 5       -> Is prime (special case, since 5÷5=0 remainder 0)
    --   R2=0 and N>2 -> Divisible by 2, not prime
    --   R3=0 and N>3 -> Divisible by 3, not prime
    --   R5=0 and N>5 -> Divisible by 5, not prime
    --   Otherwise   -> Is prime
    
    process(N_reg, R2, R3, R5, all_done)
    begin
        if all_done = '0' then
            is_prime_internal <= '0';  -- Computing, temporarily output 0
        elsif N_reg < "0010" then
            -- N = 0 or 1, not prime
            is_prime_internal <= '0';
        elsif N_reg = "0010" or N_reg = "0011" or N_reg = "0101" then
            -- N = 2, 3, 5 are prime
            is_prime_internal <= '1';
        elsif R2 = "0000" then
            -- Divisible by 2, not prime (4, 6, 8, 10, 12, 14)
            is_prime_internal <= '0';
        elsif R3 = "0000" then
            -- Divisible by 3, not prime (6, 9, 12, 15)
            is_prime_internal <= '0';
        elsif R5 = "0000" then
            -- Divisible by 5, not prime (10, 15)
            is_prime_internal <= '0';
        else
            -- Not divisible by 2, 3, 5, is prime (7, 11, 13)
            is_prime_internal <= '1';
        end if;
    end process;
    
    Is_Prime <= is_prime_internal;
    Sub_Count <= total_sub;  -- Output total subtraction count

end architecture rtl;
