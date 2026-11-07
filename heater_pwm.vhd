library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity heater_pwm is
    generic (
        counter_width : positive := 16
    );
    port (
        clk, reset : in std_logic;
        period : in unsigned(counter_width - 1 downto 0);
        duty_request : in unsigned(counter_width - 1 downto 0);
        pwm : out std_logic
    );
end entity heater_pwm;

architecture rtl of heater_pwm is
    signal counter : unsigned(counter_width - 1 downto 0);
    signal counting_up : std_logic;
begin
    pwm <= '1' when reset = '0' and counter > duty_request else '0';

    process (clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
            counting_up <= '1';
        elsif rising_edge(clk) then
            -- Hold each endpoint for one extra clock before changing direction.
            if counter > period then
                counter <= (others => '0');
                counting_up <= '1';
            end if;
            if counting_up = '1' and counter = period then
                counting_up <= '0';
            end if;
            if counting_up = '0' and counter = 0 then
                counting_up <= '1';
            end if;
            if counting_up = '1' and counter < period then
                counter <= counter + 1;
            end if;
            if counting_up = '0' and counter > 0 and counter <= period then
                counter <= counter - 1;
            end if;
        end if;
    end process;
end architecture rtl;
