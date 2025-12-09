--------------------------------------------------------------------------------
-- Testbench: Multiplier_4bit_Group55
-- 测试4位乘法器的关键用例
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Multiplier_4bit_tb is
end entity Multiplier_4bit_tb;

architecture test of Multiplier_4bit_tb is

    -- 被测模块
    component Multiplier_4bit_Group55 is
        port(
            A       : in  std_logic_vector(3 downto 0);
            B       : in  std_logic_vector(3 downto 0);
            Product : out std_logic_vector(7 downto 0)
        );
    end component;

    -- 测试信号
    signal A_tb, B_tb     : std_logic_vector(3 downto 0) := "0000";
    signal Product_tb     : std_logic_vector(7 downto 0);

begin

    -- 实例化被测模块
    UUT: Multiplier_4bit_Group55 port map(
        A       => A_tb,
        B       => B_tb,
        Product => Product_tb
    );

    -- 测试过程 (精简版 - 4个典型例子，适合视频展示)
    -- 总时间约 100ns
    STIM: process
    begin
        -- 测试1: 0 x 0 = 0 (边界)
        A_tb <= "0000"; B_tb <= "0000"; wait for 20 ns;
        
        -- 测试2: 3 x 5 = 15 (小数)
        A_tb <= "0011"; B_tb <= "0101"; wait for 20 ns;
        
        -- 测试3: 7 x 8 = 56 (中等)
        A_tb <= "0111"; B_tb <= "1000"; wait for 20 ns;
        
        -- 测试4: 15 x 15 = 225 (最大)
        A_tb <= "1111"; B_tb <= "1111"; wait for 20 ns;
        
        -- 测试完成
        wait;
    end process STIM;

end architecture test;
