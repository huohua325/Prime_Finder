--------------------------------------------------------------------------------
-- 模块名称: LongDivision_CLA_Pipeline_Group55
-- 功能描述: 使用CLA减法器的流水线除法器
-- 优化类型: 阶段2优化2 - 除法器内部优化 (CLA + 流水线)
-- 
-- 原理:
--   CLA (Carry-Lookahead): 进位预测，减少单次减法延迟
--   流水线: 将除法分成多级，提高连续处理吞吐量
--
-- 与RipSub版本对比:
--   RipSub: 借位逐级传递，4位需要4级延迟
--   CLA:    借位并行计算，4位只需2级延迟
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity LongDivision_CLA_Pipeline_Group55 is
    port(
        Dividend  : in  std_logic_vector(3 downto 0);  -- 被除数
        Divisor   : in  std_logic_vector(3 downto 0);  -- 除数
        CLK       : in  std_logic;                      -- 时钟
        Load      : in  std_logic;                      -- 加载
        Quotient  : out std_logic_vector(3 downto 0);  -- 商
        Remainder : out std_logic_vector(3 downto 0);  -- 余数
        Done      : out std_logic                       -- 完成标志
    );
end entity LongDivision_CLA_Pipeline_Group55;

architecture rtl of LongDivision_CLA_Pipeline_Group55 is

    ---------------------------------------------------------------------------
    -- CLA减法器信号 (内嵌实现)
    ---------------------------------------------------------------------------
    signal cla_a, cla_b : std_logic_vector(3 downto 0);
    signal cla_diff     : std_logic_vector(3 downto 0);
    signal cla_borrow   : std_logic;
    
    -- CLA内部信号
    signal Bn : std_logic_vector(3 downto 0);  -- B取反
    signal G  : std_logic_vector(3 downto 0);  -- Generate
    signal P  : std_logic_vector(3 downto 0);  -- Propagate
    signal C  : std_logic_vector(4 downto 0);  -- Carry chain

    ---------------------------------------------------------------------------
    -- 流水线寄存器
    ---------------------------------------------------------------------------
    -- Stage 1: 输入锁存
    signal s1_dividend : std_logic_vector(3 downto 0);
    signal s1_divisor  : std_logic_vector(3 downto 0);
    signal s1_valid    : std_logic := '0';
    
    -- Stage 2+: 迭代计算
    signal reg_dividend : std_logic_vector(3 downto 0);
    signal reg_divisor  : std_logic_vector(3 downto 0);
    signal reg_quotient : std_logic_vector(3 downto 0);
    signal computing    : std_logic := '0';
    signal done_internal: std_logic := '0';
    signal div_by_zero  : std_logic := '0';

begin

    ---------------------------------------------------------------------------
    -- CLA减法器逻辑 (组合逻辑)
    -- 计算: cla_diff = cla_a - cla_b
    -- 原理: A - B = A + NOT(B) + 1
    ---------------------------------------------------------------------------
    
    -- 输入连接
    cla_a <= reg_dividend;
    cla_b <= reg_divisor;
    
    -- Step 1: B取反
    Bn <= not cla_b;
    
    -- Step 2: 计算Generate和Propagate (并行)
    G <= cla_a and Bn;
    P <= cla_a xor Bn;
    
    -- Step 3: 进位预测 (关键优化: 所有进位同时计算!)
    C(0) <= '1';  -- 补码+1
    
    -- C(1) = G(0) + P(0)·C(0)
    C(1) <= G(0) or (P(0) and C(0));
    
    -- C(2) = G(1) + P(1)·G(0) + P(1)·P(0)·C(0)
    C(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and C(0));
    
    -- C(3) = G(2) + P(2)·G(1) + P(2)·P(1)·G(0) + P(2)·P(1)·P(0)·C(0)
    C(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) 
                 or (P(2) and P(1) and P(0) and C(0));
    
    -- C(4) = G(3) + P(3)·G(2) + ... (最终进位)
    C(4) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1))
                 or (P(3) and P(2) and P(1) and G(0))
                 or (P(3) and P(2) and P(1) and P(0) and C(0));
    
    -- Step 4: 计算差值
    cla_diff <= P xor C(3 downto 0);
    
    -- Step 5: 借位 (无进位 = 有借位)
    cla_borrow <= not C(4);

    ---------------------------------------------------------------------------
    -- 流水线控制进程
    ---------------------------------------------------------------------------
    PIPELINE_PROC: process(CLK)
    begin
        if rising_edge(CLK) then
            
            ---------------------------------------------------------------
            -- Stage 1: 输入锁存 (流水线入口)
            ---------------------------------------------------------------
            if Load = '1' then
                s1_dividend <= Dividend;
                s1_divisor <= Divisor;
                s1_valid <= '1';
                
                -- 检查除以零
                if Divisor = "0000" then
                    div_by_zero <= '1';
                else
                    div_by_zero <= '0';
                end if;
            end if;
            
            ---------------------------------------------------------------
            -- Stage 1 -> Stage 2: 传递到计算阶段
            ---------------------------------------------------------------
            if s1_valid = '1' and computing = '0' then
                reg_dividend <= s1_dividend;
                reg_divisor <= s1_divisor;
                reg_quotient <= "0000";
                computing <= '1';
                done_internal <= '0';
                s1_valid <= '0';
            end if;
            
            ---------------------------------------------------------------
            -- Stage 2+: 迭代减法 (使用CLA)
            ---------------------------------------------------------------
            if computing = '1' and div_by_zero = '0' then
                if cla_borrow = '0' then
                    -- 够减: 更新余数，商+1
                    reg_dividend <= cla_diff;
                    reg_quotient <= reg_quotient + 1;
                else
                    -- 不够减: 完成
                    done_internal <= '1';
                    computing <= '0';
                end if;
            end if;
            
            -- 除以零直接完成
            if computing = '1' and div_by_zero = '1' then
                done_internal <= '1';
                computing <= '0';
            end if;
            
            ---------------------------------------------------------------
            -- 清除done (当新的Load来临)
            ---------------------------------------------------------------
            if Load = '1' then
                done_internal <= '0';
            end if;
            
        end if;
    end process PIPELINE_PROC;

    ---------------------------------------------------------------------------
    -- 输出赋值
    ---------------------------------------------------------------------------
    Quotient <= reg_quotient when div_by_zero = '0' else "1111";
    Remainder <= reg_dividend when div_by_zero = '0' else s1_dividend;
    Done <= done_internal;

end architecture rtl;
