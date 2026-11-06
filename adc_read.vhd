library IEEE;
use IEEE.std_logic_1164.all;

entity adc_frame_control is
    port (
        clk, reset, global_sync : in std_logic;
        adc_sclk, adc_cs : out std_logic;
        capture_bit, publish_sample : out std_logic
    );
end entity adc_frame_control;

architecture rtl of adc_frame_control is
    -- 100 MHz system clock, 3.125 MHz ADC clock.
    constant half_period : positive := 16;
    constant quiet_period : positive := 32;
    type adc_state is (idle, clock_low, clock_high, quiet);
    signal state : adc_state;
    signal clock_counter : natural range 0 to quiet_period - 1;
    signal bit_counter : natural range 0 to 15;
    signal startup : std_logic;
begin
    -- Rising edges 4 through 15 carry DB11 through DB0.
    capture_bit <= '1' when state = clock_low and clock_counter = half_period - 1
                            and bit_counter >= 3 and bit_counter <= 14 else '0';
    publish_sample <= '1' when state = clock_low and clock_counter = half_period - 1
                               and bit_counter = 15 and startup = '0' else '0';

    process (clk, reset)
    begin
        if reset = '1' then
            state <= idle;
            clock_counter <= 0;
            bit_counter <= 0;
            startup <= '1';
            adc_cs <= '1';
            adc_sclk <= '1';
        elsif rising_edge(clk) then
            case state is
                when idle =>
                    -- The first frame wakes the ADCs if they powered up in shutdown.
                    if startup = '1' or global_sync = '1' then
                        adc_cs <= '0';
                        state <= clock_high;
                    end if;

                when clock_high =>
                    if clock_counter = half_period - 1 then
                        clock_counter <= 0;
                        adc_sclk <= '0';
                        state <= clock_low;
                    else
                        clock_counter <= clock_counter + 1;
                    end if;

                when clock_low =>
                    if clock_counter = half_period - 1 then
                        clock_counter <= 0;
                        adc_sclk <= '1';
                        if bit_counter = 15 then
                            bit_counter <= 0;
                            adc_cs <= '1';
                            startup <= '0';
                            state <= quiet;
                        else
                            bit_counter <= bit_counter + 1;
                            state <= clock_high;
                        end if;
                    else
                        clock_counter <= clock_counter + 1;
                    end if;

                when quiet =>
                    if clock_counter = quiet_period - 1 then
                        clock_counter <= 0;
                        state <= idle;
                    else
                        clock_counter <= clock_counter + 1;
                    end if;
            end case;
        end if;
    end process;
end architecture rtl;

library IEEE;
use IEEE.std_logic_1164.all;

entity adc_sample_capture is
    port (
        clk, reset, capture_bit, publish_sample : in std_logic;
        adc_sdo : in std_logic;
        adc_data : out std_logic_vector(31 downto 0)
    );
end entity adc_sample_capture;

architecture rtl of adc_sample_capture is
    signal shift_data : std_logic_vector(11 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            shift_data <= (others => '0');
            adc_data <= (others => '0');
        elsif rising_edge(clk) then
            if capture_bit = '1' then
                shift_data <= shift_data(10 downto 0) & adc_sdo;
            end if;
            if publish_sample = '1' then
                adc_data <= shift_data & x"00000";
            end if;
        end if;
    end process;
end architecture rtl;

library IEEE;
use IEEE.std_logic_1164.all;

entity adc_read is
    port (
        clk, reset, global_sync : in std_logic;
        adc_sclk, adc_cs : out std_logic;
        adc_sdo : in std_logic;
        adc_data : out std_logic_vector(31 downto 0)
    );
end entity adc_read;

architecture structural of adc_read is
    signal capture_bit, publish_sample : std_logic;
begin
    frame_control : entity work.adc_frame_control
        port map (
            clk => clk, reset => reset, global_sync => global_sync,
            adc_sclk => adc_sclk, adc_cs => adc_cs,
            capture_bit => capture_bit, publish_sample => publish_sample
        );

    sample_capture : entity work.adc_sample_capture
        port map (
            clk => clk, reset => reset,
            capture_bit => capture_bit, publish_sample => publish_sample,
            adc_sdo => adc_sdo, adc_data => adc_data
        );
end architecture structural;
