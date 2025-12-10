--------------------------------------------------------------------------------
-- Module Name : LongDivision_CLA_Pipeline_Group55
-- Description : Pipelined divider using a CLA subtractor
-- Optimization Type : Stage 2 Optimization 2 - Internal divider optimization (CLA + Pipeline)
--
-- Principle:
--   CLA (Carry-Lookahead): Carry prediction to reduce single-subtraction delay
--   Pipeline: Split the division into multiple stages to improve throughput
--
-- Comparison with RipSub version:
--   RipSub: Borrow propagates stage by stage; 4 bits require 4 levels of delay
--   CLA:    Borrow computed in parallel; 4 bits require only 2 levels of delay
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity LongDivision_CLA_Pipeline_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- Dividend
        Divisor   : in  std_logic_vector(3 downto 0);  -- Divisor
        CLK       : in  std_logic;                      -- Clock
        Load      : in  std_logic;                      -- Load signal
        Quotient  : out std_logic_vector(3 downto 0);  -- Quotient
        Remainder : out std_logic_vector(3 downto 0);  -- Remainder
        Done      : out std_logic;                      -- Done flag
        Sub_Count : out std_logic_vector(3 downto 0)   -- Subtraction count (NEW: for demo)
    );
end entity LongDivision_CLA_Pipeline_Group55;

architecture rtl of LongDivision_CLA_Pipeline_Group55 is

    ---------------------------------------------------------------------------
    -- CLA subtractor signals (embedded implementation)
    ---------------------------------------------------------------------------
    signal cla_a, cla_b : std_logic_vector(3 downto 0);
    signal cla_diff     : std_logic_vector(3 downto 0);
    signal cla_borrow   : std_logic;
    
    -- Internal CLA signals
    signal Bn : std_logic_vector(3 downto 0);  -- Bitwise NOT of B
    signal G  : std_logic_vector(3 downto 0);  -- Generate
    signal P  : std_logic_vector(3 downto 0);  -- Propagate
    signal C  : std_logic_vector(4 downto 0);  -- Carry chain

    ---------------------------------------------------------------------------
    -- Pipeline registers
    ---------------------------------------------------------------------------
    -- Stage 1: Input latch
    signal s1_dividend : std_logic_vector(3 downto 0);
    signal s1_divisor  : std_logic_vector(3 downto 0);
    signal s1_valid    : std_logic := '0';
    
    -- Stage 2+: Iterative computation
    signal reg_dividend : std_logic_vector(3 downto 0);
    signal reg_divisor  : std_logic_vector(3 downto 0);
    signal reg_quotient : std_logic_vector(3 downto 0);
    signal computing    : std_logic := '0';
    signal done_internal: std_logic := '0';
    signal div_by_zero  : std_logic := '0';
    
    -- Subtraction counter (NEW: counts actual CLA subtractions)
    signal sub_count_reg : std_logic_vector(3 downto 0) := "0000";

begin

    ---------------------------------------------------------------------------
    -- CLA subtractor logic (combinational)
    -- Computes: cla_diff = cla_a - cla_b
    -- Principle: A - B = A + NOT(B) + 1 (two's complement addition)
    ---------------------------------------------------------------------------
    
    -- Input mapping
    cla_a <= reg_dividend;
    cla_b <= reg_divisor;
    
    -- Step 1: Bitwise NOT of B
    Bn <= not cla_b;
    
    -- Step 2: Compute Generate and Propagate (in parallel)
    G <= cla_a and Bn;
    P <= cla_a xor Bn;
    
    -- Step 3: Carry prediction (key optimization: all carries computed in parallel!)
    C(0) <= '1';  -- Two's complement +1
    
    -- C(1) = G(0) + P(0)·C(0)
    C(1) <= G(0) or (P(0) and C(0));
    
    -- C(2) = G(1) + P(1)·G(0) + P(1)·P(0)·C(0)
    C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C(0));
    
    -- C(3) = G(2) + P(2)·G(1) + P(2)·P(1)·G(0) + P(2)·P(1)·P(0)·C(0)
    C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) 
                 or (P(2) and P(1) and P(0) and C(0));
    
    -- C(4) = G(3) + P(3)·G(2) + ... (final carry out)
    C(4) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1))
                 or (P(3) and P(2) and P(1) and G(0))
                 or (P(3) and P(2) and P(1) and P(0) and C(0));
    
    -- Step 4: Compute difference
    cla_diff <= P xor C(3 downto 0);
    
    -- Step 5: Borrow (no carry-out means borrow)
    cla_borrow <= not C(4);

    ---------------------------------------------------------------------------
    -- Pipeline control process
    ---------------------------------------------------------------------------
    PIPELINE_PROC: process(CLK)
    begin
        if rising_edge(CLK) then
           
            ---------------------------------------------------------------
            -- Stage 1: Input latch (pipeline entry)
            ---------------------------------------------------------------
            if Load = '1' then
                s1_dividend <= Dividend;
                s1_divisor <= Divisor;
                s1_valid <= '1';
                
                -- Check divide-by-zero
                if Divisor = "0000" then
                    div_by_zero <= '1';
                else
                    div_by_zero <= '0';
                end if;
            end if;
            
            ---------------------------------------------------------------
            -- Stage 1 -> Stage 2: Transfer to computation stage
            ---------------------------------------------------------------
            if s1_valid = '1' and computing = '0' then
                reg_dividend <= s1_dividend;
                reg_divisor <= s1_divisor;
                reg_quotient <= "0000";
                sub_count_reg <= "0000";  -- Reset subtraction counter
                computing <= '1';
                done_internal <= '0';
                s1_valid <= '0';
            end if;
            
            ---------------------------------------------------------------
            -- Stage 2+: Iterative subtraction (using CLA)
            ---------------------------------------------------------------
            if computing = '1' and div_by_zero = '0' then
                if cla_borrow = '0' then
                    -- Subtraction valid: update remainder, quotient +1
                    reg_dividend <= cla_diff;
                    reg_quotient <= reg_quotient + 1;
                    -- COUNT REAL CLA SUBTRACTION!
                    sub_count_reg <= sub_count_reg + 1;
                else
                    -- Cannot subtract: finish
                    done_internal <= '1';
                    computing <= '0';
                end if;
            end if;
            
            -- Divide-by-zero: finish immediately
            if computing = '1' and div_by_zero = '1' then
                done_internal <= '1';
                computing <= '0';
            end if;
            
            ---------------------------------------------------------------
            -- Clear done when new Load arrives
            ---------------------------------------------------------------
            if Load = '1' then
                done_internal <= '0';
            end if;
            
        end if;
    end process PIPELINE_PROC;

    ---------------------------------------------------------------------------
    -- Output assignments
    ---------------------------------------------------------------------------
    Quotient <= reg_quotient when div_by_zero = '0' else "1111";
    Remainder <= reg_dividend when div_by_zero = '0' else s1_dividend;
    Done <= done_internal;
    Sub_Count <= sub_count_reg;  -- Output actual subtraction count

end architecture rtl;
