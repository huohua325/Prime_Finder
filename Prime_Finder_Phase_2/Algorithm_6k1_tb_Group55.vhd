--------------------------------------------------------------------------------
-- Testbench: Algorithm_6k1_tb
-- 功能描述: 测试6k±1算法质数检测器
-- 测试用例: 2个 (质数N=13, 合数N=9)
-- 
-- 波形观察点:
--   1. Div_Count信号 -> 展示除法次数减少
--   2. N=13: 传统方法需11次，6k±1只需2次
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Algorithm_6k1_tb_Group55 is
end entity Algorithm_6k1_tb_Group55;

architecture sim of Algorithm_6k1_tb_Group55 is

    ---------------------------------------------------------------------------
    -- 被测模块声明
    ---------------------------------------------------------------------------
    component Prime_Finder_6k1_Group55 is
        port(
            N            : in  std_logic_vector(3 downto 0);
            CLK          : in  std_logic;
            Load         : in  std_logic;
            Is_Prime     : out std_logic;
            Done         : out std_logic;
            Div_Count    : out std_logic_vector(3 downto 0);
            Sub_Count    : out std_logic_vector(7 downto 0)
        );
    end component;

    ---------------------------------------------------------------------------
    -- 测试信号
    ---------------------------------------------------------------------------
    signal CLK       : std_logic := '0';
    signal Load      : std_logic := '0';
    signal N         : std_logic_vector(3 downto 0) := "0000";
    signal Is_Prime  : std_logic;
    signal Done      : std_logic;
    signal Div_Count : std_logic_vector(3 downto 0);
    signal Sub_Count : std_logic_vector(7 downto 0);  -- 减法计数 (NEW)
    
    -- 时钟周期
    constant CLK_PERIOD : time := 20 ns;

begin

    ---------------------------------------------------------------------------
    -- 实例化被测模块
    ---------------------------------------------------------------------------
    UUT: Prime_Finder_6k1_Group55 port map(
        N         => N,
        CLK       => CLK,
        Load      => Load,
        Is_Prime  => Is_Prime,
        Done      => Done,
        Div_Count => Div_Count,
        Sub_Count => Sub_Count
    );

    ---------------------------------------------------------------------------
    -- 时钟生成
    ---------------------------------------------------------------------------
    CLK_PROC: process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    ---------------------------------------------------------------------------
    -- 测试过程
    ---------------------------------------------------------------------------
    TEST_PROC: process
    begin
        -- 初始等待
        wait for CLK_PERIOD * 2;
        
        -----------------------------------------------------------------------
        -- 测试1: N=13 (质数)
        -- 期望: Is_Prime=1, Div_Count=2 (只测试2和3)
        -- 传统方法需要测试: 2,3,4,5,6,7,8,9,10,11,12 = 11次
        -- 6k±1方法只需测试: 2,3 (因为5>sqrt(13)) = 2次
        -----------------------------------------------------------------------
        report "=== Test 1: N=13 (Prime) ===" severity note;
        report "Traditional method: 11 divisions" severity note;
        report "6k+/-1 method: should be ~2 divisions" severity note;
        
        N <= "1101";  -- N = 13
        Load <= '1';
        wait for CLK_PERIOD;
        Load <= '0';
        
        -- 等待完成
        wait until Done = '1';
        wait for CLK_PERIOD;
        
        -- 验证结果
        assert Is_Prime = '1' 
            report "FAIL: N=13 should be prime" 
            severity error;
        
        report "Test 1 Result: Is_Prime=" & std_logic'image(Is_Prime) & 
               ", Div_Count=" & integer'image(conv_integer(Div_Count)) &
               ", Sub_Count=" & integer'image(conv_integer(Sub_Count))
            severity note;
        
        -- 验证除法次数 (应该是2次: 测试2和3)
        assert Div_Count <= "0010" 
            report "NOTE: Div_Count=" & integer'image(conv_integer(Div_Count)) & 
                   " (expected <=2)"
            severity note;
        
        wait for CLK_PERIOD * 10;
        
        -----------------------------------------------------------------------
        -- 测试2: N=9 (合数, 被3整除)
        -- 期望: Is_Prime=0, Div_Count=2 (测试2不整除，测试3整除，停止)
        -----------------------------------------------------------------------
        report "=== Test 2: N=9 (Not Prime, divisible by 3) ===" severity note;
        
        N <= "1001";  -- N = 9
        Load <= '1';
        wait for CLK_PERIOD;
        Load <= '0';
        
        -- 等待完成
        wait until Done = '1';
        wait for CLK_PERIOD;
        
        -- 验证结果
        assert Is_Prime = '0' 
            report "FAIL: N=9 should not be prime" 
            severity error;
        
        report "Test 2 Result: Is_Prime=" & std_logic'image(Is_Prime) & 
               ", Div_Count=" & integer'image(conv_integer(Div_Count)) &
               ", Sub_Count=" & integer'image(conv_integer(Sub_Count))
            severity note;
        
        wait for CLK_PERIOD * 5;
        
        -----------------------------------------------------------------------
        -- 测试完成
        -----------------------------------------------------------------------
        report "========================================" severity note;
        report "All 6k+/-1 Algorithm tests completed!" severity note;
        report "Key observation: Div_Count shows reduced divisions" severity note;
        report "========================================" severity note;
        
        wait;
    end process;

end architecture sim;
