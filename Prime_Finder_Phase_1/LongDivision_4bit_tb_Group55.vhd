--------------------------------------------------------------------------------
-- Testbench: LongDivision_4bit_Group55
-- 测试4位除法器的关键用例
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity LongDivision_4bit_tb is
end entity LongDivision_4bit_tb;

architecture test of LongDivision_4bit_tb is

    -- 被测模块
    component LongDivision_4bit_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0)
        );
    end component;

    -- 测试信号
    signal Dividend_tb  : std_logic_vector(3 downto 0) := "0000";
    signal Divisor_tb   : std_logic_vector(3 downto 0) := "0001";
    signal CLK_tb       : std_logic := '0';
    signal Load_tb      : std_logic := '0';
    signal Quotient_tb  : std_logic_vector(3 downto 0);
    signal Remainder_tb : std_logic_vector(3 downto 0);

    -- 时钟周期
    constant CLK_PERIOD : time := 20 ns;

begin

    -- 实例化被测模块
    UUT: LongDivision_4bit_Group55 port map(
        Dividend  => Dividend_tb,
        Divisor   => Divisor_tb,
        CLK       => CLK_tb,
        Load      => Load_tb,
        Quotient  => Quotient_tb,
        Remainder => Remainder_tb
    );

    -- 时钟生成
    CLK_GEN: process
    begin
        CLK_tb <= '0'; wait for CLK_PERIOD/2;
        CLK_tb <= '1'; wait for CLK_PERIOD/2;
    end process CLK_GEN;

    -- 测试过程 (精简版 - 4个典型例子，适合视频展示)
    -- 总时间约 800ns
    STIM: process
    begin
        wait for CLK_PERIOD * 2;  -- 40ns 初始化
        
        -- 测试1: 15 / 3 = 5 余 0 (整除)
        Dividend_tb <= "1111"; Divisor_tb <= "0011";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 10;
        
        -- 测试2: 7 / 2 = 3 余 1 (有余数)
        Dividend_tb <= "0111"; Divisor_tb <= "0010";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -- 测试3: 5 / 7 = 0 余 5 (被除数<除数)
        Dividend_tb <= "0101"; Divisor_tb <= "0111";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 6;
        
        -- 测试4: 8 / 0 = 15 余 8 (除以零)
        Dividend_tb <= "1000"; Divisor_tb <= "0000";
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 6;
        
        -- 测试完成
        wait;
    end process STIM;

end architecture test;
