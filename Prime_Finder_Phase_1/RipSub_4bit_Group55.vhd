--------------------------------------------------------------------------------
-- 模块名称: RipSub_4bit_Group55
-- 功能描述: 4位纹波减法器，计算 A - B (数据流实现，参考课件)
-- 设计要求: 必须使用AND、OR、XOR、NOT逻辑门构建
-- 层级关系: 独立模块，被LongDivision_4bit调用
--
-- 实现原理: 补码减法
--   A - B = A + (~B) + 1
--   其中 Bn = NOT(B) 是 B 的按位取反
--   C(0) = '1' 实现 +1
--
-- 进位公式 (全加器进位展开):
--   C(i+1) = (A(i) AND Bn(i)) OR (A(i) AND C(i)) OR (Bn(i) AND C(i))
--
-- 差值公式:
--   Diff = A XOR Bn XOR C
--
-- 借位输出:
--   Bout = NOT(COUT)，无进位表示有借位
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity RipSub_4bit_Group55 is
    port(
        A    : in  std_logic_vector(3 downto 0);  -- 被减数 (X in slides)
        B    : in  std_logic_vector(3 downto 0);  -- 减数 (Y in slides)
        Diff : out std_logic_vector(3 downto 0);  -- 差 (S in slides)
        Bout : out std_logic                       -- 借位输出 (1表示A<B)
    );
end entity RipSub_4bit_Group55;

architecture dataflow of RipSub_4bit_Group55 is
    -- Bn: B的按位取反 (相当于课件中的Yn)
    signal Bn : std_logic_vector(3 downto 0);
    
    -- C: 进位链 (C(0)到C(3)是中间进位，COUT是最终进位)
    signal C : std_logic_vector(3 downto 0);
    signal COUT : std_logic;
begin
    ---------------------------------------------------------------------------
    -- 第一步: 对B取反 (NOT门)
    ---------------------------------------------------------------------------
    Bn <= not B;
    
    ---------------------------------------------------------------------------
    -- 第二步: 计算进位链
    -- C(0) = '1' 实现补码的+1
    -- C(i+1) = (A(i) AND Bn(i)) OR (A(i) AND C(i)) OR (Bn(i) AND C(i))
    ---------------------------------------------------------------------------
    C(0) <= '1';  -- extra '1' for 2's complement
    C(1) <= (A(0) and Bn(0)) or (A(0) and C(0)) or (Bn(0) and C(0));
    C(2) <= (A(1) and Bn(1)) or (A(1) and C(1)) or (Bn(1) and C(1));
    C(3) <= (A(2) and Bn(2)) or (A(2) and C(2)) or (Bn(2) and C(2));
    COUT <= (A(3) and Bn(3)) or (A(3) and C(3)) or (Bn(3) and C(3));
    
    ---------------------------------------------------------------------------
    -- 第三步: 计算差值
    -- Diff = A XOR Bn XOR C
    ---------------------------------------------------------------------------
    Diff <= A xor Bn xor C;
    
    ---------------------------------------------------------------------------
    -- 第四步: 借位输出
    -- 在补码减法中: 有进位(COUT=1)表示A>=B，无进位(COUT=0)表示A<B
    ---------------------------------------------------------------------------
    Bout <= not COUT;

end architecture dataflow;
