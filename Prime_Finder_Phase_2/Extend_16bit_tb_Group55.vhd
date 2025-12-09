--------------------------------------------------------------------------------
-- Testbench: Extend_16bit_tb
-- 功能描述: 测试16位质数检测器 (时分复用输入)
-- 测试用例: 2个 (N=17小质数, N=257大质数)
-- 
-- 波形观察点:
--   1. state状态变化: WAIT_HIGH -> WAIT_LOW -> COMPUTING -> SHOW_RESULT
--   2. data_full信号: 高低位正确组合
--   3. Is_Prime结果
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Extend_16bit_tb_Group55 is
end entity Extend_16bit_tb_Group55;

architecture sim of Extend_16bit_tb_Group55 is

    ---------------------------------------------------------------------------
    -- 被测模块声明
    ---------------------------------------------------------------------------
    component Prime_Finder_16bit_Top_Group55 is
        port(
            MAX10_CLK1_50 : in  std_logic;
            SW            : in  std_logic_vector(9 downto 0);
            KEY           : in  std_logic_vector(1 downto 0);
            HEX0          : out std_logic_vector(6 downto 0);
            HEX1          : out std_logic_vector(6 downto 0);
            HEX2          : out std_logic_vector(6 downto 0);
            HEX3          : out std_logic_vector(6 downto 0);
            HEX4          : out std_logic_vector(6 downto 0);
            HEX5          : out std_logic_vector(6 downto 0);
            LEDR          : out std_logic_vector(9 downto 0)
        );
    end component;

    ---------------------------------------------------------------------------
    -- 测试信号
    ---------------------------------------------------------------------------
    signal CLK  : std_logic := '0';
    signal SW   : std_logic_vector(9 downto 0) := "0000000000";
    signal KEY  : std_logic_vector(1 downto 0) := "11";  -- 未按下 (active low)
    signal HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : std_logic_vector(6 downto 0);
    signal LEDR : std_logic_vector(9 downto 0);
    
    -- 时钟周期
    constant CLK_PERIOD : time := 20 ns;

begin

    ---------------------------------------------------------------------------
    -- 实例化被测模块
    ---------------------------------------------------------------------------
    UUT: Prime_Finder_16bit_Top_Group55 port map(
        MAX10_CLK1_50 => CLK,
        SW            => SW,
        KEY           => KEY,
        HEX0          => HEX0,
        HEX1          => HEX1,
        HEX2          => HEX2,
        HEX3          => HEX3,
        HEX4          => HEX4,
        HEX5          => HEX5,
        LEDR          => LEDR
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
        wait for CLK_PERIOD * 5;
        
        -----------------------------------------------------------------------
        -- 测试1: N=17 (0x0011) - 小质数
        -- 高8位 = 0x00 = 00000000
        -- 低8位 = 0x11 = 00010001
        -----------------------------------------------------------------------
        report "=== Test 1: N=17 (0x0011) ===" severity note;
        report "Step 1: Input high byte = 0x00" severity note;
        
        -- 设置高8位
        SW <= "0000000000";  -- 高位 = 0x00
        wait for CLK_PERIOD * 2;
        
        -- 按KEY0锁存高位
        KEY <= "10";  -- KEY0 pressed
        wait for CLK_PERIOD * 2;
        KEY <= "11";  -- KEY0 released
        wait for CLK_PERIOD * 5;
        
        report "Step 2: Input low byte = 0x11 (17)" severity note;
        
        -- 设置低8位
        SW <= "0000010001";  -- 低位 = 0x11 = 17
        wait for CLK_PERIOD * 2;
        
        -- 按KEY1开始计算
        KEY <= "01";  -- KEY1 pressed
        wait for CLK_PERIOD * 2;
        KEY <= "11";  -- KEY1 released
        
        report "Step 3: Computing..." severity note;
        
        -- 等待计算完成
        wait for CLK_PERIOD * 200;
        
        -- 检查结果
        report "Result: LEDR(9)=" & std_logic'image(LEDR(9)) & 
               " (1=Prime, 0=Not Prime)" severity note;
        
        -- 按KEY0重新开始
        wait for CLK_PERIOD * 10;
        KEY <= "10";
        wait for CLK_PERIOD * 2;
        KEY <= "11";
        wait for CLK_PERIOD * 5;
        
        -----------------------------------------------------------------------
        -- 测试2: N=257 (0x0101) - 大质数
        -- 高8位 = 0x01 = 00000001
        -- 低8位 = 0x01 = 00000001
        -----------------------------------------------------------------------
        report "=== Test 2: N=257 (0x0101) ===" severity note;
        report "Step 1: Input high byte = 0x01" severity note;
        
        -- 设置高8位
        SW <= "0000000001";  -- 高位 = 0x01
        wait for CLK_PERIOD * 2;
        
        -- 按KEY0
        KEY <= "10";
        wait for CLK_PERIOD * 2;
        KEY <= "11";
        wait for CLK_PERIOD * 5;
        
        report "Step 2: Input low byte = 0x01" severity note;
        
        -- 设置低8位
        SW <= "0000000001";  -- 低位 = 0x01
        wait for CLK_PERIOD * 2;
        
        -- 按KEY1
        KEY <= "01";
        wait for CLK_PERIOD * 2;
        KEY <= "11";
        
        report "Step 3: Computing..." severity note;
        
        -- 等待计算完成
        wait for CLK_PERIOD * 200;
        
        -- 检查结果
        report "Result: LEDR(9)=" & std_logic'image(LEDR(9)) severity note;
        
        -----------------------------------------------------------------------
        -- 测试完成
        -----------------------------------------------------------------------
        report "========================================" severity note;
        report "16-bit Extension tests completed!" severity note;
        report "Key observations in waveform:" severity note;
        report "  1. State transitions: WAIT_HIGH->WAIT_LOW->COMPUTING->SHOW" severity note;
        report "  2. data_full combines high and low bytes correctly" severity note;
        report "========================================" severity note;
        
        wait;
    end process;

end architecture sim;
