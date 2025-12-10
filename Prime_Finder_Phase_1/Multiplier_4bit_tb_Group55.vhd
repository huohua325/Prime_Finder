--------------------------------------------------------------------------------
-- Testbench: Multiplier_4bit_Group55
-- Test key cases of the 4-bit multiplier
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Multiplier_4bit_tb is
end entity Multiplier_4bit_tb;

architecture test of Multiplier_4bit_tb is

    -- Unit Under Test
    component Multiplier_4bit_Group55 is
        port(
            A       : in  std_logic_vector(3 downto 0);
            B       : in  std_logic_vector(3 downto 0);
            Product : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Test signals
    signal A_tb, B_tb     : std_logic_vector(3 downto 0) := "0000";
    signal Product_tb     : std_logic_vector(7 downto 0);

begin

    -- Instantiate Unit Under Test
    UUT: Multiplier_4bit_Group55 port map(
        A       => A_tb,
        B       => B_tb,
        Product => Product_tb
    );

    -- Test process (simplified version - 4 typical examples, suitable for video demo)
    -- Total time approximately 100ns
    STIM: process
    begin
        -- Test 1: 0 x 0 = 0 (boundary)
        A_tb <= "0000"; B_tb <= "0000"; wait for 20 ns;
        
        -- Test 2: 3 x 5 = 15 (small numbers)
        A_tb <= "0011"; B_tb <= "0101"; wait for 20 ns;
        
        -- Test 3: 7 x 8 = 56 (medium)
        A_tb <= "0111"; B_tb <= "1000"; wait for 20 ns;
        
        -- Test 4: 15 x 15 = 225 (maximum)
        A_tb <= "1111"; B_tb <= "1111"; wait for 20 ns;
        
        -- Test complete
        wait;
    end process STIM;

end architecture test;
