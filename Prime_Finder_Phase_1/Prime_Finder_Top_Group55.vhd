--------------------------------------------------------------------------------
-- 模块名称: Prime_Finder_Top_Group55
-- 功能描述: DE10-Lite开发板顶层封装
-- 包含功能:
--   1. Prime_Finder核心模块
--   2. 七段显示器驱动 (十进制显示)
--   3. 引脚映射
--
-- DE10-Lite资源映射:
--   SW7-SW4  -> Dividend (被除数)
--   SW3-SW0  -> Divisor (除数)
--   SW9      -> Load (加载信号)
--   KEY0     -> 可选复位
--   HEX0-HEX1 -> Q_out (商，十进制显示)
--   HEX4-HEX5 -> R_out (余数，十进制显示)
--   LED9     -> Is_Prime (质数指示灯)
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Prime_Finder_Top_Group55 is
    port(
        -- 时钟
        MAX10_CLK1_50 : in  std_logic;                      -- 50MHz时钟
        
        -- 开关输入
        SW            : in  std_logic_vector(9 downto 0);   -- 10个开关
        
        -- 七段显示器 (active low, active low表示低电平点亮)
        HEX0          : out std_logic_vector(6 downto 0);   -- 商个位
        HEX1          : out std_logic_vector(6 downto 0);   -- 商十位
        HEX2          : out std_logic_vector(6 downto 0);   -- 未使用
        HEX3          : out std_logic_vector(6 downto 0);   -- 未使用
        HEX4          : out std_logic_vector(6 downto 0);   -- 余数个位
        HEX5          : out std_logic_vector(6 downto 0);   -- 余数十位
        
        -- LED输出
        LEDR          : out std_logic_vector(9 downto 0)    -- 10个LED
    );
end entity Prime_Finder_Top_Group55;

architecture rtl of Prime_Finder_Top_Group55 is

    ---------------------------------------------------------------------------
    -- 子模块声明: Prime_Finder核心
    ---------------------------------------------------------------------------
    component Prime_Finder_Group55 is
        port(
            Dividend  : in  std_logic_vector(3 downto 0);
            Divisor   : in  std_logic_vector(3 downto 0);
            CLK       : in  std_logic;
            Load      : in  std_logic;
            Q_out     : out std_logic_vector(3 downto 0);
            R_out     : out std_logic_vector(3 downto 0);
            Is_Prime  : out std_logic
        );
    end component;

    ---------------------------------------------------------------------------
    -- 内部信号
    ---------------------------------------------------------------------------
    signal quotient_4bit  : std_logic_vector(3 downto 0);
    signal remainder_4bit : std_logic_vector(3 downto 0);
    signal is_prime_sig   : std_logic;
    
    -- 十进制转换信号
    signal q_tens, q_ones : std_logic_vector(3 downto 0);  -- 商的十位和个位
    signal r_tens, r_ones : std_logic_vector(3 downto 0);  -- 余数的十位和个位

    ---------------------------------------------------------------------------
    -- 七段显示器编码函数 (active low: 0点亮, 1熄灭)
    -- 段排列:  0
    --        5   1
    --          6
    --        4   2
    --          3
    ---------------------------------------------------------------------------
    function seg7_encode(digit : std_logic_vector(3 downto 0)) 
        return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case digit is
            when "0000" => seg := "1000000";  -- 0
            when "0001" => seg := "1111001";  -- 1
            when "0010" => seg := "0100100";  -- 2
            when "0011" => seg := "0110000";  -- 3
            when "0100" => seg := "0011001";  -- 4
            when "0101" => seg := "0010010";  -- 5
            when "0110" => seg := "0000010";  -- 6
            when "0111" => seg := "1111000";  -- 7
            when "1000" => seg := "0000000";  -- 8
            when "1001" => seg := "0010000";  -- 9
            when others => seg := "1111111";  -- 熄灭 (用于无效输入)
        end case;
        return seg;
    end function;

begin

    ---------------------------------------------------------------------------
    -- 实例化Prime_Finder核心模块
    ---------------------------------------------------------------------------
    CORE: Prime_Finder_Group55 port map(
        Dividend  => SW(7 downto 4),   -- SW7-SW4 作为被除数
        Divisor   => SW(3 downto 0),   -- SW3-SW0 作为除数
        CLK       => MAX10_CLK1_50,    -- 50MHz时钟
        Load      => SW(9),            -- SW9 作为加载信号
        Q_out     => quotient_4bit,
        R_out     => remainder_4bit,
        Is_Prime  => is_prime_sig
    );

    ---------------------------------------------------------------------------
    -- 二进制转十进制 (4位二进制 -> 十位 + 个位)
    -- 范围: 0-15, 十位只能是0或1
    ---------------------------------------------------------------------------
    
    -- 商的十进制转换
    process(quotient_4bit)
    begin
        if quotient_4bit >= "1010" then      -- >= 10
            q_tens <= "0001";                 -- 十位 = 1
            q_ones <= quotient_4bit - "1010"; -- 个位 = 值 - 10
        else
            q_tens <= "0000";                 -- 十位 = 0
            q_ones <= quotient_4bit;          -- 个位 = 值
        end if;
    end process;
    
    -- 余数的十进制转换
    process(remainder_4bit)
    begin
        if remainder_4bit >= "1010" then      -- >= 10
            r_tens <= "0001";                  -- 十位 = 1
            r_ones <= remainder_4bit - "1010"; -- 个位 = 值 - 10
        else
            r_tens <= "0000";                  -- 十位 = 0
            r_ones <= remainder_4bit;          -- 个位 = 值
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- 七段显示器输出
    ---------------------------------------------------------------------------
    HEX0 <= seg7_encode(q_ones);  -- 商个位
    HEX1 <= seg7_encode(q_tens);  -- 商十位
    HEX2 <= "1111111";            -- 熄灭 (未使用)
    HEX3 <= "1111111";            -- 熄灭 (未使用)
    HEX4 <= seg7_encode(r_ones);  -- 余数个位
    HEX5 <= seg7_encode(r_tens);  -- 余数十位

    ---------------------------------------------------------------------------
    -- LED输出
    ---------------------------------------------------------------------------
    LEDR(9) <= is_prime_sig;      -- LED9 显示是否为质数
    LEDR(8 downto 4) <= "00000";  -- LED8-LED4 熄灭
    LEDR(3 downto 0) <= quotient_4bit;  -- LED3-LED0 显示商的二进制值 (可选)

end architecture rtl;
