--------------------------------------------------------------------------------
-- 模块名称: Full_adder_Group55
-- 功能描述: 全加器，将两个单比特和进位输入相加
-- 设计要求: 必须使用AND、OR、XOR逻辑门构建
-- 层级关系: 子模块，被Multiplier_4bit和RipSub_4bit调用
-- 真值表:
--   A B Cin | Sum Cout
--   0 0  0  |  0   0
--   0 0  1  |  1   0
--   0 1  0  |  1   0
--   0 1  1  |  0   1
--   1 0  0  |  1   0
--   1 0  1  |  0   1
--   1 1  0  |  0   1
--   1 1  1  |  1   1
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adder_Group55 is
    port(
        A    : in  std_logic;  -- 加数A
        B    : in  std_logic;  -- 加数B
        Cin  : in  std_logic;  -- 进位输入
        Sum  : out std_logic;  -- 和输出
        Cout : out std_logic   -- 进位输出
    );
end entity Full_adder_Group55;

architecture rtl of Full_adder_Group55 is
begin
    -- Sum = A XOR B XOR Cin
    -- 当输入中有奇数个1时，Sum为1
    Sum <= A xor B xor Cin;
    
    -- Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)
    -- 当至少有两个输入为1时，产生进位
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture rtl;
