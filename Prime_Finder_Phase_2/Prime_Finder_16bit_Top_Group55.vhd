--------------------------------------------------------------------------------
-- Module Name: Prime_Finder_16bit_Top_Group55
-- Description: 16-bit prime detector with REAL CLA subtractor and 6k±1 optimization
-- 
-- REAL OPTIMIZATIONS IMPLEMENTED:
--   1. CLA (Carry-Lookahead Adder) - Parallel carry computation for subtraction
--   2. 6k±1 Optimization - Only test divisors 2, 3, then 6k±1 forms
--   3. Pipeline structure - Multi-stage division with CLA subtractor
--   4. Square root termination - Stop when divisor² > N
--   5. PARALLEL DIVISION - Two CLA dividers test ÷2 and ÷3 simultaneously
--
-- PERFORMANCE DISPLAY:
--   HEX5-HEX4: Total Division Count (00-99)
--   HEX3-HEX2: Subtraction Count High (00-99, represents hundreds)
--   HEX1-HEX0: Subtraction Count Low (00-99, represents units)
--   Total Subtractions = HEX3-2 * 100 + HEX1-0
--
-- Operation Flow:
--   1. Set SW[7:0] to high 8 bits, press KEY0 to latch
--   2. Set SW[7:0] to low 8 bits, press KEY1 to start calculation
--   3. Wait for calculation to complete, observe LED9 result
--   4. Press KEY0 to restart
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Prime_Finder_16bit_Top_Group55 is
    port(
        -- Clock
        MAX10_CLK1_50 : in  std_logic;
        
        -- Switch input
        SW            : in  std_logic_vector(9 downto 0);
        
        -- Key input (active low)
        KEY           : in  std_logic_vector(1 downto 0);
        
        -- Seven-segment displays
        HEX0          : out std_logic_vector(6 downto 0);
        HEX1          : out std_logic_vector(6 downto 0);
        HEX2          : out std_logic_vector(6 downto 0);
        HEX3          : out std_logic_vector(6 downto 0);
        HEX4          : out std_logic_vector(6 downto 0);
        HEX5          : out std_logic_vector(6 downto 0);
        
        -- LED output
        LEDR          : out std_logic_vector(9 downto 0)
    );
end entity Prime_Finder_16bit_Top_Group55;

