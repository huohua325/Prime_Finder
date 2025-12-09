--------------------------------------------------------------------------------
-- 模块名称: RipSub_8bit_Group55
-- 功能描述: 8位纹波减法器，级联两个4位减法器
-- 优化类型: 阶段2优化4的支撑模块
-- 
-- 原理:
--   复用阶段1的RipSub_4bit_Group55
--   低4位减法的借位传递给高4位
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity RipSub_8bit_Group55 is
    port(
        A    : in  std_logic_vector(7 downto 0);  -- 被减数
        B    : in  std_logic_vector(7 downto 0);  -- 减数
        Diff : out std_logic_vector(7 downto 0);  -- 差
        Bout : out std_logic                       -- 借位输出
    );
end entity RipSub_8bit_Group55;

architecture structural of RipSub_8bit_Group55 is

    ---------------------------------------------------------------------------
    -- 子模块声明: 复用4位减法器
    ---------------------------------------------------------------------------
    component RipSub_4bit_Group55 is
        port(
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            Diff : out std_logic_vector(3 downto 0);
            Bout : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- 内部信号
    ---------------------------------------------------------------------------
    signal borrow_low  : std_logic;  -- 低4位的借位
    signal diff_low    : std_logic_vector(3 downto 0);
    signal diff_high   : std_logic_vector(3 downto 0);
    
    -- 高位减法需要考虑低位借位
    signal B_high_adj  : std_logic_vector(3 downto 0);
    signal borrow_adj  : std_logic;
    signal diff_adj    : std_logic_vector(3 downto 0);

begin

    ---------------------------------------------------------------------------
    -- 低4位减法器
    ---------------------------------------------------------------------------
    SUB_LOW: RipSub_4bit_Group55 port map(
        A    => A(3 downto 0),
        B    => B(3 downto 0),
        Diff => diff_low,
        Bout => borrow_low
    );

    ---------------------------------------------------------------------------
    -- 高4位减法器 (需要减去低位借位)
    -- 实现: A_high - B_high - borrow_low
    -- 方法: 先 A_high - B_high，再根据borrow_low调整
    ---------------------------------------------------------------------------
    SUB_HIGH: RipSub_4bit_Group55 port map(
        A    => A(7 downto 4),
        B    => B(7 downto 4),
        Diff => diff_high,
        Bout => borrow_adj
    );
    
    -- 如果低位有借位，高位结果需要减1
    -- 使用另一个减法器处理借位
    SUB_BORROW: RipSub_4bit_Group55 port map(
        A    => diff_high,
        B    => "000" & borrow_low,  -- 减去0或1
        Diff => diff_adj,
        Bout => open  -- 暂时忽略
    );

    ---------------------------------------------------------------------------
    -- 输出
    ---------------------------------------------------------------------------
    Diff(3 downto 0) <= diff_low;
    Diff(7 downto 4) <= diff_adj;
    
    -- 最终借位: 高位有借位，或者 (高位结果为0且低位有借位)
    -- 使用nor判断diff_high是否全为0，避免直接向量比较
    Bout <= borrow_adj or (borrow_low and not (diff_high(3) or diff_high(2) or diff_high(1) or diff_high(0)));

end architecture structural;
