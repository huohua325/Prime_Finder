--------------------------------------------------------------------------------
-- Testbench: Parallel_tb
-- 功能描述: 测试并行质数检测器
-- 测试用例: 2个 (质数N=7, 合数N=9)
-- 
-- 波形观察点:
--   1. Done2, Done3, Done5 同时变为'1' -> 证明并行工作
--   2. 从Load上升沿到Done='1'的周期数 -> 对比串行方案
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Parallel_tb_Group55 is
end entity Parallel_tb_Group55;

architecture sim of Parallel_tb_Group55 is

    ---------------------------------------------------------------------------
    -- 被测模块声明
    ---------------------------------------------------------------------------
    component Prime_Finder_Parallel_Group55 is
        port(
            N         : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Is_Prime  : out std_logic;
            Done      : out std_logic
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
    
    -- 时钟周期
    constant CLK_PERIOD : time := 20 ns;  -- 50MHz
    
    -- 测试计数
    signal cycle_count : integer := 0;

begin

    ---------------------------------------------------------------------------
    -- 实例化被测模块
    ---------------------------------------------------------------------------
    UUT: Prime_Finder_Parallel_Group55 port map(
        N        => N,
        CLK      => CLK,
        Load     => Load,
        Is_Prime => Is_Prime,
        Done     => Done
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
    -- 周期计数器 (用于性能测量)
    ---------------------------------------------------------------------------
    COUNT_PROC: process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                cycle_count <= 0;
            elsif Done = '0' then
                cycle_count <= cycle_count + 1;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- 测试过程
    ---------------------------------------------------------------------------
    TEST_PROC: process
    begin
        -- 初始等待
        wait for CLK_PERIOD * 2;
        
        -----------------------------------------------------------------------
        -- 测试1: N=7 (质数)
        -- 期望: Is_Prime=1, 3个除法器同时完成
        -----------------------------------------------------------------------
        report "=== Test 1: N=7 (Prime) ===" severity note;
        N <= "0111";  -- N = 7
        Load <= '1';
        wait for CLK_PERIOD;
        Load <= '0';
        
        -- 等待完成
        wait until Done = '1';
        wait for CLK_PERIOD;
        
        -- 验证结果
        assert Is_Prime = '1' 
            report "FAIL: N=7 should be prime, got Is_Prime=0" 
            severity error;
        report "Test 1 PASSED: N=7 is prime, cycles=" & integer'image(cycle_count) 
            severity note;
        
        wait for CLK_PERIOD * 5;
        
        -----------------------------------------------------------------------
        -- 测试2: N=9 (合数, 被3整除)
        -- 期望: Is_Prime=0
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
            report "FAIL: N=9 should not be prime, got Is_Prime=1" 
            severity error;
        report "Test 2 PASSED: N=9 is not prime, cycles=" & integer'image(cycle_count) 
            severity note;
        
        wait for CLK_PERIOD * 5;
        
        -----------------------------------------------------------------------
        -- 测试完成
        -----------------------------------------------------------------------
        report "========================================" severity note;
        report "All Parallel Divider tests completed!" severity note;
        report "========================================" severity note;
        
        wait;
    end process;

end architecture sim;
