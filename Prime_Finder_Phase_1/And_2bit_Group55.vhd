--------------------------------------------------------------------------------
-- 模块名称: And_2bit_Group55
-- 功能描述: 2位与门，将两个单比特进行AND运算
-- 设计要求: 必须使用AND逻辑门构建
-- 层级关系: 子模块，被Multiplier_4bit调用
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity And_2bit_Group55 is
    port(
        A : in  std_logic;  -- 输入A
        B : in  std_logic;  -- 输入B
        Y : out std_logic   -- 输出Y = A AND B
    );
end entity And_2bit_Group55;

architecture rtl of And_2bit_Group55 is
begin
    -- 使用AND逻辑门实现
    Y <= A and B;
end architecture rtl;
