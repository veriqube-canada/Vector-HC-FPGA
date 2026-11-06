library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity heater is
    generic (
        pwm_counter_width : positive := 16
    );
    port (
        clk, reset, global_sync : in std_logic;
        pwm_period, pwm_duty_request : in unsigned(pwm_counter_width - 1 downto 0);
        pwm_phase_delay : in unsigned(pwm_counter_width downto 0);
        pwm : out std_logic;
        capture_bit, publish_sample : in std_logic;
        temp_adc_sdo : in std_logic;
        temp_adc_data : out std_logic_vector(31 downto 0);
        current_adc_sdo : in std_logic;
        current_adc_data : out std_logic_vector(31 downto 0)
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
            global_sync  => global_sync,
            period       => pwm_period,
            phase_delay  => pwm_phase_delay,
            duty_request => pwm_duty_request,
            pwm          => pwm
        );

    temperature_adc : entity work.adc_sample_capture
        port map (
            clk         => clk,
            reset       => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo     => temp_adc_sdo,
            adc_data    => temp_adc_data
        );

    current_adc : entity work.adc_sample_capture
        port map (
            clk         => clk,
            reset       => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo     => current_adc_sdo,
            adc_data    => current_adc_data
        );
end architecture structural;
