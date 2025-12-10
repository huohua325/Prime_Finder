--------------------------------------------------------------------------------
-- Module Name: LongDivision_4bit_Group55
-- Description: 4-bit long divider, computes Dividend / Divisor = Quotient ... Remainder
-- Design Requirements: 
--   1. Must have CLK and Load signals
--   2. Implement using process + if statements
--   3. std_logic_unsigned only for counter increment/decrement
-- Hierarchy: LongDivision_4bit is parent of Multiplier_4bit and RipSub_4bit
--
-- Long Division Algorithm (binary version):
--   1. Left-align dividend into a sufficiently wide register
--   2. Starting from MSB, try subtracting divisor each time
--   3. If subtractable (no borrow), quotient bit = 1, keep difference
--   4. If not subtractable (has borrow), quotient bit = 0, keep original
--   5. Repeat until all bits processed
--
-- Simplified Implementation: Using repeated subtraction
--   Quotient = 0
--   while (Remainder >= Divisor):
--       Remainder = Remainder - Divisor
--       Quotient = Quotient + 1
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  -- Only for counter comparison and increment

entity LongDivision_4bit_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- Dividend (0-15)
        Divisor   : in  std_logic_vector(3 downto 0);  -- Divisor (0-15)
        CLK       : in  std_logic;                      -- Clock signal
        Load      : in  std_logic;                      -- Load signal (high loads new data)
        Quotient  : out std_logic_vector(3 downto 0);  -- Quotient
        Remainder : out std_logic_vector(3 downto 0);  -- Remainder
        Done      : out std_logic                       -- Calculation complete flag
    );
end entity LongDivision_4bit_Group55;

architecture rtl of LongDivision_4bit_Group55 is

    -- Submodule declaration: 4-bit subtractor
    component RipSub_4bit_Group55 is
        port(
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            Diff : out std_logic_vector(3 downto 0);
            Bout : out std_logic
        );
    end component;

    -- Internal registers
    signal reg_dividend : std_logic_vector(3 downto 0);  -- Dividend register (also used as remainder)
    signal reg_divisor  : std_logic_vector(3 downto 0);  -- Divisor register
    signal reg_quotient : std_logic_vector(3 downto 0);  -- Quotient register
    
    -- Subtractor outputs
    signal sub_result   : std_logic_vector(3 downto 0);  -- Subtraction result
    signal sub_borrow   : std_logic;                      -- Borrow flag
    
    -- State signals
    signal done_i       : std_logic;                      -- Division complete flag (internal)
    signal div_by_zero  : std_logic;                      -- Divide by zero flag

begin

    ---------------------------------------------------------------------------
    -- Instantiate Subtractor: for computing reg_dividend - reg_divisor
    ---------------------------------------------------------------------------
    SUBTRACTOR: RipSub_4bit_Group55 port map(
        A    => reg_dividend,
        B    => reg_divisor,
        Diff => sub_result,
        Bout => sub_borrow
    );

    ---------------------------------------------------------------------------
    -- Main Control Process: Implement repeated subtraction division algorithm
    ---------------------------------------------------------------------------
    DIV_PROCESS: process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                ---------------------------------------------------------------
                -- Load Phase: Initialize all registers
                ---------------------------------------------------------------
                reg_dividend <= Dividend;      -- Load dividend
                reg_divisor  <= Divisor;       -- Load divisor
                reg_quotient <= "0000";        -- Initialize quotient to 0
                done_i       <= '0';           -- Reset done flag
                
                -- Check divide by zero
                if Divisor = "0000" then
                    div_by_zero <= '1';
                else
                    div_by_zero <= '0';
                end if;
                
            else
                ---------------------------------------------------------------
                -- Calculation Phase: Repeated subtraction
                ---------------------------------------------------------------
                if done_i = '0' and div_by_zero = '0' then
                    -- Check if can continue subtracting (reg_dividend >= reg_divisor)
                    if sub_borrow = '0' then
                        -- Can subtract: Update remainder, quotient +1
                        reg_dividend <= sub_result;
                        reg_quotient <= reg_quotient + 1;  -- Counter increment (allowed to use +)
                    else
                        -- Cannot subtract: Division complete
                        done_i <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process DIV_PROCESS;

    ---------------------------------------------------------------------------
    -- Output Assignment
    ---------------------------------------------------------------------------
    -- Quotient output
    Quotient <= reg_quotient when div_by_zero = '0' else "1111";  -- Divide by zero returns max value
    
    -- Remainder output
    Remainder <= reg_dividend when div_by_zero = '0' else Dividend;  -- Divide by zero returns dividend
    
    -- Done flag output
    Done <= done_i or div_by_zero;

end architecture rtl;
