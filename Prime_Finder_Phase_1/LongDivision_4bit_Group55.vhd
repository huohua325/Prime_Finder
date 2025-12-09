--------------------------------------------------------------------------------
-- 模块名称: LongDivision_4bit_Group55
-- 功能描述: 4位长除法器，计算 Dividend / Divisor = Quotient ... Remainder
-- 设计要求: 
--   1. 必须有CLK和Load信号
--   2. 使用process + if语句实现
--   3. std_logic_unsigned仅用于计数器增减
-- 层级关系: LongDivision_4bit是Multiplier_4bit和RipSub_4bit的父级
--
-- 长除法算法原理 (二进制版本):
--   1. 将被除数左对齐到一个足够宽的寄存器中
--   2. 从最高位开始，每次尝试减去除数
--   3. 如果够减(无借位)，商的对应位为1，保留差值
--   4. 如果不够减(有借位)，商的对应位为0，保留原值
--   5. 重复直到处理完所有位
--
-- 简化实现: 使用重复减法
--   Quotient = 0
--   while (Remainder >= Divisor):
--       Remainder = Remainder - Divisor
--       Quotient = Quotient + 1
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  -- 仅用于计数器比较和增减

entity LongDivision_4bit_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- 被除数 (0-15)
        Divisor   : in  std_logic_vector(3 downto 0);  -- 除数 (0-15)
        CLK       : in  std_logic;                      -- 时钟信号
        Load      : in  std_logic;                      -- 加载信号 (高电平加载新数据)
        Quotient  : out std_logic_vector(3 downto 0);  -- 商
        Remainder : out std_logic_vector(3 downto 0)   -- 余数
    );
end entity LongDivision_4bit_Group55;

architecture rtl of LongDivision_4bit_Group55 is

    -- 声明子模块: 4位减法器
    component RipSub_4bit_Group55 is
        port(
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            Diff : out std_logic_vector(3 downto 0);
            Bout : out std_logic
        );
    end component;

    -- 内部寄存器
    signal reg_dividend : std_logic_vector(3 downto 0);  -- 被除数寄存器(也用作余数)
    signal reg_divisor  : std_logic_vector(3 downto 0);  -- 除数寄存器
    signal reg_quotient : std_logic_vector(3 downto 0);  -- 商寄存器
    
    -- 减法器输出
    signal sub_result   : std_logic_vector(3 downto 0);  -- 减法结果
    signal sub_borrow   : std_logic;                      -- 借位标志
    
    -- 状态信号
    signal done         : std_logic;                      -- 除法完成标志
    signal div_by_zero  : std_logic;                      -- 除以零标志

begin

    ---------------------------------------------------------------------------
    -- 实例化减法器: 用于计算 reg_dividend - reg_divisor
    ---------------------------------------------------------------------------
    SUBTRACTOR: RipSub_4bit_Group55 port map(
        A    => reg_dividend,
        B    => reg_divisor,
        Diff => sub_result,
        Bout => sub_borrow
    );

    ---------------------------------------------------------------------------
    -- 主控制进程: 实现重复减法除法算法
    ---------------------------------------------------------------------------
    DIV_PROCESS: process(CLK)
    begin
        if rising_edge(CLK) then
            if Load = '1' then
                ---------------------------------------------------------------
                -- 加载阶段: 初始化所有寄存器
                ---------------------------------------------------------------
                reg_dividend <= Dividend;      -- 加载被除数
                reg_divisor  <= Divisor;       -- 加载除数
                reg_quotient <= "0000";        -- 商初始化为0
                done         <= '0';           -- 重置完成标志
                
                -- 检查除以零的情况
                if Divisor = "0000" then
                    div_by_zero <= '1';
                else
                    div_by_zero <= '0';
                end if;
                
            else
                ---------------------------------------------------------------
                -- 计算阶段: 重复减法
                ---------------------------------------------------------------
                if done = '0' and div_by_zero = '0' then
                    -- 检查是否还能继续减 (reg_dividend >= reg_divisor)
                    if sub_borrow = '0' then
                        -- 够减: 更新余数，商加1
                        reg_dividend <= sub_result;
                        reg_quotient <= reg_quotient + 1;  -- 计数器增加 (允许使用+)
                    else
                        -- 不够减: 除法完成
                        done <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process DIV_PROCESS;

    ---------------------------------------------------------------------------
    -- 输出赋值
    ---------------------------------------------------------------------------
    -- 商输出
    Quotient <= reg_quotient when div_by_zero = '0' else "1111";  -- 除以零返回最大值
    
    -- 余数输出
    Remainder <= reg_dividend when div_by_zero = '0' else Dividend;  -- 除以零返回被除数

end architecture rtl;
