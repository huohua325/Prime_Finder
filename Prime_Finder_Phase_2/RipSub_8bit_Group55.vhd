--------------------------------------------------------------------------------
-- Module Name: RipSub_8bit_Group55
-- Description: 8-bit ripple subtractor, implemented by cascading two 4-bit subtractors
-- Optimization: Phase 2 Optimization 4 - Basic component for internal divider optimization
-- 
-- Principle:
--   Reuses RipSub_4bit_Group55 module
--   Low 4-bit subtractor borrow output connects to high 4-bit subtractor borrow input
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity RipSub_8bit_Group55 is
    port(
        A    : in  std_logic_vector(7 downto 0);  -- Minuend (8-bit)
        B    : in  std_logic_vector(7 downto 0);  -- Subtrahend (8-bit)
        Diff : out std_logic_vector(7 downto 0);  -- Difference (A - B)
        Bout : out std_logic                       -- Borrow output
    );
end entity RipSub_8bit_Group55;

architecture structural of RipSub_8bit_Group55 is

    ---------------------------------------------------------------------------
    -- Submodule Declaration: 4-bit subtractor
    ---------------------------------------------------------------------------
    component RipSub_4bit_Group55 is
        port(
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            Diff : out std_logic_vector(3 downto 0);
            Bout : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- Internal Signals
    ---------------------------------------------------------------------------
    signal borrow_low  : std_logic;  -- Low 4-bit borrow
    signal diff_low    : std_logic_vector(3 downto 0);
    signal diff_high   : std_logic_vector(3 downto 0);
    
    -- High bit subtraction needs to consider low bit borrow
    signal B_high_adj  : std_logic_vector(3 downto 0);
    signal borrow_adj  : std_logic;
    signal diff_adj    : std_logic_vector(3 downto 0);

begin

    ---------------------------------------------------------------------------
    -- Low 4-bit Subtractor
    ---------------------------------------------------------------------------
    SUB_LOW: RipSub_4bit_Group55 port map(
        A    => A(3 downto 0),
        B    => B(3 downto 0),
        Diff => diff_low,
        Bout => borrow_low
    );

    ---------------------------------------------------------------------------
    -- High 4-bit Subtractor (needs to subtract low bit borrow)
    -- Implementation: A_high - B_high - borrow_low
    -- Method: First A_high - B_high, then adjust according to borrow_low
    ---------------------------------------------------------------------------
    SUB_HIGH: RipSub_4bit_Group55 port map(
        A    => A(7 downto 4),
        B    => B(7 downto 4),
        Diff => diff_high,
        Bout => borrow_adj
    );
    
    -- If low bit has borrow, high bit result needs to subtract 1
    -- Use another subtractor to handle borrow
    SUB_BORROW: RipSub_4bit_Group55 port map(
        A    => diff_high,
        B    => "000" & borrow_low,  -- Subtract 0 or 1
        Diff => diff_adj,
        Bout => open  -- Temporarily ignore
    );

    ---------------------------------------------------------------------------
    -- Output
    ---------------------------------------------------------------------------
    Diff(3 downto 0) <= diff_low;
    Diff(7 downto 4) <= diff_adj;
    
    -- Final borrow: High bit has borrow, or (high bit result is 0 and low bit has borrow)
    -- Use nor to judge if diff_high is all 0, avoid direct vector comparison
    Bout <= borrow_adj or (borrow_low and not (diff_high(3) or diff_high(2) or diff_high(1) or diff_high(0)));

end architecture structural;
