--------------------------------------------------------------------------------
-- Module Name: Prime_Finder_6k1_Group55
-- Description: Automatic prime detector using 6k±1 algorithm
-- Optimization: Phase 2 Optimization 3 - Mathematical optimization
-- 
-- Principle:
--   All primes greater than 3 can be written as 6k±1
--   Therefore only need to test: 2, 3, then 5, 7, 11, 13... (6k±1 sequence)
--   Significantly reduces division count compared to testing all numbers
--
-- Algorithm:
--   1. N < 2 -> Not prime
--   2. N = 2 or 3 -> Is prime
--   3. N % 2 = 0 -> Not prime
--   4. N % 3 = 0 -> Not prime
--   5. Test divisors in 6k±1 form (5, 7, 11, 13...) until divisor >= N
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_6k1_Group55 is
    port(
        N            : in  std_logic_vector(3 downto 0);  -- Number to check (0-15)
        CLK          : in  std_logic;                      -- Clock signal
        Load         : in  std_logic;                      -- Load signal
        Is_Prime     : out std_logic;                      -- Prime flag
        Done         : out std_logic;                      -- Detection complete flag
        Div_Count    : out std_logic_vector(3 downto 0)   -- Division count
    );
end entity Prime_Finder_6k1_Group55;

architecture rtl of Prime_Finder_6k1_Group55 is

    ---------------------------------------------------------------------------
    -- State Machine Definition
    ---------------------------------------------------------------------------
    type state_type is (
        IDLE,           -- Idle, waiting for Load
        CHECK_SPECIAL,  -- Check special cases (0, 1, 2, 3)
        START_DIV_2,    -- Start test ÷2
        WAIT_DIV_2,     -- Wait for ÷2 to complete
        START_DIV_3,    -- Start test ÷3
        WAIT_DIV_3,     -- Wait for ÷3 to complete
        GEN_6K,         -- Generate next 6k±1 divisor
        START_DIV_6K,   -- Start test ÷(6k±1)
        WAIT_DIV_6K,    -- Wait for ÷(6k±1) to complete
        DONE_PRIME,     -- Result: Is prime
        DONE_NOT_PRIME  -- Result: Not prime
    );
    signal state : state_type := IDLE;

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
            Done      : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- Internal Signals
    ---------------------------------------------------------------------------
    -- Latched input value
    signal N_reg : std_logic_vector(3 downto 0);
    
    -- Current divisor
    signal current_divisor : std_logic_vector(3 downto 0);
    
    -- Divider control signals
    signal div_load : std_logic := '0';
    signal div_done : std_logic;
    signal div_remainder : std_logic_vector(3 downto 0);
    
    -- 6k±1 generator
    signal test_minus : std_logic;  -- '1'=test 6k-1, '0'=test 6k+1
    
    -- Division count register
    signal div_count_reg : std_logic_vector(3 downto 0) := "0000";
    
    -- Output registers
    signal is_prime_reg : std_logic := '0';
    signal done_reg : std_logic := '0';

begin

    ---------------------------------------------------------------------------
    -- Instantiate Divider (Reuse)
    ---------------------------------------------------------------------------
    DIVIDER: LongDivision_4bit_Group55 port map(
        Dividend  => N_reg,
        Divisor   => current_divisor,
        CLK       => CLK,
        Load      => div_load,
        Quotient  => open,
        Remainder => div_remainder,
        Done      => div_done
    );

    ---------------------------------------------------------------------------
    -- Main State Machine
    ---------------------------------------------------------------------------
    FSM_PROC: process(CLK)
    begin
        if rising_edge(CLK) then
            -- Default values
            div_load <= '0';
            
            case state is
                ---------------------------------------------------------------
                -- Idle State
                ---------------------------------------------------------------
                when IDLE =>
                    done_reg <= '0';
                    if Load = '1' then
                        N_reg <= N;
                        div_count_reg <= "0000";
                        state <= CHECK_SPECIAL;
                    end if;
                
                ---------------------------------------------------------------
                -- Check Special Cases
                ---------------------------------------------------------------
                when CHECK_SPECIAL =>
                    if N_reg < "0010" then
                        -- N = 0 or 1, not prime
                        state <= DONE_NOT_PRIME;
                    elsif N_reg = "0010" or N_reg = "0011" then
                        -- N = 2 or 3, is prime
                        state <= DONE_PRIME;
                    else
                        -- Start test ÷2
                        current_divisor <= "0010";
                        div_load <= '1';
                        state <= WAIT_DIV_2;
                    end if;
                
                ---------------------------------------------------------------
                -- Wait for ÷2 to Complete
                ---------------------------------------------------------------
                when WAIT_DIV_2 =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then
                            -- Divisible by 2, not prime
                            state <= DONE_NOT_PRIME;
                        else
                            -- Continue test ÷3
                            current_divisor <= "0011";
                            div_load <= '1';
                            state <= WAIT_DIV_3;
                        end if;
                    end if;
                
                ---------------------------------------------------------------
                -- Wait for ÷3 to Complete
                ---------------------------------------------------------------
                when WAIT_DIV_3 =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then
                            -- Divisible by 3, not prime
                            state <= DONE_NOT_PRIME;
                        else
                            -- Start 6k±1 sequence, from 5 (6×1-1=5)
                            current_divisor <= "0101";
                            test_minus <= '0';  -- Next is 6k+1
                            state <= GEN_6K;
                        end if;
                    end if;
                
                ---------------------------------------------------------------
                -- Generate Next 6k±1 Divisor
                ---------------------------------------------------------------
                when GEN_6K =>
                    if current_divisor >= N_reg then
                        -- Divisor >= N, test complete, is prime
                        state <= DONE_PRIME;
                    else
                        -- Start division
                        div_load <= '1';
                        state <= WAIT_DIV_6K;
                    end if;
                
                ---------------------------------------------------------------
                -- Wait for ÷(6k±1) to Complete
                ---------------------------------------------------------------
                when WAIT_DIV_6K =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then
                            -- Divisible, not prime
                            state <= DONE_NOT_PRIME;
                        else
                            -- Generate next 6k±1
                            if test_minus = '0' then
                                -- Current is 6k-1, next is 6k+1 (add 2)
                                current_divisor <= current_divisor + 2;
                                test_minus <= '1';
                            else
                                -- Current is 6k+1, next is 6(k+1)-1 (add 4)
                                current_divisor <= current_divisor + 4;
                                test_minus <= '0';
                            end if;
                            state <= GEN_6K;
                        end if;
                    end if;
                
                ---------------------------------------------------------------
                -- Result: Is Prime
                ---------------------------------------------------------------
                when DONE_PRIME =>
                    is_prime_reg <= '1';
                    done_reg <= '1';
                    if Load = '0' then
                        state <= IDLE;
                    end if;
                
                ---------------------------------------------------------------
                -- Result: Not Prime
                ---------------------------------------------------------------
                when DONE_NOT_PRIME =>
                    is_prime_reg <= '0';
                    done_reg <= '1';
                    if Load = '0' then
                        state <= IDLE;
                    end if;
                
                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process FSM_PROC;

    ---------------------------------------------------------------------------
    -- Output Assignment
    ---------------------------------------------------------------------------
    Is_Prime <= is_prime_reg;
    Done <= done_reg;
    Div_Count <= div_count_reg;

end architecture rtl;