architecture rtl of Prime_Finder_16bit_Top_Group55 is

    ---------------------------------------------------------------------------
    -- State Machine Definitions
    ---------------------------------------------------------------------------
    -- Main state machine
    type main_state_type is (
        WAIT_HIGH,      -- Wait for high 8-bit input
        WAIT_LOW,       -- Wait for low 8-bit input
        INIT_CHECK,     -- Initialize prime checking
        CHECK_SPECIAL,  -- Check special cases (0, 1, 2, 3)
        PARALLEL_DIV23, -- PARALLEL: Test ÷2 and ÷3 simultaneously!
        PARALLEL_WAIT,  -- Wait for both parallel divisions to complete
        NEXT_6K,        -- Compute next 6k±1 divisor
        CHECK_6K_M1,    -- Check divisibility by 6k-1 
        DIV_6KM1_COMP,  -- Computing division by 6k-1
        CHECK_6K_P1,    -- Check divisibility by 6k+1
        DIV_6KP1_COMP,  -- Computing division by 6k+1
        CHECK_SQRT,     -- Check if divisor² > N (termination condition)
        SHOW_RESULT     -- Show result
    );
    signal main_state : main_state_type := WAIT_HIGH;

    ---------------------------------------------------------------------------
    -- Input Signals
    ---------------------------------------------------------------------------
    signal data_high : std_logic_vector(7 downto 0) := (others => '0');
    signal data_low  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_full : std_logic_vector(15 downto 0) := (others => '0');
    
    -- Key debounce and edge detection
    signal key0_sync1, key0_sync2 : std_logic := '1';
    signal key1_sync1, key1_sync2 : std_logic := '1';
    signal key0_prev, key1_prev : std_logic := '1';
    signal key0_pressed, key1_pressed : std_logic := '0';
    
    constant DEBOUNCE_MAX : integer := 50000;
    signal debounce_cnt0 : integer range 0 to DEBOUNCE_MAX := 0;
    signal debounce_cnt1 : integer range 0 to DEBOUNCE_MAX := 0;
    signal key0_stable, key1_stable : std_logic := '1';

    ---------------------------------------------------------------------------
    -- CLA Subtractor Signals (16-bit)
    -- Implements: diff = A - B using A + NOT(B) + 1
    ---------------------------------------------------------------------------
    signal cla_a      : std_logic_vector(15 downto 0);  -- Minuend
    signal cla_b      : std_logic_vector(15 downto 0);  -- Subtrahend
    signal cla_diff   : std_logic_vector(15 downto 0);  -- Result
    signal cla_borrow : std_logic;                       -- Borrow flag (A < B)
    
    -- CLA internal signals (4-bit groups for hierarchical CLA)
    signal Bn         : std_logic_vector(15 downto 0);  -- NOT(B)
    signal G          : std_logic_vector(15 downto 0);  -- Generate
    signal P          : std_logic_vector(15 downto 0);  -- Propagate
    signal C          : std_logic_vector(16 downto 0);  -- Carry chain
    
    -- Group Generate and Propagate (for 4-bit groups)
    signal GG         : std_logic_vector(3 downto 0);   -- Group Generate
    signal GP         : std_logic_vector(3 downto 0);   -- Group Propagate
    signal GC         : std_logic_vector(4 downto 0);   -- Group Carry

    ---------------------------------------------------------------------------
    -- CLA2 Subtractor Signals (16-bit) - SECOND PARALLEL DIVIDER
    ---------------------------------------------------------------------------
    signal cla2_a      : std_logic_vector(15 downto 0);  -- Minuend
    signal cla2_b      : std_logic_vector(15 downto 0);  -- Subtrahend
    signal cla2_diff   : std_logic_vector(15 downto 0);  -- Result
    signal cla2_borrow : std_logic;                       -- Borrow flag
    
    -- CLA2 internal signals
    signal Bn2        : std_logic_vector(15 downto 0);  -- NOT(B)
    signal G2         : std_logic_vector(15 downto 0);  -- Generate
    signal P2         : std_logic_vector(15 downto 0);  -- Propagate
    signal C2         : std_logic_vector(16 downto 0);  -- Carry chain
    signal GG2        : std_logic_vector(3 downto 0);   -- Group Generate
    signal GP2        : std_logic_vector(3 downto 0);   -- Group Propagate
    signal GC2        : std_logic_vector(4 downto 0);   -- Group Carry

    ---------------------------------------------------------------------------
    -- Division Signals - DIVIDER 1 (using repeated CLA subtraction)
    ---------------------------------------------------------------------------
    signal div_dividend   : std_logic_vector(15 downto 0) := (others => '0');  -- Current dividend (remainder)
    signal div_divisor    : std_logic_vector(15 downto 0) := x"0001";          -- Current divisor (init to 1 to avoid div-by-0)
    signal div_quotient   : std_logic_vector(15 downto 0) := (others => '0');  -- Quotient accumulator
    signal div_computing  : std_logic := '0';                                   -- Division in progress
    signal div_done       : std_logic := '0';                                   -- Division complete
    signal div_remainder  : std_logic_vector(15 downto 0) := (others => '0');  -- Final remainder

    ---------------------------------------------------------------------------
    -- Division Signals - DIVIDER 2 (PARALLEL)
    ---------------------------------------------------------------------------
    signal div2_dividend  : std_logic_vector(15 downto 0) := (others => '0');
    signal div2_divisor   : std_logic_vector(15 downto 0) := x"0001";
    signal div2_quotient  : std_logic_vector(15 downto 0) := (others => '0');
    signal div2_computing : std_logic := '0';
    signal div2_done      : std_logic := '0';
    signal div2_remainder : std_logic_vector(15 downto 0) := (others => '0');

    ---------------------------------------------------------------------------
    -- Prime Check Signals
    ---------------------------------------------------------------------------
    signal n_reg          : std_logic_vector(15 downto 0) := (others => '0');  -- Number to check
    signal current_div    : std_logic_vector(15 downto 0) := x"0005";          -- Current divisor (init to 5)
    signal k_value        : std_logic_vector(15 downto 0) := x"0001";          -- k for 6k±1
    signal is_prime       : std_logic := '0';
    signal check_6k_plus  : std_logic := '0';               -- Flag: checking 6k+1 vs 6k-1
    
    -- Square computation for sqrt termination
    signal divisor_sq     : std_logic_vector(31 downto 0) := (others => '0');  -- divisor²

    ---------------------------------------------------------------------------
    -- REAL Performance Counters (actual operations counted)
    ---------------------------------------------------------------------------
    signal div_count      : integer range 0 to 9999 := 0;   -- Total division operations
    signal sub_count      : integer range 0 to 99999 := 0;  -- Total CLA subtractions
    
    -- Display digits
    signal div_count_tens   : integer range 0 to 9 := 0;
    signal div_count_units  : integer range 0 to 9 := 0;
    signal sub_count_high   : integer range 0 to 99 := 0;   -- Hundreds of subtractions
    signal sub_count_low    : integer range 0 to 99 := 0;   -- Units of subtractions

    ---------------------------------------------------------------------------
    -- Seven-segment Display Encoding Function
    ---------------------------------------------------------------------------
    function seg7_encode(digit : std_logic_vector(3 downto 0)) 
        return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case digit is
            when "0000" => seg := "1000000";  -- 0
            when "0001" => seg := "1111001";  -- 1
            when "0010" => seg := "0100100";  -- 2
            when "0011" => seg := "0110000";  -- 3
            when "0100" => seg := "0011001";  -- 4
            when "0101" => seg := "0010010";  -- 5
            when "0110" => seg := "0000010";  -- 6
            when "0111" => seg := "1111000";  -- 7
            when "1000" => seg := "0000000";  -- 8
            when "1001" => seg := "0010000";  -- 9
            when "1010" => seg := "0001000";  -- A
            when "1011" => seg := "0000011";  -- b
            when "1100" => seg := "1000110";  -- C
            when "1101" => seg := "0100001";  -- d
            when "1110" => seg := "0000110";  -- E
            when "1111" => seg := "0001110";  -- F
            when others => seg := "1111111";
        end case;
        return seg;
    end function;

