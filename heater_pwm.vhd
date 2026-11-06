library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity heater_pwm is
    generic (
        counter_width : positive := 16
    );
    port (
        clk, reset, global_sync : in std_logic;
        period : in unsigned(counter_width - 1 downto 0);
        phase_delay : in unsigned(counter_width downto 0);
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
        variable half_ticks, cycle_ticks, delay_ticks : unsigned(counter_width + 1 downto 0);
    begin
        if reset = '1' then
            counter <= (others => '0');
            counting_up <= '1';
        elsif rising_edge(clk) then
            if global_sync = '1' then
                half_ticks := resize(period, half_ticks'length) + 1;
                cycle_ticks := shift_left(half_ticks, 1);
                delay_ticks := resize(phase_delay, delay_ticks'length);

                -- Preload the point that reaches rising zero phase_delay clocks after sync.
                if delay_ticks = 0 or delay_ticks >= cycle_ticks then
                    counter <= (others => '0');
                    counting_up <= '1';
                elsif delay_ticks <= half_ticks then
                    counter <= resize(delay_ticks - 1, counter'length);
                    counting_up <= '0';
                else
                    counter <= resize(cycle_ticks - delay_ticks, counter'length);
                    counting_up <= '1';
                end if;
            elsif counter > period then
                counter <= (others => '0');
                counting_up <= '1';
            elsif counting_up = '1' then
                -- Repeat both endpoints so a cycle takes 2 * (period + 1) clocks.
                if counter = period then
                    counting_up <= '0';
                else
                    counter <= counter + 1;
                end if;
            elsif counter = 0 then
                counting_up <= '1';
            else
                counter <= counter - 1;
            end if;
        end if;
    end process;
end architecture rtl;
