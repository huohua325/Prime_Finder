--------------------------------------------------------------------------------
-- Testbench: Prime_Finder_Group55
-- 测试质数判断器
-- 
-- 测试方法:
--   新的质数判断逻辑基于除法器的商和余数
--   需要测试不同的被除数和除数组合，验证:
--   1. 除法结果正确
--   2. 当找到因子时 Is_Prime=0
--   3. 当没找到因子时 Is_Prime=1
--   4. 特殊情况 (0, 1) 处理正确
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_tb is
end entity Prime_Finder_tb;

architecture test of Prime_Finder_tb is

    -- 被测模块
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

    -- 测试信号
    signal Dividend_tb : std_logic_vector(3 downto 0) := "0000";
    signal Divisor_tb  : std_logic_vector(3 downto 0) := "0010";
    signal CLK_tb      : std_logic := '0';
    signal Load_tb     : std_logic := '0';
    signal Q_out_tb    : std_logic_vector(3 downto 0);
    signal R_out_tb    : std_logic_vector(3 downto 0);
    signal Is_Prime_tb : std_logic;

    -- 时钟周期
    constant CLK_PERIOD : time := 20 ns;

begin

    -- 实例化被测模块
    UUT: Prime_Finder_Group55 port map(
        Dividend  => Dividend_tb,
        Divisor   => Divisor_tb,
        CLK       => CLK_tb,
        Load      => Load_tb,
        Q_out     => Q_out_tb,
        R_out     => R_out_tb,
        Is_Prime  => Is_Prime_tb
    );

    -- 时钟生成
    CLK_GEN: process
    begin
        CLK_tb <= '0'; wait for CLK_PERIOD/2;
        CLK_tb <= '1'; wait for CLK_PERIOD/2;
    end process CLK_GEN;

    -- 测试过程 (精简版 - 5个典型例子，适合视频展示)
    -- 总时间约 1200ns
    STIM: process
    begin
        wait for CLK_PERIOD * 2;  -- 40ns 初始化
        
        -----------------------------------------------------------------------
        -- 测试1: 特殊情况 - 1 不是质数
        -- 期望: Is_Prime = 0
        -----------------------------------------------------------------------
        Dividend_tb <= "0001"; Divisor_tb <= "0010";  -- 1 ÷ 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- 测试2: 非质数 6 ÷ 2 = 3 余 0 (找到因子)
        -- 期望: Q=3, R=0, Is_Prime=0
        -----------------------------------------------------------------------
        Dividend_tb <= "0110"; Divisor_tb <= "0010";  -- 6 ÷ 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- 测试3: 质数 7 ÷ 2 = 3 余 1 (不能整除)
        -- 期望: Q=3, R=1, Is_Prime=1
        -----------------------------------------------------------------------
        Dividend_tb <= "0111"; Divisor_tb <= "0010";  -- 7 ÷ 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- 测试4: 非质数 9 ÷ 3 = 3 余 0 (找到因子)
        -- 期望: Q=3, R=0, Is_Prime=0
        -----------------------------------------------------------------------
        Dividend_tb <= "1001"; Divisor_tb <= "0011";  -- 9 ÷ 3
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 8;
        
        -----------------------------------------------------------------------
        -- 测试5: 质数 13 ÷ 2 = 6 余 1 (不能整除)
        -- 期望: Q=6, R=1, Is_Prime=1
        -----------------------------------------------------------------------
        Dividend_tb <= "1101"; Divisor_tb <= "0010";  -- 13 ÷ 2
        Load_tb <= '1'; wait for CLK_PERIOD;
        Load_tb <= '0'; wait for CLK_PERIOD * 10;
        
        -- 测试完成
        wait;
    end process STIM;

end architecture test;
