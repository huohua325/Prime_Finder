--------------------------------------------------------------------------------
-- Testbench: And_2bit_Group55
-- 测试2位与门的所有输入组合
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity And_2bit_tb is
end entity And_2bit_tb;

architecture test of And_2bit_tb is

    -- 被测模块
    component And_2bit_Group55 is
        port(
            A : in  std_logic;
            B : in  std_logic;
            Y : out std_logic
        );
    end component;

    -- 测试信号
    signal A_tb, B_tb : std_logic := '0';
    signal Y_tb       : std_logic;

begin

    -- 实例化被测模块
    UUT: And_2bit_Group55 port map(
        A => A_tb,
        B => B_tb,
        Y => Y_tb
    );

    -- 测试过程
    STIM: process
    begin
        -- 测试所有4种输入组合
        A_tb <= '0'; B_tb <= '0'; wait for 10 ns;  -- 期望 Y=0
        A_tb <= '0'; B_tb <= '1'; wait for 10 ns;  -- 期望 Y=0
        A_tb <= '1'; B_tb <= '0'; wait for 10 ns;  -- 期望 Y=0
        A_tb <= '1'; B_tb <= '1'; wait for 10 ns;  -- 期望 Y=1
        
        -- 测试完成
        wait;
    end process STIM;

end architecture test;