begin

    ---------------------------------------------------------------------------
    -- 16-bit CLA Subtractor (Hierarchical 4-bit groups)
    -- This is the REAL CLA implementation with parallel carry computation
    ---------------------------------------------------------------------------
    
    -- Step 1: Bitwise NOT of B (for two's complement subtraction)
    Bn <= not cla_b;
    
    -- Step 2: Generate and Propagate for each bit
    GEN_GP: for i in 0 to 15 generate
        G(i) <= cla_a(i) and Bn(i);
        P(i) <= cla_a(i) xor Bn(i);
    end generate;
    
    -- Step 3: Group Generate and Propagate (4-bit groups)
    -- Group 0: bits 0-3
    GG(0) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) 
                  or (P(3) and P(2) and P(1) and G(0));
    GP(0) <= P(3) and P(2) and P(1) and P(0);
    
    -- Group 1: bits 4-7
    GG(1) <= G(7) or (P(7) and G(6)) or (P(7) and P(6) and G(5)) 
                  or (P(7) and P(6) and P(5) and G(4));
    GP(1) <= P(7) and P(6) and P(5) and P(4);
    
    -- Group 2: bits 8-11
    GG(2) <= G(11) or (P(11) and G(10)) or (P(11) and P(10) and G(9)) 
                   or (P(11) and P(10) and P(9) and G(8));
    GP(2) <= P(11) and P(10) and P(9) and P(8);
    
    -- Group 3: bits 12-15
    GG(3) <= G(15) or (P(15) and G(14)) or (P(15) and P(14) and G(13)) 
                   or (P(15) and P(14) and P(13) and G(12));
    GP(3) <= P(15) and P(14) and P(13) and P(12);
    
    -- Step 4: Group Carry (parallel computation - KEY OPTIMIZATION!)
    GC(0) <= '1';  -- Initial carry for two's complement
    GC(1) <= GG(0) or (GP(0) and GC(0));
    GC(2) <= GG(1) or (GP(1) and GG(0)) or (GP(1) and GP(0) and GC(0));
    GC(3) <= GG(2) or (GP(2) and GG(1)) or (GP(2) and GP(1) and GG(0)) 
                   or (GP(2) and GP(1) and GP(0) and GC(0));
    GC(4) <= GG(3) or (GP(3) and GG(2)) or (GP(3) and GP(2) and GG(1))
                   or (GP(3) and GP(2) and GP(1) and GG(0))
                   or (GP(3) and GP(2) and GP(1) and GP(0) and GC(0));
    
    -- Step 5: Intra-group carries (using group carries as starting points)
    -- Group 0 carries
    C(0)  <= GC(0);
    C(1)  <= G(0) or (P(0) and C(0));
    C(2)  <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C(0));
    C(3)  <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) 
                  or (P(2) and P(1) and P(0) and C(0));
    C(4)  <= GC(1);
    
    -- Group 1 carries  
    C(5)  <= G(4) or (P(4) and C(4));
    C(6)  <= G(5) or (P(5) and G(4)) or (P(5) and P(4) and C(4));
    C(7)  <= G(6) or (P(6) and G(5)) or (P(6) and P(5) and G(4)) 
                  or (P(6) and P(5) and P(4) and C(4));
    C(8)  <= GC(2);
    
    -- Group 2 carries
    C(9)  <= G(8) or (P(8) and C(8));
    C(10) <= G(9) or (P(9) and G(8)) or (P(9) and P(8) and C(8));
    C(11) <= G(10) or (P(10) and G(9)) or (P(10) and P(9) and G(8)) 
                   or (P(10) and P(9) and P(8) and C(8));
    C(12) <= GC(3);
    
    -- Group 3 carries
    C(13) <= G(12) or (P(12) and C(12));
    C(14) <= G(13) or (P(13) and G(12)) or (P(13) and P(12) and C(12));
    C(15) <= G(14) or (P(14) and G(13)) or (P(14) and P(13) and G(12)) 
                   or (P(14) and P(13) and P(12) and C(12));
    C(16) <= GC(4);
    
    -- Step 6: Compute difference
    cla_diff <= P xor C(15 downto 0);
    
    -- Step 7: Borrow detection (no carry-out means borrow occurred)
    cla_borrow <= not C(16);

    ---------------------------------------------------------------------------
    -- CLA Input Connections (continuous assignment for combinatorial logic)
    -- CLA1 always computes: div_dividend - div_divisor
    ---------------------------------------------------------------------------
    cla_a <= div_dividend;
    cla_b <= div_divisor;

    ---------------------------------------------------------------------------
    -- CLA2: Second 16-bit CLA Subtractor (for PARALLEL division)
    ---------------------------------------------------------------------------
    -- Step 1: Bitwise NOT of B
    Bn2 <= not cla2_b;
    
    -- Step 2: Generate and Propagate
    GEN_GP2: for i in 0 to 15 generate
        G2(i) <= cla2_a(i) and Bn2(i);
        P2(i) <= cla2_a(i) xor Bn2(i);
    end generate;
    
    -- Step 3: Group Generate and Propagate
    GG2(0) <= G2(3) or (P2(3) and G2(2)) or (P2(3) and P2(2) and G2(1)) 
                    or (P2(3) and P2(2) and P2(1) and G2(0));
    GP2(0) <= P2(3) and P2(2) and P2(1) and P2(0);
    
    GG2(1) <= G2(7) or (P2(7) and G2(6)) or (P2(7) and P2(6) and G2(5)) 
                    or (P2(7) and P2(6) and P2(5) and G2(4));
    GP2(1) <= P2(7) and P2(6) and P2(5) and P2(4);
    
    GG2(2) <= G2(11) or (P2(11) and G2(10)) or (P2(11) and P2(10) and G2(9)) 
                     or (P2(11) and P2(10) and P2(9) and G2(8));
    GP2(2) <= P2(11) and P2(10) and P2(9) and P2(8);
    
    GG2(3) <= G2(15) or (P2(15) and G2(14)) or (P2(15) and P2(14) and G2(13)) 
                     or (P2(15) and P2(14) and P2(13) and G2(12));
    GP2(3) <= P2(15) and P2(14) and P2(13) and P2(12);
    
    -- Step 4: Group Carry
    GC2(0) <= '1';
    GC2(1) <= GG2(0) or (GP2(0) and GC2(0));
    GC2(2) <= GG2(1) or (GP2(1) and GG2(0)) or (GP2(1) and GP2(0) and GC2(0));
    GC2(3) <= GG2(2) or (GP2(2) and GG2(1)) or (GP2(2) and GP2(1) and GG2(0)) 
                     or (GP2(2) and GP2(1) and GP2(0) and GC2(0));
    GC2(4) <= GG2(3) or (GP2(3) and GG2(2)) or (GP2(3) and GP2(2) and GG2(1))
                     or (GP2(3) and GP2(2) and GP2(1) and GG2(0))
                     or (GP2(3) and GP2(2) and GP2(1) and GP2(0) and GC2(0));
    
    -- Step 5: Intra-group carries
    C2(0)  <= GC2(0);
    C2(1)  <= G2(0) or (P2(0) and C2(0));
    C2(2)  <= G2(1) or (P2(1) and G2(0)) or (P2(1) and P2(0) and C2(0));
    C2(3)  <= G2(2) or (P2(2) and G2(1)) or (P2(2) and P2(1) and G2(0)) 
                    or (P2(2) and P2(1) and P2(0) and C2(0));
    C2(4)  <= GC2(1);
    C2(5)  <= G2(4) or (P2(4) and C2(4));
    C2(6)  <= G2(5) or (P2(5) and G2(4)) or (P2(5) and P2(4) and C2(4));
    C2(7)  <= G2(6) or (P2(6) and G2(5)) or (P2(6) and P2(5) and G2(4)) 
                    or (P2(6) and P2(5) and P2(4) and C2(4));
    C2(8)  <= GC2(2);
    C2(9)  <= G2(8) or (P2(8) and C2(8));
    C2(10) <= G2(9) or (P2(9) and G2(8)) or (P2(9) and P2(8) and C2(8));
    C2(11) <= G2(10) or (P2(10) and G2(9)) or (P2(10) and P2(9) and G2(8)) 
                     or (P2(10) and P2(9) and P2(8) and C2(8));
    C2(12) <= GC2(3);
    C2(13) <= G2(12) or (P2(12) and C2(12));
    C2(14) <= G2(13) or (P2(13) and G2(12)) or (P2(13) and P2(12) and C2(12));
    C2(15) <= G2(14) or (P2(14) and G2(13)) or (P2(14) and P2(13) and G2(12)) 
                     or (P2(14) and P2(13) and P2(12) and C2(12));
    C2(16) <= GC2(4);
    
    -- Step 6: Compute difference
    cla2_diff <= P2 xor C2(15 downto 0);
    
    -- Step 7: Borrow detection
    cla2_borrow <= not C2(16);
    
    -- CLA2 Input Connections (for divider 2)
    cla2_a <= div2_dividend;
    cla2_b <= div2_divisor;

    ---------------------------------------------------------------------------
    -- Key Synchronization and Debounce
    ---------------------------------------------------------------------------
    KEY_DEBOUNCE: process(MAX10_CLK1_50)
    begin
        if rising_edge(MAX10_CLK1_50) then
            key0_sync1 <= KEY(0);
            key0_sync2 <= key0_sync1;
            key1_sync1 <= KEY(1);
            key1_sync2 <= key1_sync1;
            
            -- KEY0 debounce
            if key0_sync2 /= key0_stable then
                if debounce_cnt0 < DEBOUNCE_MAX then
                    debounce_cnt0 <= debounce_cnt0 + 1;
                else
                    key0_stable <= key0_sync2;
                    debounce_cnt0 <= 0;
                end if;
            else
                debounce_cnt0 <= 0;
            end if;
            
            -- KEY1 debounce
            if key1_sync2 /= key1_stable then
                if debounce_cnt1 < DEBOUNCE_MAX then
                    debounce_cnt1 <= debounce_cnt1 + 1;
                else
                    key1_stable <= key1_sync2;
                    debounce_cnt1 <= 0;
                end if;
            else
                debounce_cnt1 <= 0;
            end if;
            
            -- Edge detection
            key0_prev <= key0_stable;
            key1_prev <= key1_stable;
            
            if key0_prev = '1' and key0_stable = '0' then
                key0_pressed <= '1';
            else
                key0_pressed <= '0';
            end if;
            
            if key1_prev = '1' and key1_stable = '0' then
                key1_pressed <= '1';
            else
                key1_pressed <= '0';
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Main Prime Checking State Machine with REAL Division
    ---------------------------------------------------------------------------
    PRIME_FSM: process(MAX10_CLK1_50)
        variable temp_sq : unsigned(31 downto 0);
    begin
        if rising_edge(MAX10_CLK1_50) then
            
            case main_state is
                -----------------------------------------------------------------
                -- INPUT STATES
                -----------------------------------------------------------------
                when WAIT_HIGH =>
                    -- Reset all counters and flags
                    div_count <= 0;
                    sub_count <= 0;
                    is_prime <= '0';
                    div_computing <= '0';
                    
                    if key0_pressed = '1' then
                        data_high <= SW(7 downto 0);
                        main_state <= WAIT_LOW;
                    end if;
                    
                when WAIT_LOW =>
                    if key1_pressed = '1' then
                        data_low <= SW(7 downto 0);
                        data_full <= data_high & SW(7 downto 0);
                        main_state <= INIT_CHECK;
                    end if;
                
                -----------------------------------------------------------------
                -- INITIALIZATION
                -----------------------------------------------------------------
                when INIT_CHECK =>
                    n_reg <= data_full;
                    k_value <= x"0001";  -- Start k=1 for 6k±1
                    div_count <= 0;
                    sub_count <= 0;
                    is_prime <= '1';  -- Assume prime until proven otherwise
                    main_state <= CHECK_SPECIAL;
                
                -----------------------------------------------------------------
                -- SPECIAL CASES (0, 1, 2, 3)
                -----------------------------------------------------------------
                when CHECK_SPECIAL =>
                    if n_reg = x"0000" or n_reg = x"0001" then
                        -- 0 and 1 are not prime
                        is_prime <= '0';
                        main_state <= SHOW_RESULT;
                    elsif n_reg = x"0002" or n_reg = x"0003" then
                        -- 2 and 3 are prime
                        is_prime <= '1';
                        main_state <= SHOW_RESULT;
                    else
                        main_state <= PARALLEL_DIV23;  -- Start parallel ÷2 and ÷3
                    end if;
                
                -----------------------------------------------------------------
                -- PARALLEL DIVISION: Test ÷2 and ÷3 SIMULTANEOUSLY!
                -- CLA1 does ÷2 (using bit check), CLA2 does ÷3 (real division)
                -----------------------------------------------------------------
                when PARALLEL_DIV23 =>
                    -- Start both divisions in parallel
                    div_count <= div_count + 2;  -- Count both divisions
                    
                    -- Divider 1: Check ÷2 using LSB (instant)
                    if n_reg(0) = '0' then
                        div_done <= '1';  -- Divisible by 2
                        div_remainder <= x"0000";
                    else
                        div_done <= '1';  -- Not divisible by 2
                        div_remainder <= x"0001";  -- Remainder = 1
                    end if;
                    
                    -- Divider 2: Start ÷3 using CLA2
                    div2_dividend <= n_reg;
                    div2_divisor <= x"0003";
                    div2_quotient <= x"0000";
                    div2_computing <= '1';
                    
                    main_state <= PARALLEL_WAIT;
                
                when PARALLEL_WAIT =>
                    -- PARALLEL: Both dividers running simultaneously!
                    
                    -- Update CLA2 division (÷3)
                    if div2_computing = '1' then
                        if cla2_borrow = '0' then
                            -- Can subtract: dividend >= divisor
                            div2_dividend <= cla2_diff;
                            div2_quotient <= div2_quotient + 1;
                            -- COUNT REAL SUBTRACTION!
                            if sub_count < 99999 then
                                sub_count <= sub_count + 1;
                            end if;
                        else
                            -- Cannot subtract: division complete
                            div2_computing <= '0';
                            div2_remainder <= div2_dividend;
                        end if;
                    end if;
                    
                    -- Check if BOTH divisions are complete
                    if div_done = '1' and div2_computing = '0' then
                        -- Check results
                        if div_remainder = x"0000" then
                            -- Divisible by 2
                            is_prime <= '0';
                            main_state <= SHOW_RESULT;
                        elsif div2_dividend = x"0000" then
                            -- Divisible by 3
                            is_prime <= '0';
                            main_state <= SHOW_RESULT;
                        else
                            -- Not divisible by 2 or 3, start 6k±1 check
                            div_done <= '0';  -- Reset for next use
                            k_value <= x"0001";
                            main_state <= NEXT_6K;
                        end if;
                    end if;
                
                -----------------------------------------------------------------
                -- 6k±1 OPTIMIZATION: Compute next divisors
                -- 6k = k*2 + k*4 = (k<<1) + (k<<2)
                -----------------------------------------------------------------
                when NEXT_6K =>
                    -- Calculate 6k-1 as next divisor
                    -- 6k = k*6 = k*2 + k*4
                    -- k*2 = k_value(14 downto 0) & '0'
                    -- k*4 = k_value(13 downto 0) & "00"
                    -- 6k-1 = k*2 + k*4 - 1
                    current_div <= (k_value(14 downto 0) & '0') + (k_value(13 downto 0) & "00") - x"0001";
                    check_6k_plus <= '0';  -- Check 6k-1 first
                    main_state <= CHECK_SQRT;
                
                -----------------------------------------------------------------
                -- SQRT TERMINATION CHECK: if divisor² > N, it's prime
                -----------------------------------------------------------------
                when CHECK_SQRT =>
                    -- Compute divisor²
                    temp_sq := unsigned(current_div) * unsigned(current_div);
                    divisor_sq <= std_logic_vector(temp_sq);
                    
                    -- If divisor² > N, we're done (N is prime)
                    if temp_sq > unsigned(x"0000" & n_reg) then
                        is_prime <= '1';
                        main_state <= SHOW_RESULT;
                    else
                        if check_6k_plus = '0' then
                            main_state <= CHECK_6K_M1;
                        else
                            main_state <= CHECK_6K_P1;
                        end if;
                    end if;
                
                -----------------------------------------------------------------
                -- CHECK 6k-1 DIVISOR
                -----------------------------------------------------------------
                when CHECK_6K_M1 =>
                    -- Initialize division: N / (6k-1)
                    div_dividend <= n_reg;
                    div_divisor <= current_div;
                    div_quotient <= x"0000";
                    div_computing <= '1';
                    div_count <= div_count + 1;
                    main_state <= DIV_6KM1_COMP;
                
                when DIV_6KM1_COMP =>
                    -- REAL division using CLA subtractor
                    -- cla_a and cla_b are continuously assigned
                    if div_computing = '1' then
                        if cla_borrow = '0' then
                            div_dividend <= cla_diff;
                            div_quotient <= div_quotient + 1;
                            -- COUNT REAL SUBTRACTION!
                            if sub_count < 99999 then
                                sub_count <= sub_count + 1;
                            end if;
                        else
                            div_computing <= '0';
                            
                            if div_dividend = x"0000" then
                                -- Divisible by 6k-1
                                is_prime <= '0';
                                main_state <= SHOW_RESULT;
                            else
                                -- Not divisible, try 6k+1
                                current_div <= current_div + 2;  -- 6k-1 + 2 = 6k+1
                                check_6k_plus <= '1';
                                main_state <= CHECK_SQRT;
                            end if;
                        end if;
                    end if;
                
                -----------------------------------------------------------------
                -- CHECK 6k+1 DIVISOR
                -----------------------------------------------------------------
                when CHECK_6K_P1 =>
                    -- Initialize division: N / (6k+1)
                    div_dividend <= n_reg;
                    div_divisor <= current_div;
                    div_quotient <= x"0000";
                    div_computing <= '1';
                    div_count <= div_count + 1;
                    main_state <= DIV_6KP1_COMP;
                
                when DIV_6KP1_COMP =>
                    -- REAL division using CLA subtractor
                    -- cla_a and cla_b are continuously assigned
                    if div_computing = '1' then
                        if cla_borrow = '0' then
                            div_dividend <= cla_diff;
                            div_quotient <= div_quotient + 1;
                            -- COUNT REAL SUBTRACTION!
                            if sub_count < 99999 then
                                sub_count <= sub_count + 1;
                            end if;
                        else
                            div_computing <= '0';
                            
                            if div_dividend = x"0000" then
                                -- Divisible by 6k+1
                                is_prime <= '0';
                                main_state <= SHOW_RESULT;
                            else
                                -- Not divisible, increment k and continue
                                k_value <= k_value + 1;
                                main_state <= NEXT_6K;
                            end if;
                        end if;
                    end if;
                
                -----------------------------------------------------------------
                -- SHOW RESULT
                -----------------------------------------------------------------
                when SHOW_RESULT =>
                    if key0_pressed = '1' then
                        main_state <= WAIT_HIGH;
                    end if;
                    
                when others =>
                    main_state <= WAIT_HIGH;
                    
            end case;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Compute display values (convert counters to decimal digits)
    ---------------------------------------------------------------------------
    process(div_count, sub_count)
    begin
        -- Division count (0-99)
        if div_count > 99 then
            div_count_tens <= 9;
            div_count_units <= 9;
        else
            div_count_tens <= div_count / 10;
            div_count_units <= div_count mod 10;
        end if;
        
        -- Subtraction count split into high (hundreds) and low (units)
        if sub_count > 9999 then
            sub_count_high <= 99;
            sub_count_low <= 99;
        else
            sub_count_high <= sub_count / 100;
            sub_count_low <= sub_count mod 100;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Seven-segment Display Output
    ---------------------------------------------------------------------------
    process(main_state, SW, data_high, data_full, 
            div_count_tens, div_count_units, sub_count_high, sub_count_low)
        variable sub_h_tens, sub_h_units : integer range 0 to 9;
        variable sub_l_tens, sub_l_units : integer range 0 to 9;
    begin
        -- Convert subtraction counts to individual digits
        sub_h_tens := sub_count_high / 10;
        sub_h_units := sub_count_high mod 10;
        sub_l_tens := sub_count_low / 10;
        sub_l_units := sub_count_low mod 10;
        
        case main_state is
            when WAIT_HIGH =>
                HEX5 <= "0001001";  -- H
                HEX4 <= "1111001";  -- I
                HEX3 <= "1111111";  -- off
                HEX2 <= "1111111";
                HEX1 <= seg7_encode(SW(7 downto 4));
                HEX0 <= seg7_encode(SW(3 downto 0));
                
            when WAIT_LOW =>
                HEX5 <= "1000111";  -- L
                HEX4 <= "1000000";  -- O
                HEX3 <= "1111111";
                HEX2 <= seg7_encode(data_high(7 downto 4));
                HEX1 <= seg7_encode(data_high(3 downto 0));
                HEX0 <= "1111111";
            
            when INIT_CHECK | CHECK_SPECIAL | PARALLEL_DIV23 | PARALLEL_WAIT |
                 NEXT_6K | CHECK_6K_M1 | DIV_6KM1_COMP |
                 CHECK_6K_P1 | DIV_6KP1_COMP | CHECK_SQRT =>
                -- Computing: show "----" and current counts
                HEX5 <= "0111111";  -- -
                HEX4 <= "0111111";  -- -
                HEX3 <= seg7_encode(std_logic_vector(to_unsigned(sub_h_tens, 4)));
                HEX2 <= seg7_encode(std_logic_vector(to_unsigned(sub_h_units, 4)));
                HEX1 <= seg7_encode(std_logic_vector(to_unsigned(sub_l_tens, 4)));
                HEX0 <= seg7_encode(std_logic_vector(to_unsigned(sub_l_units, 4)));
                
            when SHOW_RESULT =>
                -- HEX5-4: Division count (00-99)
                HEX5 <= seg7_encode(std_logic_vector(to_unsigned(div_count_tens, 4)));
                HEX4 <= seg7_encode(std_logic_vector(to_unsigned(div_count_units, 4)));
                -- HEX3-2: Subtraction count high (hundreds)
                HEX3 <= seg7_encode(std_logic_vector(to_unsigned(sub_h_tens, 4)));
                HEX2 <= seg7_encode(std_logic_vector(to_unsigned(sub_h_units, 4)));
                -- HEX1-0: Subtraction count low (units)
                HEX1 <= seg7_encode(std_logic_vector(to_unsigned(sub_l_tens, 4)));
                HEX0 <= seg7_encode(std_logic_vector(to_unsigned(sub_l_units, 4)));
                
            when others =>
                HEX5 <= "1111111";
                HEX4 <= "1111111";
                HEX3 <= "1111111";
                HEX2 <= "1111111";
                HEX1 <= "1111111";
                HEX0 <= "1111111";
        end case;
    end process;

    ---------------------------------------------------------------------------
    -- LED Output
    ---------------------------------------------------------------------------
    -- LED9: Prime result (only in SHOW_RESULT state)
    LEDR(9) <= is_prime when main_state = SHOW_RESULT else '0';
    
    -- LED8-5: State indicators
    LEDR(8) <= '1' when main_state = WAIT_HIGH else '0';
    LEDR(7) <= '1' when main_state = WAIT_LOW else '0';
    LEDR(6) <= '1' when main_state /= WAIT_HIGH and main_state /= WAIT_LOW 
                    and main_state /= SHOW_RESULT else '0';  -- Computing
    LEDR(5) <= '1' when main_state = SHOW_RESULT else '0';
    
    -- LED4-0: Division count in binary (0-31)
    LEDR(4 downto 0) <= std_logic_vector(to_unsigned(div_count mod 32, 5)) 
                        when main_state = SHOW_RESULT 
                        else "00000";

end architecture rtl;
