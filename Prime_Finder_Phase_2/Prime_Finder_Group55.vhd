--------------------------------------------------------------------------------
-- 模块名称: Prime_Finder_Group55
-- 功能描述: 顶层模块，判断4位二进制数是否为质数
-- 设计要求:
--   1. 必须有CLK和Load信号
--   2. 调用LongDivision_4bit子模块
--   3. 检查除法器的商和余数来判断质数
-- 层级关系: Prime_Finder是LongDivision_4bit的父级（顶层模块）
--
-- 质数判断逻辑 (使用除法器结果):
--   4位数范围0-15内的质数: 2, 3, 5, 7, 11, 13
--
-- 判断方法:
--   1. 如果 N < 2，不是质数 (0, 1)
--   2. 如果 N = 2，是质数
--   3. 检查除法结果:
--      - 如果 余数=0 且 商>1 且 除数>1 且 除数<N，则N能被整除，不是质数
--      - 否则，根据当前除法结果，可能是质数
--
-- 使用方法:
--   用户设置被除数(Dividend)和除数(Divisor)，观察:
--   - 如果余数R_out=0，且商Q_out>1，说明能被整除，Is_Prime=0
--   - 用户可以手动测试除数2,3,4...来验证是否为质数
--
-- 接口说明:
--   Dividend: 要检测的数 (连接到SW7-SW4)
--   Divisor:  测试用的除数 (连接到SW3-SW0)
--   Load:     加载新数据 (连接到SW9)
--   CLK:      时钟信号 (连接到MAX10_CLK1_50)
--   Q_out:    商输出 (显示在HEX0-HEX1)
--   R_out:    余数输出 (显示在HEX4-HEX5)
--   Is_Prime: 质数标志 (连接到LED9)
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  -- 用于比较操作

entity Prime_Finder_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- 要检测的数
        Divisor   : in  std_logic_vector(3 downto 0);  -- 除数输入
        CLK       : in  std_logic;                      -- 时钟信号
        Load      : in  std_logic;                      -- 加载信号
        Q_out     : out std_logic_vector(3 downto 0);  -- 商输出
        R_out     : out std_logic_vector(3 downto 0);  -- 余数输出
        Is_Prime  : out std_logic                       -- 质数标志 (1=是质数)
    );
end entity Prime_Finder_Group55;

architecture rtl of Prime_Finder_Group55 is

    ---------------------------------------------------------------------------
    -- 子模块声明: 长除法器
    ---------------------------------------------------------------------------
    component LongDivision_4bit_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Quotient  : out std_logic_vector(3 downto 0);
            Remainder : out std_logic_vector(3 downto 0);
            Done      : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- 内部信号
    ---------------------------------------------------------------------------
    -- 除法器输出
    signal div_quotient  : std_logic_vector(3 downto 0);
    signal div_remainder : std_logic_vector(3 downto 0);
    
    -- 质数判断相关信号
    signal is_divisible    : std_logic;  -- 能被整除标志
    signal special_case    : std_logic;  -- 特殊情况 (0, 1, 或除数无效)
    signal prime_result    : std_logic;
    
begin

    ---------------------------------------------------------------------------
    -- 实例化长除法器
    ---------------------------------------------------------------------------
    DIVIDER: LongDivision_4bit_Group55 port map(
        Dividend  => Dividend,
        Divisor   => Divisor,
        CLK       => CLK,
        Load      => Load,
        Quotient  => div_quotient,
        Remainder => div_remainder,
        Done      => open  -- 阶段1未使用Done信号
    );

    ---------------------------------------------------------------------------
    -- 输出商和余数 (供用户观察除法结果)
    ---------------------------------------------------------------------------
    Q_out <= div_quotient;
    R_out <= div_remainder;

    ---------------------------------------------------------------------------
    -- 质数判断逻辑 (基于除法器的商和余数)
    ---------------------------------------------------------------------------
    
    -- 检查是否能被整除:
    -- 条件: 余数=0 且 商>1 且 除数>1 且 除数<被除数
    -- 这表示 Dividend = Divisor × Quotient，且不是平凡因子(1或自身)
    DIVISIBILITY_CHECK: process(div_remainder, div_quotient, Divisor, Dividend)
    begin
        if div_remainder = "0000" and      -- 余数为0 (能整除)
           div_quotient > "0001" and       -- 商大于1 (不是除以自身)
           Divisor > "0001" and            -- 除数大于1 (不是除以1)
           Divisor < Dividend then         -- 除数小于被除数 (有效因子)
            is_divisible <= '1';           -- 找到非平凡因子，不是质数
        else
            is_divisible <= '0';
        end if;
    end process DIVISIBILITY_CHECK;
    
    -- 处理特殊情况: 0和1不是质数
    SPECIAL_CASE_CHECK: process(Dividend)
    begin
        if Dividend = "0000" or Dividend = "0001" then
            special_case <= '1';  -- 0和1不是质数
        else
            special_case <= '0';
        end if;
    end process SPECIAL_CASE_CHECK;
    
    -- 最终质数判断:
    -- Is_Prime = 1 当且仅当:
    --   1. 不是特殊情况 (不是0或1)
    --   2. 当前除法没有找到非平凡因子
    -- 注意: 用户需要测试多个除数(2,3,4...)来完整验证
    prime_result <= '1' when (special_case = '0' and is_divisible = '0') else '0';
    
    -- 输出质数判断结果
    Is_Prime <= prime_result;

end architecture rtl;
