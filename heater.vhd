library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity heater is
    generic (
        pwm_counter_width : positive := 16
    );
    port (
        clk, reset : in std_logic;
        pwm_period, pwm_duty_request : in unsigned(pwm_counter_width - 1 downto 0);
        pwm : out std_logic;
        capture_bit, publish_sample : in std_logic;
        temp_sdo : in std_logic;
        temp_sense : out std_logic_vector(31 downto 0);
        current_sdo : in std_logic;
        current_sense : out std_logic_vector(31 downto 0)
    );
end entity heater;

architecture structural of heater is
begin
    pwm_driver : entity work.heater_pwm
        generic map (
            counter_width => pwm_counter_width
        )
        port map (
            clk          => clk,
            reset        => reset,
            period       => pwm_period,
            duty_request => pwm_duty_request,
            pwm          => pwm
        );

    temperature_adc : entity work.adc_sample_capture
        port map (
            clk            => clk,
            reset          => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo        => temp_sdo,
            adc_data       => temp_sense
        );

    current_adc : entity work.adc_sample_capture
        port map (
            clk            => clk,
            reset          => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo        => current_sdo,
            adc_data       => current_sense
        );
end architecture structural;
