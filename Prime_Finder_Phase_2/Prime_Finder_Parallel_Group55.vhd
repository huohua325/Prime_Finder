--------------------------------------------------------------------------------
-- 模块名称: Prime_Finder_Parallel_Group55
-- 功能描述: 并行质数检测器，同时使用3个除法器测试÷2, ÷3, ÷5
-- 优化类型: 阶段2优化1 - 并行除法器
-- 
-- 原理:
--   阶段1只有1个除法器，需要串行测试每个除数
--   本模块实例化3个独立的除法器，同时测试3个除数
--   利用FPGA硬件并行特性，速度提升约3倍
--
-- 适用范围:
--   对于4位数(0-15)，只需测试2, 3, 5三个除数即可判断质数
--   因为 sqrt(15) ≈ 3.87，所以只需测试不超过4的质数
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_Parallel_Group55 is
    port(
        N         : in  std_logic_vector(3 downto 0);  -- 待检测的数 (0-15)
        CLK       : in  std_logic;                      -- 时钟信号
        Load      : in  std_logic;                      -- 加载信号
        Is_Prime  : out std_logic;                      -- 质数标志
        Done      : out std_logic                       -- 检测完成标志
    );
end entity Prime_Finder_Parallel_Group55;

architecture rtl of Prime_Finder_Parallel_Group55 is

    ---------------------------------------------------------------------------
    -- 子模块声明: 复用阶段1的除法器
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
    -- 3个除法器的余数输出
    signal R2, R3, R5 : std_logic_vector(3 downto 0);
    
    -- 3个除法器的完成标志
    signal Done2, Done3, Done5 : std_logic;
    
    -- 所有除法器完成标志
    signal all_done : std_logic;
    
    -- 质数判断结果
    signal is_prime_internal : std_logic;
    
    -- 锁存输入值用于判断
    signal N_reg : std_logic_vector(3 downto 0);

begin

    ---------------------------------------------------------------------------
    -- 并行实例化3个除法器
    ---------------------------------------------------------------------------
    
    -- 除法器1: N ÷ 2
    DIV_BY_2: LongDivision_4bit_Group55 port map(
        Dividend  => N,
        Divisor   => "0010",  -- 除数 = 2
        CLK       => CLK,
        Load      => Load,
        Quotient  => open,    -- 商不需要
        Remainder => R2,      -- 只关心余数
        Done      => Done2
    );
    
    -- 除法器2: N ÷ 3
    DIV_BY_3: LongDivision_4bit_Group55 port map(
        Dividend  => N,
        Divisor   => "0011",  -- 除数 = 3
        CLK       => CLK,
        Load      => Load,
        Quotient  => open,
        Remainder => R3,
        Done      => Done3
    );
    
    -- 除法器3: N ÷ 5
    DIV_BY_5: LongDivision_4bit_Group55 port map(
        Dividend  => N,
        Divisor   => "0101",  -- 除数 = 5
        CLK       => CLK,
        Load      => Load,
        Quotient  => open,
        Remainder => R5,
        Done      => Done5
    );

    ---------------------------------------------------------------------------
    -- 锁存输入值
    ---------------------------------------------------------------------------
    process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                N_reg <= N;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- 完成标志: 所有除法器都完成
    ---------------------------------------------------------------------------
    all_done <= Done2 and Done3 and Done5;
    Done <= all_done;

    ---------------------------------------------------------------------------
    -- 质数判断逻辑
    ---------------------------------------------------------------------------
    -- 规则:
    --   N < 2       -> 不是质数 (0, 1)
    --   N = 2       -> 是质数 (特殊处理，因为2÷2=0余0)
    --   N = 3       -> 是质数 (特殊处理，因为3÷3=0余0)
    --   N = 5       -> 是质数 (特殊处理，因为5÷5=0余0)
    --   R2=0且N>2   -> 能被2整除，不是质数
    --   R3=0且N>3   -> 能被3整除，不是质数
    --   R5=0且N>5   -> 能被5整除，不是质数
    --   其他        -> 是质数
    
    process(N_reg, R2, R3, R5, all_done)
    begin
        if all_done = '0' then
            is_prime_internal <= '0';  -- 计算中，暂时输出0
        elsif N_reg < "0010" then
            -- N = 0 或 1，不是质数
            is_prime_internal <= '0';
        elsif N_reg = "0010" or N_reg = "0011" or N_reg = "0101" then
            -- N = 2, 3, 5 是质数
            is_prime_internal <= '1';
        elsif R2 = "0000" then
            -- 能被2整除，不是质数 (4, 6, 8, 10, 12, 14)
            is_prime_internal <= '0';
        elsif R3 = "0000" then
            -- 能被3整除，不是质数 (6, 9, 12, 15)
            is_prime_internal <= '0';
        elsif R5 = "0000" then
            -- 能被5整除，不是质数 (10, 15)
            is_prime_internal <= '0';
        else
            -- 不能被2, 3, 5整除，是质数 (7, 11, 13)
            is_prime_internal <= '1';
        end if;
    end process;
    
    Is_Prime <= is_prime_internal;

end architecture rtl;
