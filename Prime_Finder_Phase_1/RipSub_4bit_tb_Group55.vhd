--------------------------------------------------------------------------------
-- Testbench: RipSub_4bit_Group55
-- 测试4位减法器的关键用例
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity RipSub_4bit_tb is
end entity RipSub_4bit_tb;

architecture test of RipSub_4bit_tb is

    -- 被测模块
    component RipSub_4bit_Group55 is
        port(
            A    : in  std_logic_vector(3 downto 0);
            B    : in  std_logic_vector(3 downto 0);
            Diff : out std_logic_vector(3 downto 0);
            Bout : out std_logic
        );
    end component;

    -- 测试信号
    signal A_tb, B_tb   : std_logic_vector(3 downto 0) := "0000";
    signal Diff_tb      : std_logic_vector(3 downto 0);
    signal Bout_tb      : std_logic;

begin

    -- 实例化被测模块
    UUT: RipSub_4bit_Group55 port map(
        A    => A_tb,
        B    => B_tb,
        Diff => Diff_tb,
        Bout => Bout_tb
    );

    -- 测试过程 (精简版 - 4个典型例子，适合视频展示)
    -- 总时间约 100ns
    STIM: process
    begin
        -- 测试1: 10 - 7 = 3, Bout=0 (正常减法)
        A_tb <= "1010"; B_tb <= "0111"; wait for 20 ns;
        
        -- 测试2: 3 - 5 = 14, Bout=1 (有借位/下溢)
        A_tb <= "0011"; B_tb <= "0101"; wait for 20 ns;
        
        -- 测试3: 15 - 15 = 0, Bout=0 (相等)
        A_tb <= "1111"; B_tb <= "1111"; wait for 20 ns;
        
        -- 测试4: 0 - 1 = 15, Bout=1 (边界下溢)
        A_tb <= "0000"; B_tb <= "0001"; wait for 20 ns;
        
        -- 测试完成
        wait;
    end process STIM;

end architecture test;
