library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

entity counter is
    port (
        clk: in std_logic;
        rst: in std_logic;
        val: out std_logic_vector(4 downto 0)
    );
end entity;

architecture rtl of counter is
    subtype t_val_i is natural range 0 to 2**val'length-1;
    signal val_i: t_val_i := 0;
begin

    p: process(clk, rst)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                val_i <= t_val_i'low;
            else
                if val_i = t_val_i'high then
                    val_i <= t_val_i'low;
                else
                    val_i <= val_i + 1;
                end if;
            end if;
        end if;  
    end process p;

    val <= std_logic_vector(to_unsigned(val_i, val'length));

end rtl;