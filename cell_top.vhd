library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cell_top is
    generic (
        pwm_counter_width : positive := 16
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        global_sync : in std_logic;
        adc_sclk : out std_logic;
        adc_cs : out std_logic;
        pwm_period : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo1 : in std_logic;
        current_sdo1 : in std_logic;
        pwm1 : out std_logic;
        temp_sense1 : out std_logic_vector(31 downto 0);
        current_sense1 : out std_logic_vector(31 downto 0);
        pwm_duty_request1 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo2 : in std_logic;
        current_sdo2 : in std_logic;
        pwm2 : out std_logic;
        temp_sense2 : out std_logic_vector(31 downto 0);
        current_sense2 : out std_logic_vector(31 downto 0);
        pwm_duty_request2 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo3 : in std_logic;
        current_sdo3 : in std_logic;
        pwm3 : out std_logic;
        temp_sense3 : out std_logic_vector(31 downto 0);
        current_sense3 : out std_logic_vector(31 downto 0);
        pwm_duty_request3 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo4 : in std_logic;
        current_sdo4 : in std_logic;
        pwm4 : out std_logic;
        temp_sense4 : out std_logic_vector(31 downto 0);
        current_sense4 : out std_logic_vector(31 downto 0);
        pwm_duty_request4 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo5 : in std_logic;
        current_sdo5 : in std_logic;
        pwm5 : out std_logic;
        temp_sense5 : out std_logic_vector(31 downto 0);
        current_sense5 : out std_logic_vector(31 downto 0);
        pwm_duty_request5 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo6 : in std_logic;
        current_sdo6 : in std_logic;
        pwm6 : out std_logic;
        temp_sense6 : out std_logic_vector(31 downto 0);
        current_sense6 : out std_logic_vector(31 downto 0);
        pwm_duty_request6 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo7 : in std_logic;
        current_sdo7 : in std_logic;
        pwm7 : out std_logic;
        temp_sense7 : out std_logic_vector(31 downto 0);
        current_sense7 : out std_logic_vector(31 downto 0);
        pwm_duty_request7 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo8 : in std_logic;
        current_sdo8 : in std_logic;
        pwm8 : out std_logic;
        temp_sense8 : out std_logic_vector(31 downto 0);
        current_sense8 : out std_logic_vector(31 downto 0);
        pwm_duty_request8 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo9 : in std_logic;
        current_sdo9 : in std_logic;
        pwm9 : out std_logic;
        temp_sense9 : out std_logic_vector(31 downto 0);
        current_sense9 : out std_logic_vector(31 downto 0);
        pwm_duty_request9 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo10 : in std_logic;
        current_sdo10 : in std_logic;
        pwm10 : out std_logic;
        temp_sense10 : out std_logic_vector(31 downto 0);
        current_sense10 : out std_logic_vector(31 downto 0);
        pwm_duty_request10 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo11 : in std_logic;
        current_sdo11 : in std_logic;
        pwm11 : out std_logic;
        temp_sense11 : out std_logic_vector(31 downto 0);
        current_sense11 : out std_logic_vector(31 downto 0);
        pwm_duty_request11 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo12 : in std_logic;
        current_sdo12 : in std_logic;
        pwm12 : out std_logic;
        temp_sense12 : out std_logic_vector(31 downto 0);
        current_sense12 : out std_logic_vector(31 downto 0);
        pwm_duty_request12 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo13 : in std_logic;
        current_sdo13 : in std_logic;
        pwm13 : out std_logic;
        temp_sense13 : out std_logic_vector(31 downto 0);
        current_sense13 : out std_logic_vector(31 downto 0);
        pwm_duty_request13 : in unsigned(pwm_counter_width - 1 downto 0);
        temp_sdo14 : in std_logic;
        current_sdo14 : in std_logic;
        pwm14 : out std_logic;
        temp_sense14 : out std_logic_vector(31 downto 0);
        current_sense14 : out std_logic_vector(31 downto 0);
        pwm_duty_request14 : in unsigned(pwm_counter_width - 1 downto 0);
        rtd_sdo1 : in std_logic;
        rtd_sense1 : out std_logic_vector(31 downto 0);
        rtd_sdo2 : in std_logic;
        rtd_sense2 : out std_logic_vector(31 downto 0)
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

    heater1 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo1,
            current_sdo      => current_sdo1,
            pwm              => pwm1,
            temp_sense       => temp_sense1,
            current_sense    => current_sense1,
            pwm_duty_request => pwm_duty_request1
        );

    heater2 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo2,
            current_sdo      => current_sdo2,
            pwm              => pwm2,
            temp_sense       => temp_sense2,
            current_sense    => current_sense2,
            pwm_duty_request => pwm_duty_request2
        );

    heater3 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo3,
            current_sdo      => current_sdo3,
            pwm              => pwm3,
            temp_sense       => temp_sense3,
            current_sense    => current_sense3,
            pwm_duty_request => pwm_duty_request3
        );

    heater4 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo4,
            current_sdo      => current_sdo4,
            pwm              => pwm4,
            temp_sense       => temp_sense4,
            current_sense    => current_sense4,
            pwm_duty_request => pwm_duty_request4
        );

    heater5 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo5,
            current_sdo      => current_sdo5,
            pwm              => pwm5,
            temp_sense       => temp_sense5,
            current_sense    => current_sense5,
            pwm_duty_request => pwm_duty_request5
        );

    heater6 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo6,
            current_sdo      => current_sdo6,
            pwm              => pwm6,
            temp_sense       => temp_sense6,
            current_sense    => current_sense6,
            pwm_duty_request => pwm_duty_request6
        );

    heater7 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo7,
            current_sdo      => current_sdo7,
            pwm              => pwm7,
            temp_sense       => temp_sense7,
            current_sense    => current_sense7,
            pwm_duty_request => pwm_duty_request7
        );

    heater8 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo8,
            current_sdo      => current_sdo8,
            pwm              => pwm8,
            temp_sense       => temp_sense8,
            current_sense    => current_sense8,
            pwm_duty_request => pwm_duty_request8
        );

    heater9 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo9,
            current_sdo      => current_sdo9,
            pwm              => pwm9,
            temp_sense       => temp_sense9,
            current_sense    => current_sense9,
            pwm_duty_request => pwm_duty_request9
        );

    heater10 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo10,
            current_sdo      => current_sdo10,
            pwm              => pwm10,
            temp_sense       => temp_sense10,
            current_sense    => current_sense10,
            pwm_duty_request => pwm_duty_request10
        );

    heater11 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo11,
            current_sdo      => current_sdo11,
            pwm              => pwm11,
            temp_sense       => temp_sense11,
            current_sense    => current_sense11,
            pwm_duty_request => pwm_duty_request11
        );

    heater12 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo12,
            current_sdo      => current_sdo12,
            pwm              => pwm12,
            temp_sense       => temp_sense12,
            current_sense    => current_sense12,
            pwm_duty_request => pwm_duty_request12
        );

    heater13 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo13,
            current_sdo      => current_sdo13,
            pwm              => pwm13,
            temp_sense       => temp_sense13,
            current_sense    => current_sense13,
            pwm_duty_request => pwm_duty_request13
        );

    heater14 : entity work.heater
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk              => clk,
            reset            => reset,
            capture_bit      => capture_bit,
            publish_sample   => publish_sample,
            pwm_period       => pwm_period,
            temp_sdo         => temp_sdo14,
            current_sdo      => current_sdo14,
            pwm              => pwm14,
            temp_sense       => temp_sense14,
            current_sense    => current_sense14,
            pwm_duty_request => pwm_duty_request14
        );

    rtd_adc1 : entity work.adc_sample_capture
        port map (
            clk            => clk,
            reset          => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo        => rtd_sdo1,
            adc_data       => rtd_sense1
        );

    rtd_adc2 : entity work.adc_sample_capture
        port map (
            clk            => clk,
            reset          => reset,
            capture_bit    => capture_bit,
            publish_sample => publish_sample,
            adc_sdo        => rtd_sdo2,
            adc_data       => rtd_sense2
        );

end architecture structural;
