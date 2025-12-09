--------------------------------------------------------------------------------
-- 模块名称: Prime_Finder_6k1_Group55
-- 功能描述: 使用6k±1算法的自动质数检测器
-- 优化类型: 阶段2优化3 - 数学优化
-- 
-- 原理:
--   所有大于3的质数都可以写成 6k±1 的形式
--   因此只需测试: 2, 3, 然后是 5, 7, 11, 13... (6k±1序列)
--   相比测试所有数，大幅减少除法次数
--
-- 算法:
--   1. N < 2 -> 不是质数
--   2. N = 2 或 3 -> 是质数
--   3. N % 2 = 0 -> 不是质数
--   4. N % 3 = 0 -> 不是质数
--   5. 测试 6k±1 形式的除数 (5, 7, 11, 13...)，直到除数 >= N
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_6k1_Group55 is
    port(
        N            : in  std_logic_vector(3 downto 0);  -- 待检测的数 (0-15)
        CLK          : in  std_logic;                      -- 时钟信号
        Load         : in  std_logic;                      -- 加载信号
        Is_Prime     : out std_logic;                      -- 质数标志
        Done         : out std_logic;                      -- 检测完成标志
        Div_Count    : out std_logic_vector(3 downto 0)   -- 除法次数计数器
    );
end entity Prime_Finder_6k1_Group55;

architecture rtl of Prime_Finder_6k1_Group55 is

    ---------------------------------------------------------------------------
    -- 状态机定义
    ---------------------------------------------------------------------------
    type state_type is (
        IDLE,           -- 空闲，等待Load
        CHECK_SPECIAL,  -- 检查特殊情况 (0, 1, 2, 3)
        START_DIV_2,    -- 开始测试÷2
        WAIT_DIV_2,     -- 等待÷2完成
        START_DIV_3,    -- 开始测试÷3
        WAIT_DIV_3,     -- 等待÷3完成
        GEN_6K,         -- 生成下一个6k±1除数
        START_DIV_6K,   -- 开始测试÷(6k±1)
        WAIT_DIV_6K,    -- 等待÷(6k±1)完成
        DONE_PRIME,     -- 结果: 是质数
        DONE_NOT_PRIME  -- 结果: 不是质数
    );
    signal state : state_type := IDLE;

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
    -- 锁存的输入值
    signal N_reg : std_logic_vector(3 downto 0);
    
    -- 当前除数
    signal current_divisor : std_logic_vector(3 downto 0);
    
    -- 除法器控制信号
    signal div_load : std_logic := '0';
    signal div_done : std_logic;
    signal div_remainder : std_logic_vector(3 downto 0);
    
    -- 6k±1生成器
    signal test_minus : std_logic;  -- '1'=测6k-1, '0'=测6k+1
    
    -- 除法次数计数器
    signal div_count_reg : std_logic_vector(3 downto 0) := "0000";
    
    -- 输出寄存器
    signal is_prime_reg : std_logic := '0';
    signal done_reg : std_logic := '0';

begin

    ---------------------------------------------------------------------------
    -- 实例化除法器 (复用)
    ---------------------------------------------------------------------------
    DIVIDER: LongDivision_4bit_Group55 port map(
        Dividend  => N_reg,
        Divisor   => current_divisor,
        CLK       => CLK,
        Load      => div_load,
        Quotient  => open,
        Remainder => div_remainder,
        Done      => div_done
    );

    ---------------------------------------------------------------------------
    -- 主状态机
    ---------------------------------------------------------------------------
    FSM_PROC: process(CLK)
    begin
        if rising_edge(CLK) then
            -- 默认值
            div_load <= '0';
            
            case state is
                ---------------------------------------------------------------
                -- 空闲状态
                ---------------------------------------------------------------
                when IDLE =>
                    done_reg <= '0';
                    if Load = '1' then
                        N_reg <= N;
                        div_count_reg <= "0000";
                        state <= CHECK_SPECIAL;
                    end if;
                
                ---------------------------------------------------------------
                -- 检查特殊情况
                ---------------------------------------------------------------
                when CHECK_SPECIAL =>
                    if N_reg < "0010" then
                        -- N = 0 或 1，不是质数
                        state <= DONE_NOT_PRIME;
                    elsif N_reg = "0010" or N_reg = "0011" then
                        -- N = 2 或 3，是质数
                        state <= DONE_PRIME;
                    else
                        -- 开始测试÷2
                        current_divisor <= "0010";
                        div_load <= '1';
                        state <= WAIT_DIV_2;
                    end if;
                
                ---------------------------------------------------------------
                -- 等待÷2完成
                ---------------------------------------------------------------
                when WAIT_DIV_2 =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then
                            -- 能被2整除，不是质数
                            state <= DONE_NOT_PRIME;
                        else
                            -- 继续测试÷3
                            current_divisor <= "0011";
                            div_load <= '1';
                            state <= WAIT_DIV_3;
                        end if;
                    end if;
                
                ---------------------------------------------------------------
                -- 等待÷3完成
                ---------------------------------------------------------------
                when WAIT_DIV_3 =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then
                            -- 能被3整除，不是质数
                            state <= DONE_NOT_PRIME;
                        else
                            -- 开始6k±1序列，从5开始 (6×1-1=5)
                            current_divisor <= "0101";
                            test_minus <= '0';  -- 下一个是6k+1
                            state <= GEN_6K;
                        end if;
                    end if;
                
                ---------------------------------------------------------------
                -- 生成下一个6k±1除数
                ---------------------------------------------------------------
                when GEN_6K =>
                    if current_divisor >= N_reg then
                        -- 除数已经大于等于N，测试完毕，是质数
                        state <= DONE_PRIME;
                    else
                        -- 开始除法
                        div_load <= '1';
                        state <= WAIT_DIV_6K;
                    end if;
                
                ---------------------------------------------------------------
                -- 等待÷(6k±1)完成
                ---------------------------------------------------------------
                when WAIT_DIV_6K =>
                    if div_done = '1' then
                        div_count_reg <= div_count_reg + 1;
                        if div_remainder = "0000" then
                            -- 能被整除，不是质数
                            state <= DONE_NOT_PRIME;
                        else
                            -- 生成下一个6k±1
                            if test_minus = '0' then
                                -- 当前是6k-1，下一个是6k+1 (加2)
                                current_divisor <= current_divisor + 2;
                                test_minus <= '1';
                            else
                                -- 当前是6k+1，下一个是6(k+1)-1 (加4)
                                current_divisor <= current_divisor + 4;
                                test_minus <= '0';
                            end if;
                            state <= GEN_6K;
                        end if;
                    end if;
                
                ---------------------------------------------------------------
                -- 结果: 是质数
                ---------------------------------------------------------------
                when DONE_PRIME =>
                    is_prime_reg <= '1';
                    done_reg <= '1';
                    if Load = '0' then
                        state <= IDLE;
                    end if;
                
                ---------------------------------------------------------------
                -- 结果: 不是质数
                ---------------------------------------------------------------
                when DONE_NOT_PRIME =>
                    is_prime_reg <= '0';
                    done_reg <= '1';
                    if Load = '0' then
                        state <= IDLE;
                    end if;
                
                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process FSM_PROC;

    ---------------------------------------------------------------------------
    -- 输出赋值
    ---------------------------------------------------------------------------
    Is_Prime <= is_prime_reg;
    Done <= done_reg;
    Div_Count <= div_count_reg;

end architecture rtl;
