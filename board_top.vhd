library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity board_top is
    generic (
        pwm_counter_width : positive range 1 to 31 := 16
    );
    port (
        clk, reset, global_sync : in std_logic;
        spi_sck, spi_mosi, spi_scs : in std_logic;
        spi_miso : out std_logic;
        pwm : out std_logic_vector(41 downto 0);
        adc_sclk, adc_cs : out std_logic_vector(2 downto 0);
        temp_adc_sdo : in std_logic_vector(41 downto 0);
        temp_adc_data : out std_logic_vector(1343 downto 0);
        current_adc_sdo : in std_logic_vector(41 downto 0);
        current_adc_data : out std_logic_vector(1343 downto 0);
        rtd_adc_sdo : in std_logic_vector(5 downto 0);
        rtd_adc_data : out std_logic_vector(191 downto 0)
    );
end entity board_top;

architecture structural of board_top is
    constant version : std_logic_vector(31 downto 0) := x"22222222";
    signal dummy_register, mcu_settings1 : std_logic_vector(31 downto 0);
    signal memory_in, memory_out : std_logic_vector(31 downto 0);
    signal address_memory : std_logic_vector(15 downto 0);
    signal read_memory, write_memory : std_logic;
    signal temperature_samples : std_logic_vector(temp_adc_data'range);
    signal current_samples : std_logic_vector(current_adc_data'range);
    signal rtd_samples : std_logic_vector(rtd_adc_data'range);
    signal pwm_period : unsigned(pwm_counter_width - 1 downto 0);
    signal pwm_phase_delay : unsigned(42 * (pwm_counter_width + 1) - 1 downto 0);
    signal pwm_duty_request : unsigned(42 * pwm_counter_width - 1 downto 0);
begin
    temp_adc_data <= temperature_samples;
    current_adc_data <= current_samples;
    rtd_adc_data <= rtd_samples;

    spi1 : entity work.spi_slave
        port map (
            clk            => clk,
            reset          => reset,
            memory_in      => memory_in,
            memory_out     => memory_out,
            read_memory    => read_memory,
            write_memory   => write_memory,
            address_memory => address_memory,
            spi_sck        => spi_sck,
            spi_mosi       => spi_mosi,
            spi_scs        => spi_scs,
            spi_miso       => spi_miso
        );

    -- Service registers use 0x00xx. Zero-based cell c starts at 256 * (c + 1).
    -- Heater h starts at cell base + 8 * h.
    -- RTDs are at cell base + 0x78 and + 0x79.
    process (clk, reset)
    begin
        if reset = '1' then
            memory_out <= (others => '0');
            dummy_register <= (others => '0');
            mcu_settings1 <= x"11111111";
            pwm_period <= (others => '0');
            pwm_phase_delay <= (others => '0');
            pwm_duty_request <= (others => '1');
        elsif rising_edge(clk) then
            if read_memory = '1' then
                memory_out <= x"01234567";
                if address_memory = x"0000" then memory_out <= dummy_register; end if;
                if address_memory = x"0001" then memory_out <= mcu_settings1; end if;
                if address_memory = x"0002" then memory_out <= version; end if;
                if address_memory = x"0004" then memory_out <= std_logic_vector(resize(pwm_period, 32)); end if;

                -- Cell 0
                if address_memory = x"0100" then memory_out <= temperature_samples(31 downto 0); end if;
                if address_memory = x"0101" then memory_out <= current_samples(31 downto 0); end if;
                if address_memory = x"0102" then memory_out <= std_logic_vector(resize(pwm_phase_delay(1 * (pwm_counter_width + 1) - 1 downto 0 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0103" then memory_out <= std_logic_vector(resize(pwm_duty_request(1 * pwm_counter_width - 1 downto 0 * pwm_counter_width), 32)); end if;
                if address_memory = x"0108" then memory_out <= temperature_samples(63 downto 32); end if;
                if address_memory = x"0109" then memory_out <= current_samples(63 downto 32); end if;
                if address_memory = x"010A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(2 * (pwm_counter_width + 1) - 1 downto 1 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"010B" then memory_out <= std_logic_vector(resize(pwm_duty_request(2 * pwm_counter_width - 1 downto 1 * pwm_counter_width), 32)); end if;
                if address_memory = x"0110" then memory_out <= temperature_samples(95 downto 64); end if;
                if address_memory = x"0111" then memory_out <= current_samples(95 downto 64); end if;
                if address_memory = x"0112" then memory_out <= std_logic_vector(resize(pwm_phase_delay(3 * (pwm_counter_width + 1) - 1 downto 2 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0113" then memory_out <= std_logic_vector(resize(pwm_duty_request(3 * pwm_counter_width - 1 downto 2 * pwm_counter_width), 32)); end if;
                if address_memory = x"0118" then memory_out <= temperature_samples(127 downto 96); end if;
                if address_memory = x"0119" then memory_out <= current_samples(127 downto 96); end if;
                if address_memory = x"011A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(4 * (pwm_counter_width + 1) - 1 downto 3 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"011B" then memory_out <= std_logic_vector(resize(pwm_duty_request(4 * pwm_counter_width - 1 downto 3 * pwm_counter_width), 32)); end if;
                if address_memory = x"0120" then memory_out <= temperature_samples(159 downto 128); end if;
                if address_memory = x"0121" then memory_out <= current_samples(159 downto 128); end if;
                if address_memory = x"0122" then memory_out <= std_logic_vector(resize(pwm_phase_delay(5 * (pwm_counter_width + 1) - 1 downto 4 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0123" then memory_out <= std_logic_vector(resize(pwm_duty_request(5 * pwm_counter_width - 1 downto 4 * pwm_counter_width), 32)); end if;
                if address_memory = x"0128" then memory_out <= temperature_samples(191 downto 160); end if;
                if address_memory = x"0129" then memory_out <= current_samples(191 downto 160); end if;
                if address_memory = x"012A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(6 * (pwm_counter_width + 1) - 1 downto 5 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"012B" then memory_out <= std_logic_vector(resize(pwm_duty_request(6 * pwm_counter_width - 1 downto 5 * pwm_counter_width), 32)); end if;
                if address_memory = x"0130" then memory_out <= temperature_samples(223 downto 192); end if;
                if address_memory = x"0131" then memory_out <= current_samples(223 downto 192); end if;
                if address_memory = x"0132" then memory_out <= std_logic_vector(resize(pwm_phase_delay(7 * (pwm_counter_width + 1) - 1 downto 6 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0133" then memory_out <= std_logic_vector(resize(pwm_duty_request(7 * pwm_counter_width - 1 downto 6 * pwm_counter_width), 32)); end if;
                if address_memory = x"0138" then memory_out <= temperature_samples(255 downto 224); end if;
                if address_memory = x"0139" then memory_out <= current_samples(255 downto 224); end if;
                if address_memory = x"013A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(8 * (pwm_counter_width + 1) - 1 downto 7 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"013B" then memory_out <= std_logic_vector(resize(pwm_duty_request(8 * pwm_counter_width - 1 downto 7 * pwm_counter_width), 32)); end if;
                if address_memory = x"0140" then memory_out <= temperature_samples(287 downto 256); end if;
                if address_memory = x"0141" then memory_out <= current_samples(287 downto 256); end if;
                if address_memory = x"0142" then memory_out <= std_logic_vector(resize(pwm_phase_delay(9 * (pwm_counter_width + 1) - 1 downto 8 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0143" then memory_out <= std_logic_vector(resize(pwm_duty_request(9 * pwm_counter_width - 1 downto 8 * pwm_counter_width), 32)); end if;
                if address_memory = x"0148" then memory_out <= temperature_samples(319 downto 288); end if;
                if address_memory = x"0149" then memory_out <= current_samples(319 downto 288); end if;
                if address_memory = x"014A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(10 * (pwm_counter_width + 1) - 1 downto 9 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"014B" then memory_out <= std_logic_vector(resize(pwm_duty_request(10 * pwm_counter_width - 1 downto 9 * pwm_counter_width), 32)); end if;
                if address_memory = x"0150" then memory_out <= temperature_samples(351 downto 320); end if;
                if address_memory = x"0151" then memory_out <= current_samples(351 downto 320); end if;
                if address_memory = x"0152" then memory_out <= std_logic_vector(resize(pwm_phase_delay(11 * (pwm_counter_width + 1) - 1 downto 10 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0153" then memory_out <= std_logic_vector(resize(pwm_duty_request(11 * pwm_counter_width - 1 downto 10 * pwm_counter_width), 32)); end if;
                if address_memory = x"0158" then memory_out <= temperature_samples(383 downto 352); end if;
                if address_memory = x"0159" then memory_out <= current_samples(383 downto 352); end if;
                if address_memory = x"015A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(12 * (pwm_counter_width + 1) - 1 downto 11 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"015B" then memory_out <= std_logic_vector(resize(pwm_duty_request(12 * pwm_counter_width - 1 downto 11 * pwm_counter_width), 32)); end if;
                if address_memory = x"0160" then memory_out <= temperature_samples(415 downto 384); end if;
                if address_memory = x"0161" then memory_out <= current_samples(415 downto 384); end if;
                if address_memory = x"0162" then memory_out <= std_logic_vector(resize(pwm_phase_delay(13 * (pwm_counter_width + 1) - 1 downto 12 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0163" then memory_out <= std_logic_vector(resize(pwm_duty_request(13 * pwm_counter_width - 1 downto 12 * pwm_counter_width), 32)); end if;
                if address_memory = x"0168" then memory_out <= temperature_samples(447 downto 416); end if;
                if address_memory = x"0169" then memory_out <= current_samples(447 downto 416); end if;
                if address_memory = x"016A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(14 * (pwm_counter_width + 1) - 1 downto 13 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"016B" then memory_out <= std_logic_vector(resize(pwm_duty_request(14 * pwm_counter_width - 1 downto 13 * pwm_counter_width), 32)); end if;
                if address_memory = x"0178" then memory_out <= rtd_samples(31 downto 0); end if;
                if address_memory = x"0179" then memory_out <= rtd_samples(63 downto 32); end if;

                -- Cell 1
                if address_memory = x"0200" then memory_out <= temperature_samples(479 downto 448); end if;
                if address_memory = x"0201" then memory_out <= current_samples(479 downto 448); end if;
                if address_memory = x"0202" then memory_out <= std_logic_vector(resize(pwm_phase_delay(15 * (pwm_counter_width + 1) - 1 downto 14 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0203" then memory_out <= std_logic_vector(resize(pwm_duty_request(15 * pwm_counter_width - 1 downto 14 * pwm_counter_width), 32)); end if;
                if address_memory = x"0208" then memory_out <= temperature_samples(511 downto 480); end if;
                if address_memory = x"0209" then memory_out <= current_samples(511 downto 480); end if;
                if address_memory = x"020A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(16 * (pwm_counter_width + 1) - 1 downto 15 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"020B" then memory_out <= std_logic_vector(resize(pwm_duty_request(16 * pwm_counter_width - 1 downto 15 * pwm_counter_width), 32)); end if;
                if address_memory = x"0210" then memory_out <= temperature_samples(543 downto 512); end if;
                if address_memory = x"0211" then memory_out <= current_samples(543 downto 512); end if;
                if address_memory = x"0212" then memory_out <= std_logic_vector(resize(pwm_phase_delay(17 * (pwm_counter_width + 1) - 1 downto 16 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0213" then memory_out <= std_logic_vector(resize(pwm_duty_request(17 * pwm_counter_width - 1 downto 16 * pwm_counter_width), 32)); end if;
                if address_memory = x"0218" then memory_out <= temperature_samples(575 downto 544); end if;
                if address_memory = x"0219" then memory_out <= current_samples(575 downto 544); end if;
                if address_memory = x"021A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(18 * (pwm_counter_width + 1) - 1 downto 17 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"021B" then memory_out <= std_logic_vector(resize(pwm_duty_request(18 * pwm_counter_width - 1 downto 17 * pwm_counter_width), 32)); end if;
                if address_memory = x"0220" then memory_out <= temperature_samples(607 downto 576); end if;
                if address_memory = x"0221" then memory_out <= current_samples(607 downto 576); end if;
                if address_memory = x"0222" then memory_out <= std_logic_vector(resize(pwm_phase_delay(19 * (pwm_counter_width + 1) - 1 downto 18 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0223" then memory_out <= std_logic_vector(resize(pwm_duty_request(19 * pwm_counter_width - 1 downto 18 * pwm_counter_width), 32)); end if;
                if address_memory = x"0228" then memory_out <= temperature_samples(639 downto 608); end if;
                if address_memory = x"0229" then memory_out <= current_samples(639 downto 608); end if;
                if address_memory = x"022A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(20 * (pwm_counter_width + 1) - 1 downto 19 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"022B" then memory_out <= std_logic_vector(resize(pwm_duty_request(20 * pwm_counter_width - 1 downto 19 * pwm_counter_width), 32)); end if;
                if address_memory = x"0230" then memory_out <= temperature_samples(671 downto 640); end if;
                if address_memory = x"0231" then memory_out <= current_samples(671 downto 640); end if;
                if address_memory = x"0232" then memory_out <= std_logic_vector(resize(pwm_phase_delay(21 * (pwm_counter_width + 1) - 1 downto 20 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0233" then memory_out <= std_logic_vector(resize(pwm_duty_request(21 * pwm_counter_width - 1 downto 20 * pwm_counter_width), 32)); end if;
                if address_memory = x"0238" then memory_out <= temperature_samples(703 downto 672); end if;
                if address_memory = x"0239" then memory_out <= current_samples(703 downto 672); end if;
                if address_memory = x"023A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(22 * (pwm_counter_width + 1) - 1 downto 21 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"023B" then memory_out <= std_logic_vector(resize(pwm_duty_request(22 * pwm_counter_width - 1 downto 21 * pwm_counter_width), 32)); end if;
                if address_memory = x"0240" then memory_out <= temperature_samples(735 downto 704); end if;
                if address_memory = x"0241" then memory_out <= current_samples(735 downto 704); end if;
                if address_memory = x"0242" then memory_out <= std_logic_vector(resize(pwm_phase_delay(23 * (pwm_counter_width + 1) - 1 downto 22 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0243" then memory_out <= std_logic_vector(resize(pwm_duty_request(23 * pwm_counter_width - 1 downto 22 * pwm_counter_width), 32)); end if;
                if address_memory = x"0248" then memory_out <= temperature_samples(767 downto 736); end if;
                if address_memory = x"0249" then memory_out <= current_samples(767 downto 736); end if;
                if address_memory = x"024A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(24 * (pwm_counter_width + 1) - 1 downto 23 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"024B" then memory_out <= std_logic_vector(resize(pwm_duty_request(24 * pwm_counter_width - 1 downto 23 * pwm_counter_width), 32)); end if;
                if address_memory = x"0250" then memory_out <= temperature_samples(799 downto 768); end if;
                if address_memory = x"0251" then memory_out <= current_samples(799 downto 768); end if;
                if address_memory = x"0252" then memory_out <= std_logic_vector(resize(pwm_phase_delay(25 * (pwm_counter_width + 1) - 1 downto 24 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0253" then memory_out <= std_logic_vector(resize(pwm_duty_request(25 * pwm_counter_width - 1 downto 24 * pwm_counter_width), 32)); end if;
                if address_memory = x"0258" then memory_out <= temperature_samples(831 downto 800); end if;
                if address_memory = x"0259" then memory_out <= current_samples(831 downto 800); end if;
                if address_memory = x"025A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(26 * (pwm_counter_width + 1) - 1 downto 25 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"025B" then memory_out <= std_logic_vector(resize(pwm_duty_request(26 * pwm_counter_width - 1 downto 25 * pwm_counter_width), 32)); end if;
                if address_memory = x"0260" then memory_out <= temperature_samples(863 downto 832); end if;
                if address_memory = x"0261" then memory_out <= current_samples(863 downto 832); end if;
                if address_memory = x"0262" then memory_out <= std_logic_vector(resize(pwm_phase_delay(27 * (pwm_counter_width + 1) - 1 downto 26 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0263" then memory_out <= std_logic_vector(resize(pwm_duty_request(27 * pwm_counter_width - 1 downto 26 * pwm_counter_width), 32)); end if;
                if address_memory = x"0268" then memory_out <= temperature_samples(895 downto 864); end if;
                if address_memory = x"0269" then memory_out <= current_samples(895 downto 864); end if;
                if address_memory = x"026A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(28 * (pwm_counter_width + 1) - 1 downto 27 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"026B" then memory_out <= std_logic_vector(resize(pwm_duty_request(28 * pwm_counter_width - 1 downto 27 * pwm_counter_width), 32)); end if;
                if address_memory = x"0278" then memory_out <= rtd_samples(95 downto 64); end if;
                if address_memory = x"0279" then memory_out <= rtd_samples(127 downto 96); end if;

                -- Cell 2
                if address_memory = x"0300" then memory_out <= temperature_samples(927 downto 896); end if;
                if address_memory = x"0301" then memory_out <= current_samples(927 downto 896); end if;
                if address_memory = x"0302" then memory_out <= std_logic_vector(resize(pwm_phase_delay(29 * (pwm_counter_width + 1) - 1 downto 28 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0303" then memory_out <= std_logic_vector(resize(pwm_duty_request(29 * pwm_counter_width - 1 downto 28 * pwm_counter_width), 32)); end if;
                if address_memory = x"0308" then memory_out <= temperature_samples(959 downto 928); end if;
                if address_memory = x"0309" then memory_out <= current_samples(959 downto 928); end if;
                if address_memory = x"030A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(30 * (pwm_counter_width + 1) - 1 downto 29 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"030B" then memory_out <= std_logic_vector(resize(pwm_duty_request(30 * pwm_counter_width - 1 downto 29 * pwm_counter_width), 32)); end if;
                if address_memory = x"0310" then memory_out <= temperature_samples(991 downto 960); end if;
                if address_memory = x"0311" then memory_out <= current_samples(991 downto 960); end if;
                if address_memory = x"0312" then memory_out <= std_logic_vector(resize(pwm_phase_delay(31 * (pwm_counter_width + 1) - 1 downto 30 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0313" then memory_out <= std_logic_vector(resize(pwm_duty_request(31 * pwm_counter_width - 1 downto 30 * pwm_counter_width), 32)); end if;
                if address_memory = x"0318" then memory_out <= temperature_samples(1023 downto 992); end if;
                if address_memory = x"0319" then memory_out <= current_samples(1023 downto 992); end if;
                if address_memory = x"031A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(32 * (pwm_counter_width + 1) - 1 downto 31 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"031B" then memory_out <= std_logic_vector(resize(pwm_duty_request(32 * pwm_counter_width - 1 downto 31 * pwm_counter_width), 32)); end if;
                if address_memory = x"0320" then memory_out <= temperature_samples(1055 downto 1024); end if;
                if address_memory = x"0321" then memory_out <= current_samples(1055 downto 1024); end if;
                if address_memory = x"0322" then memory_out <= std_logic_vector(resize(pwm_phase_delay(33 * (pwm_counter_width + 1) - 1 downto 32 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0323" then memory_out <= std_logic_vector(resize(pwm_duty_request(33 * pwm_counter_width - 1 downto 32 * pwm_counter_width), 32)); end if;
                if address_memory = x"0328" then memory_out <= temperature_samples(1087 downto 1056); end if;
                if address_memory = x"0329" then memory_out <= current_samples(1087 downto 1056); end if;
                if address_memory = x"032A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(34 * (pwm_counter_width + 1) - 1 downto 33 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"032B" then memory_out <= std_logic_vector(resize(pwm_duty_request(34 * pwm_counter_width - 1 downto 33 * pwm_counter_width), 32)); end if;
                if address_memory = x"0330" then memory_out <= temperature_samples(1119 downto 1088); end if;
                if address_memory = x"0331" then memory_out <= current_samples(1119 downto 1088); end if;
                if address_memory = x"0332" then memory_out <= std_logic_vector(resize(pwm_phase_delay(35 * (pwm_counter_width + 1) - 1 downto 34 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0333" then memory_out <= std_logic_vector(resize(pwm_duty_request(35 * pwm_counter_width - 1 downto 34 * pwm_counter_width), 32)); end if;
                if address_memory = x"0338" then memory_out <= temperature_samples(1151 downto 1120); end if;
                if address_memory = x"0339" then memory_out <= current_samples(1151 downto 1120); end if;
                if address_memory = x"033A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(36 * (pwm_counter_width + 1) - 1 downto 35 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"033B" then memory_out <= std_logic_vector(resize(pwm_duty_request(36 * pwm_counter_width - 1 downto 35 * pwm_counter_width), 32)); end if;
                if address_memory = x"0340" then memory_out <= temperature_samples(1183 downto 1152); end if;
                if address_memory = x"0341" then memory_out <= current_samples(1183 downto 1152); end if;
                if address_memory = x"0342" then memory_out <= std_logic_vector(resize(pwm_phase_delay(37 * (pwm_counter_width + 1) - 1 downto 36 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0343" then memory_out <= std_logic_vector(resize(pwm_duty_request(37 * pwm_counter_width - 1 downto 36 * pwm_counter_width), 32)); end if;
                if address_memory = x"0348" then memory_out <= temperature_samples(1215 downto 1184); end if;
                if address_memory = x"0349" then memory_out <= current_samples(1215 downto 1184); end if;
                if address_memory = x"034A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(38 * (pwm_counter_width + 1) - 1 downto 37 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"034B" then memory_out <= std_logic_vector(resize(pwm_duty_request(38 * pwm_counter_width - 1 downto 37 * pwm_counter_width), 32)); end if;
                if address_memory = x"0350" then memory_out <= temperature_samples(1247 downto 1216); end if;
                if address_memory = x"0351" then memory_out <= current_samples(1247 downto 1216); end if;
                if address_memory = x"0352" then memory_out <= std_logic_vector(resize(pwm_phase_delay(39 * (pwm_counter_width + 1) - 1 downto 38 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0353" then memory_out <= std_logic_vector(resize(pwm_duty_request(39 * pwm_counter_width - 1 downto 38 * pwm_counter_width), 32)); end if;
                if address_memory = x"0358" then memory_out <= temperature_samples(1279 downto 1248); end if;
                if address_memory = x"0359" then memory_out <= current_samples(1279 downto 1248); end if;
                if address_memory = x"035A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(40 * (pwm_counter_width + 1) - 1 downto 39 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"035B" then memory_out <= std_logic_vector(resize(pwm_duty_request(40 * pwm_counter_width - 1 downto 39 * pwm_counter_width), 32)); end if;
                if address_memory = x"0360" then memory_out <= temperature_samples(1311 downto 1280); end if;
                if address_memory = x"0361" then memory_out <= current_samples(1311 downto 1280); end if;
                if address_memory = x"0362" then memory_out <= std_logic_vector(resize(pwm_phase_delay(41 * (pwm_counter_width + 1) - 1 downto 40 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"0363" then memory_out <= std_logic_vector(resize(pwm_duty_request(41 * pwm_counter_width - 1 downto 40 * pwm_counter_width), 32)); end if;
                if address_memory = x"0368" then memory_out <= temperature_samples(1343 downto 1312); end if;
                if address_memory = x"0369" then memory_out <= current_samples(1343 downto 1312); end if;
                if address_memory = x"036A" then memory_out <= std_logic_vector(resize(pwm_phase_delay(42 * (pwm_counter_width + 1) - 1 downto 41 * (pwm_counter_width + 1)), 32)); end if;
                if address_memory = x"036B" then memory_out <= std_logic_vector(resize(pwm_duty_request(42 * pwm_counter_width - 1 downto 41 * pwm_counter_width), 32)); end if;
                if address_memory = x"0378" then memory_out <= rtd_samples(159 downto 128); end if;
                if address_memory = x"0379" then memory_out <= rtd_samples(191 downto 160); end if;

            end if;

            if write_memory = '1' then
                if address_memory = x"0001" then dummy_register <= memory_in; end if;
                if address_memory = x"0002" then mcu_settings1 <= memory_in; end if;
                if address_memory = x"0004" then pwm_period <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

                -- Cell 0
                if address_memory = x"0102" then pwm_phase_delay(1 * (pwm_counter_width + 1) - 1 downto 0 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0103" then pwm_duty_request(1 * pwm_counter_width - 1 downto 0 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"010A" then pwm_phase_delay(2 * (pwm_counter_width + 1) - 1 downto 1 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"010B" then pwm_duty_request(2 * pwm_counter_width - 1 downto 1 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0112" then pwm_phase_delay(3 * (pwm_counter_width + 1) - 1 downto 2 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0113" then pwm_duty_request(3 * pwm_counter_width - 1 downto 2 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"011A" then pwm_phase_delay(4 * (pwm_counter_width + 1) - 1 downto 3 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"011B" then pwm_duty_request(4 * pwm_counter_width - 1 downto 3 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0122" then pwm_phase_delay(5 * (pwm_counter_width + 1) - 1 downto 4 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0123" then pwm_duty_request(5 * pwm_counter_width - 1 downto 4 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"012A" then pwm_phase_delay(6 * (pwm_counter_width + 1) - 1 downto 5 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"012B" then pwm_duty_request(6 * pwm_counter_width - 1 downto 5 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0132" then pwm_phase_delay(7 * (pwm_counter_width + 1) - 1 downto 6 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0133" then pwm_duty_request(7 * pwm_counter_width - 1 downto 6 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"013A" then pwm_phase_delay(8 * (pwm_counter_width + 1) - 1 downto 7 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"013B" then pwm_duty_request(8 * pwm_counter_width - 1 downto 7 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0142" then pwm_phase_delay(9 * (pwm_counter_width + 1) - 1 downto 8 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0143" then pwm_duty_request(9 * pwm_counter_width - 1 downto 8 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"014A" then pwm_phase_delay(10 * (pwm_counter_width + 1) - 1 downto 9 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"014B" then pwm_duty_request(10 * pwm_counter_width - 1 downto 9 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0152" then pwm_phase_delay(11 * (pwm_counter_width + 1) - 1 downto 10 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0153" then pwm_duty_request(11 * pwm_counter_width - 1 downto 10 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"015A" then pwm_phase_delay(12 * (pwm_counter_width + 1) - 1 downto 11 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"015B" then pwm_duty_request(12 * pwm_counter_width - 1 downto 11 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0162" then pwm_phase_delay(13 * (pwm_counter_width + 1) - 1 downto 12 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0163" then pwm_duty_request(13 * pwm_counter_width - 1 downto 12 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"016A" then pwm_phase_delay(14 * (pwm_counter_width + 1) - 1 downto 13 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"016B" then pwm_duty_request(14 * pwm_counter_width - 1 downto 13 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

                -- Cell 1
                if address_memory = x"0202" then pwm_phase_delay(15 * (pwm_counter_width + 1) - 1 downto 14 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0203" then pwm_duty_request(15 * pwm_counter_width - 1 downto 14 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"020A" then pwm_phase_delay(16 * (pwm_counter_width + 1) - 1 downto 15 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"020B" then pwm_duty_request(16 * pwm_counter_width - 1 downto 15 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0212" then pwm_phase_delay(17 * (pwm_counter_width + 1) - 1 downto 16 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0213" then pwm_duty_request(17 * pwm_counter_width - 1 downto 16 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"021A" then pwm_phase_delay(18 * (pwm_counter_width + 1) - 1 downto 17 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"021B" then pwm_duty_request(18 * pwm_counter_width - 1 downto 17 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0222" then pwm_phase_delay(19 * (pwm_counter_width + 1) - 1 downto 18 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0223" then pwm_duty_request(19 * pwm_counter_width - 1 downto 18 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"022A" then pwm_phase_delay(20 * (pwm_counter_width + 1) - 1 downto 19 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"022B" then pwm_duty_request(20 * pwm_counter_width - 1 downto 19 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0232" then pwm_phase_delay(21 * (pwm_counter_width + 1) - 1 downto 20 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0233" then pwm_duty_request(21 * pwm_counter_width - 1 downto 20 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"023A" then pwm_phase_delay(22 * (pwm_counter_width + 1) - 1 downto 21 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"023B" then pwm_duty_request(22 * pwm_counter_width - 1 downto 21 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0242" then pwm_phase_delay(23 * (pwm_counter_width + 1) - 1 downto 22 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0243" then pwm_duty_request(23 * pwm_counter_width - 1 downto 22 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"024A" then pwm_phase_delay(24 * (pwm_counter_width + 1) - 1 downto 23 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"024B" then pwm_duty_request(24 * pwm_counter_width - 1 downto 23 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0252" then pwm_phase_delay(25 * (pwm_counter_width + 1) - 1 downto 24 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0253" then pwm_duty_request(25 * pwm_counter_width - 1 downto 24 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"025A" then pwm_phase_delay(26 * (pwm_counter_width + 1) - 1 downto 25 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"025B" then pwm_duty_request(26 * pwm_counter_width - 1 downto 25 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0262" then pwm_phase_delay(27 * (pwm_counter_width + 1) - 1 downto 26 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0263" then pwm_duty_request(27 * pwm_counter_width - 1 downto 26 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"026A" then pwm_phase_delay(28 * (pwm_counter_width + 1) - 1 downto 27 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"026B" then pwm_duty_request(28 * pwm_counter_width - 1 downto 27 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

                -- Cell 2
                if address_memory = x"0302" then pwm_phase_delay(29 * (pwm_counter_width + 1) - 1 downto 28 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0303" then pwm_duty_request(29 * pwm_counter_width - 1 downto 28 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"030A" then pwm_phase_delay(30 * (pwm_counter_width + 1) - 1 downto 29 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"030B" then pwm_duty_request(30 * pwm_counter_width - 1 downto 29 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0312" then pwm_phase_delay(31 * (pwm_counter_width + 1) - 1 downto 30 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0313" then pwm_duty_request(31 * pwm_counter_width - 1 downto 30 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"031A" then pwm_phase_delay(32 * (pwm_counter_width + 1) - 1 downto 31 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"031B" then pwm_duty_request(32 * pwm_counter_width - 1 downto 31 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0322" then pwm_phase_delay(33 * (pwm_counter_width + 1) - 1 downto 32 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0323" then pwm_duty_request(33 * pwm_counter_width - 1 downto 32 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"032A" then pwm_phase_delay(34 * (pwm_counter_width + 1) - 1 downto 33 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"032B" then pwm_duty_request(34 * pwm_counter_width - 1 downto 33 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0332" then pwm_phase_delay(35 * (pwm_counter_width + 1) - 1 downto 34 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0333" then pwm_duty_request(35 * pwm_counter_width - 1 downto 34 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"033A" then pwm_phase_delay(36 * (pwm_counter_width + 1) - 1 downto 35 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"033B" then pwm_duty_request(36 * pwm_counter_width - 1 downto 35 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0342" then pwm_phase_delay(37 * (pwm_counter_width + 1) - 1 downto 36 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0343" then pwm_duty_request(37 * pwm_counter_width - 1 downto 36 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"034A" then pwm_phase_delay(38 * (pwm_counter_width + 1) - 1 downto 37 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"034B" then pwm_duty_request(38 * pwm_counter_width - 1 downto 37 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0352" then pwm_phase_delay(39 * (pwm_counter_width + 1) - 1 downto 38 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0353" then pwm_duty_request(39 * pwm_counter_width - 1 downto 38 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"035A" then pwm_phase_delay(40 * (pwm_counter_width + 1) - 1 downto 39 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"035B" then pwm_duty_request(40 * pwm_counter_width - 1 downto 39 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0362" then pwm_phase_delay(41 * (pwm_counter_width + 1) - 1 downto 40 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"0363" then pwm_duty_request(41 * pwm_counter_width - 1 downto 40 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"036A" then pwm_phase_delay(42 * (pwm_counter_width + 1) - 1 downto 41 * (pwm_counter_width + 1)) <= unsigned(memory_in(pwm_counter_width downto 0)); end if;
                if address_memory = x"036B" then pwm_duty_request(42 * pwm_counter_width - 1 downto 41 * pwm_counter_width) <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

            end if;
        end if;
    end process;

    -- Board heater index = 14 * cell index + heater index within the cell.
    cell_0 : entity work.cell_top
        generic map (
            pwm_counter_width => pwm_counter_width
        )
        port map (
            clk              => clk,
            reset            => reset,
            global_sync      => global_sync,
            adc_sclk         => adc_sclk(0),
            adc_cs           => adc_cs(0),
            pwm_period       => pwm_period,
            pwm_phase_delay  => pwm_phase_delay(14 * (pwm_counter_width + 1) - 1 downto 0 * (pwm_counter_width + 1)),
            pwm_duty_request => pwm_duty_request(14 * pwm_counter_width - 1 downto
                                                 0 * pwm_counter_width),
            pwm              => pwm(13 downto 0),
            temp_adc_sdo     => temp_adc_sdo(13 downto 0),
            temp_adc_data    => temperature_samples(447 downto 0),
            current_adc_sdo  => current_adc_sdo(13 downto 0),
            current_adc_data => current_samples(447 downto 0),
            rtd_adc_sdo      => rtd_adc_sdo(1 downto 0),
            rtd_adc_data     => rtd_samples(63 downto 0)
        );

    cell_1 : entity work.cell_top
        generic map (
            pwm_counter_width => pwm_counter_width
        )
        port map (
            clk              => clk,
            reset            => reset,
            global_sync      => global_sync,
            adc_sclk         => adc_sclk(1),
            adc_cs           => adc_cs(1),
            pwm_period       => pwm_period,
            pwm_phase_delay  => pwm_phase_delay(28 * (pwm_counter_width + 1) - 1 downto 14 * (pwm_counter_width + 1)),
            pwm_duty_request => pwm_duty_request(28 * pwm_counter_width - 1 downto
                                                 14 * pwm_counter_width),
            pwm              => pwm(27 downto 14),
            temp_adc_sdo     => temp_adc_sdo(27 downto 14),
            temp_adc_data    => temperature_samples(895 downto 448),
            current_adc_sdo  => current_adc_sdo(27 downto 14),
            current_adc_data => current_samples(895 downto 448),
            rtd_adc_sdo      => rtd_adc_sdo(3 downto 2),
            rtd_adc_data     => rtd_samples(127 downto 64)
        );

    cell_2 : entity work.cell_top
        generic map (
            pwm_counter_width => pwm_counter_width
        )
        port map (
            clk              => clk,
            reset            => reset,
            global_sync      => global_sync,
            adc_sclk         => adc_sclk(2),
            adc_cs           => adc_cs(2),
            pwm_period       => pwm_period,
            pwm_phase_delay  => pwm_phase_delay(42 * (pwm_counter_width + 1) - 1 downto 28 * (pwm_counter_width + 1)),
            pwm_duty_request => pwm_duty_request(42 * pwm_counter_width - 1 downto
                                                 28 * pwm_counter_width),
            pwm              => pwm(41 downto 28),
            temp_adc_sdo     => temp_adc_sdo(41 downto 28),
            temp_adc_data    => temperature_samples(1343 downto 896),
            current_adc_sdo  => current_adc_sdo(41 downto 28),
            current_adc_data => current_samples(1343 downto 896),
            rtd_adc_sdo      => rtd_adc_sdo(5 downto 4),
            rtd_adc_data     => rtd_samples(191 downto 128)
        );
end architecture structural;
