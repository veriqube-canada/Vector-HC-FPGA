library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cell_top is
    generic (
        pwm_counter_width : positive := 16
    );
    port (
        clk, reset, global_sync : in std_logic;
        adc_sclk, adc_cs : out std_logic;
        pwm_period : in unsigned(pwm_counter_width - 1 downto 0);
        pwm_phase_delay : in unsigned(14 * (pwm_counter_width + 1) - 1 downto 0);
        pwm_duty_request : in unsigned(14 * pwm_counter_width - 1 downto 0);
        pwm : out std_logic_vector(13 downto 0);
        temp_adc_sdo : in std_logic_vector(13 downto 0);
        temp_adc_data : out std_logic_vector(447 downto 0);
        current_adc_sdo : in std_logic_vector(13 downto 0);
        current_adc_data : out std_logic_vector(447 downto 0);
        rtd_adc_sdo : in std_logic_vector(1 downto 0);
        rtd_adc_data : out std_logic_vector(63 downto 0)
    );
end entity cell_top;

architecture structural of cell_top is
    signal capture_bit, publish_sample : std_logic;
begin
    frame_control : entity work.adc_frame_control
        port map (
            clk            => clk,
            reset          => reset,
            global_sync    => global_sync,
            adc_sclk       => adc_sclk,
            adc_cs         => adc_cs,
            capture_bit    => capture_bit,
            publish_sample => publish_sample
        );

    -- Heater 0 occupies the least significant word of each PWM and sample bus.
    heaters : for i in 0 to 13 generate
        constant pwm_low : natural := i * pwm_counter_width;
        constant pwm_high : natural := pwm_low + pwm_counter_width - 1;
        constant phase_low : natural := i * (pwm_counter_width + 1);
        constant phase_high : natural := phase_low + pwm_counter_width;
    begin
        heater_instance : entity work.heater
            generic map (
                pwm_counter_width => pwm_counter_width
            )
            port map (
                clk              => clk,
                reset            => reset,
                global_sync      => global_sync,
                capture_bit      => capture_bit,
                publish_sample   => publish_sample,
                pwm_period       => pwm_period,
                pwm_phase_delay  => pwm_phase_delay(phase_high downto phase_low),
                pwm_duty_request => pwm_duty_request(pwm_high downto pwm_low),
                pwm              => pwm(i),
                temp_adc_sdo     => temp_adc_sdo(i),
                temp_adc_data    => temp_adc_data(32*i+31 downto 32*i),
                current_adc_sdo  => current_adc_sdo(i),
                current_adc_data => current_adc_data(32*i+31 downto 32*i)
            );
    end generate heaters;

    rtd_adc_0 : entity work.adc_sample_capture
        port map (
            clk         => clk,
            reset       => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo     => rtd_adc_sdo(0),
            adc_data    => rtd_adc_data(31 downto 0)
        );

    rtd_adc_1 : entity work.adc_sample_capture
        port map (
            clk         => clk,
            reset       => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo     => rtd_adc_sdo(1),
            adc_data    => rtd_adc_data(63 downto 32)
        );
end architecture structural;
