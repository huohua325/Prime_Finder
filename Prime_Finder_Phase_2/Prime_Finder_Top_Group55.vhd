--------------------------------------------------------------------------------
-- Module Name: Prime_Finder_Top_Group55
-- Description: DE10-Lite development board top-level wrapper
-- Features:
--   1. Prime_Finder core module
--   2. Seven-segment display driver (decimal display)
--   3. Pin mapping
--
-- DE10-Lite Resource Mapping:
--   SW7-SW4  -> Dividend
--   SW3-SW0  -> Divisor
--   SW9      -> Load signal
--   KEY0     -> Optional reset
--   HEX0-HEX1 -> Q_out (Quotient, decimal display)
--   HEX4-HEX5 -> R_out (Remainder, decimal display)
--   LED9     -> Is_Prime indicator
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_Top_Group55 is
    port(
        -- Clock
        MAX10_CLK1_50 : in  std_logic;                      -- 50MHz clock
        
        -- Switch input
        SW            : in  std_logic_vector(9 downto 0);   -- 10 switches
        
        -- Seven-segment displays (active low)
        HEX0          : out std_logic_vector(6 downto 0);   -- Quotient ones
        HEX1          : out std_logic_vector(6 downto 0);   -- Quotient tens
        HEX2          : out std_logic_vector(6 downto 0);   -- Unused
        HEX3          : out std_logic_vector(6 downto 0);   -- Unused
        HEX4          : out std_logic_vector(6 downto 0);   -- Remainder ones
        HEX5          : out std_logic_vector(6 downto 0);   -- Remainder tens
        
        -- LED output
        LEDR          : out std_logic_vector(9 downto 0)    -- 10 LEDs
    );
end entity Prime_Finder_Top_Group55;

architecture rtl of Prime_Finder_Top_Group55 is

    ---------------------------------------------------------------------------
    -- Submodule Declaration: Prime_Finder Core
    ---------------------------------------------------------------------------
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

    ---------------------------------------------------------------------------
    -- Internal Signals
    ---------------------------------------------------------------------------
    signal quotient_4bit  : std_logic_vector(3 downto 0);
    signal remainder_4bit : std_logic_vector(3 downto 0);
    signal is_prime_sig   : std_logic;
    
    -- Decimal conversion signals
    signal q_tens, q_ones : std_logic_vector(3 downto 0);  -- Quotient tens and ones
    signal r_tens, r_ones : std_logic_vector(3 downto 0);  -- Remainder tens and ones

    ---------------------------------------------------------------------------
    -- Seven-segment Display Encoding Function (active low: 0=on, 1=off)
    -- Segment layout:  0
    --                5   1
    --                  6
    --                4   2
    --                  3
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
            when others => seg := "1111111";  -- Off (for invalid input)
        end case;
        return seg;
    end function;

begin

    ---------------------------------------------------------------------------
    -- Instantiate Prime_Finder Core Module
    ---------------------------------------------------------------------------
    CORE: Prime_Finder_Group55 port map(
        Dividend  => SW(7 downto 4),   -- SW7-SW4 as dividend
        Divisor   => SW(3 downto 0),   -- SW3-SW0 as divisor
        CLK       => MAX10_CLK1_50,    -- 50MHz clock
        Load      => SW(9),            -- SW9 as load signal
        Q_out     => quotient_4bit,
        R_out     => remainder_4bit,
        Is_Prime  => is_prime_sig
    );

    ---------------------------------------------------------------------------
    -- Binary to Decimal (4-bit binary -> tens + ones)
    -- Range: 0-15, tens can only be 0 or 1
    ---------------------------------------------------------------------------
    
    -- Quotient decimal conversion
    process(quotient_4bit)
    begin
        if quotient_4bit >= "1010" then      -- >= 10
            q_tens <= "0001";                 -- Tens = 1
            q_ones <= quotient_4bit - "1010"; -- Ones = value - 10
        else
            q_tens <= "0000";                 -- Tens = 0
            q_ones <= quotient_4bit;          -- Ones = value
        end if;
    end process;
    
    -- Remainder decimal conversion
    process(remainder_4bit)
    begin
        if remainder_4bit >= "1010" then      -- >= 10
            r_tens <= "0001";                  -- Tens = 1
            r_ones <= remainder_4bit - "1010"; -- Ones = value - 10
        else
            r_tens <= "0000";                  -- Tens = 0
            r_ones <= remainder_4bit;          -- Ones = value
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Seven-segment Display Output
    ---------------------------------------------------------------------------
    HEX0 <= seg7_encode(q_ones);  -- Quotient ones
    HEX1 <= seg7_encode(q_tens);  -- Quotient tens
    HEX2 <= "1111111";            -- Off (unused)
    HEX3 <= "1111111";            -- Off (unused)
    HEX4 <= seg7_encode(r_ones);  -- Remainder ones
    HEX5 <= seg7_encode(r_tens);  -- Remainder tens

    ---------------------------------------------------------------------------
    -- LED Output
    ---------------------------------------------------------------------------
    LEDR(9) <= is_prime_sig;      -- LED9 shows if prime
    LEDR(8 downto 4) <= "00000";  -- LED8-LED4 off
    LEDR(3 downto 0) <= quotient_4bit;  -- LED3-LED0 show quotient binary (optional)

end architecture rtl;
