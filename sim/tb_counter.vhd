library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

use std.env.finish;

entity tb_counter is
end entity;

architecture sim of tb_counter is
    constant c_clock_period: time := 10 ns;

    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal val: std_logic_vector(3 downto 0);
begin
    i_counter: entity work.counter(rtl)
        port map (
            clk => clk,
            rst => rst,
            val => val
        );

    clk <= not clk after c_clock_period/2;
    rst <= '1', '0' after 10 ns;

    p_monitor: process(clk)
    begin
        if rising_edge(clk) then
            if val = x"F" then
                finish;
            end if;
        end if;
    end process p_monitor;
end sim;