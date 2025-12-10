--------------------------------------------------------------------------------
-- Testbench: CLA_Pipeline_tb
-- 功能描述: 测试CLA+流水线除法器，并与原版RipSub对比
-- 测试用例: 3个连续输入 (N=7, 8, 9 除以3)
-- 
-- 波形观察点:
--   1. CLA vs RipSub: CLA的Done信号应更早变为'1'
--   2. 流水线效果: 3个结果依次输出，间隔小于单个计算时间
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity CLA_Pipeline_tb_Group55 is
end entity CLA_Pipeline_tb_Group55;

architecture sim of CLA_Pipeline_tb_Group55 is

    ---------------------------------------------------------------------------
    -- 被测模块声明: CLA版本
    ---------------------------------------------------------------------------
    component LongDivision_CLA_Pipeline_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0);
            Done      : out std_logic;
            Sub_Count : out std_logic_vector(3 downto 0)
        );
    end component;
    
    ---------------------------------------------------------------------------
    -- 对比模块声明: 原版RipSub版本
    ---------------------------------------------------------------------------
    component LongDivision_4bit_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0);
            Done      : out std_logic;
            Sub_Count : out std_logic_vector(3 downto 0)
        );
    end component;

    ---------------------------------------------------------------------------
    -- 测试信号
    ---------------------------------------------------------------------------
    signal CLK       : std_logic := '0';
    signal Load      : std_logic := '0';
    signal Dividend  : std_logic_vector(3 downto 0) := "0000";
    signal Divisor   : std_logic_vector(3 downto 0) := "0011";  -- 固定除以3
    
    -- CLA版本输出
    signal Q_CLA, R_CLA : std_logic_vector(3 downto 0);
    signal Done_CLA     : std_logic;
    signal SC_CLA       : std_logic_vector(3 downto 0);  -- Sub_Count (NEW)
    
    -- RipSub版本输出
    signal Q_Rip, R_Rip : std_logic_vector(3 downto 0);
    signal Done_Rip     : std_logic;
    signal SC_Rip       : std_logic_vector(3 downto 0);  -- Sub_Count (NEW)
    
    -- 时钟周期
    constant CLK_PERIOD : time := 20 ns;
    
    -- 性能测量
    signal cycle_cla : integer := 0;
    signal cycle_rip : integer := 0;
    signal measuring : std_logic := '0';

begin

    ---------------------------------------------------------------------------
    -- 实例化CLA版本 (被测)
    ---------------------------------------------------------------------------
    UUT_CLA: LongDivision_CLA_Pipeline_Group55 port map(
        Dividend  => Dividend,
        Divisor   => Divisor,
        CLK       => CLK,
        Load      => Load,
        Quotient  => Q_CLA,
        Remainder => R_CLA,
        Done      => Done_CLA,
        Sub_Count => SC_CLA
    );
    
    ---------------------------------------------------------------------------
    -- 实例化RipSub版本 (对比)
    ---------------------------------------------------------------------------
    UUT_RIP: LongDivision_4bit_Group55 port map(
        Dividend  => Dividend,
        Divisor   => Divisor,
        CLK       => CLK,
        Load      => Load,
        Quotient  => Q_Rip,
        Remainder => R_Rip,
        Done      => Done_Rip,
        Sub_Count => SC_Rip
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
    -- 周期计数器
    ---------------------------------------------------------------------------
    COUNT_PROC: process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                cycle_cla <= 0;
                cycle_rip <= 0;
                measuring <= '1';
            elsif measuring = '1' then
                if Done_CLA = '0' then
                    cycle_cla <= cycle_cla + 1;
                end if;
                if Done_Rip = '0' then
                    cycle_rip <= cycle_rip + 1;
                end if;
                if Done_CLA = '1' and Done_Rip = '1' then
                    measuring <= '0';
                end if;
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
        -- Part 1: 单次操作对比 CLA vs RipSub
        -----------------------------------------------------------------------
        report "=== Part 1: CLA vs RipSub Speed Comparison ===" severity note;
        report "Test: 7 / 3" severity note;
        
        Dividend <= "0111";  -- 7
        Divisor <= "0011";   -- 3
        Load <= '1';
        wait for CLK_PERIOD;
        Load <= '0';
        
        -- 等待两者都完成
        wait until Done_CLA = '1' and Done_Rip = '1';
        wait for CLK_PERIOD;
        
        -- 验证结果相同
        assert Q_CLA = Q_Rip 
            report "FAIL: Quotient mismatch! CLA=" & integer'image(conv_integer(Q_CLA)) &
                   " RIP=" & integer'image(conv_integer(Q_Rip))
            severity error;
        assert R_CLA = R_Rip 
            report "FAIL: Remainder mismatch!"
            severity error;
        
        report "Result: 7/3 = " & integer'image(conv_integer(Q_CLA)) & 
               " R " & integer'image(conv_integer(R_CLA)) severity note;
        report "CLA cycles: " & integer'image(cycle_cla) & 
               ", RipSub cycles: " & integer'image(cycle_rip) severity note;
        report "CLA Sub_Count: " & integer'image(conv_integer(SC_CLA)) &
               ", RipSub Sub_Count: " & integer'image(conv_integer(SC_Rip)) severity note;
        
        wait for CLK_PERIOD * 5;
        
        -----------------------------------------------------------------------
        -- Part 2: 连续输入展示流水线效果
        -----------------------------------------------------------------------
        report "=== Part 2: Pipeline Throughput (3 consecutive inputs) ===" severity note;
        
        -- 输入1: 7/3
        Dividend <= "0111";
        Load <= '1';
        wait for CLK_PERIOD;
        
        -- 输入2: 8/3
        Dividend <= "1000";
        wait for CLK_PERIOD;
        
        -- 输入3: 9/3
        Dividend <= "1001";
        wait for CLK_PERIOD;
        
        Load <= '0';
        
        -- 等待所有结果
        report "Inputs sent: 7, 8, 9 (all /3)" severity note;
        report "Watch waveform: Done signals should trigger in sequence" severity note;
        
        wait for CLK_PERIOD * 20;
        
        -----------------------------------------------------------------------
        -- 测试完成
        -----------------------------------------------------------------------
        report "========================================" severity note;
        report "CLA + Pipeline tests completed!" severity note;
        report "Key observations:" severity note;
        report "  1. CLA should complete faster than RipSub" severity note;
        report "  2. Pipeline: 3 outputs in sequence" severity note;
        report "========================================" severity note;
        
        wait;
    end process;

end architecture sim;
