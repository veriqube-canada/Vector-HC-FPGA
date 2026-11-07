library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity board_top is
    generic (
        pwm_counter_width : positive range 1 to 31 := 16
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        global_sync : in std_logic;
        spi_sck : in std_logic;
        spi_mosi : in std_logic;
        spi_scs : in std_logic;
        spi_miso : out std_logic;
        cell_a_adc_sclk : out std_logic;
        cell_a_adc_cs : out std_logic;
        cell_a_temp_sdo1 : in std_logic;
        cell_a_current_sdo1 : in std_logic;
        cell_a_pwm1 : out std_logic;
        cell_a_temp_sdo2 : in std_logic;
        cell_a_current_sdo2 : in std_logic;
        cell_a_pwm2 : out std_logic;
        cell_a_temp_sdo3 : in std_logic;
        cell_a_current_sdo3 : in std_logic;
        cell_a_pwm3 : out std_logic;
        cell_a_temp_sdo4 : in std_logic;
        cell_a_current_sdo4 : in std_logic;
        cell_a_pwm4 : out std_logic;
        cell_a_temp_sdo5 : in std_logic;
        cell_a_current_sdo5 : in std_logic;
        cell_a_pwm5 : out std_logic;
        cell_a_temp_sdo6 : in std_logic;
        cell_a_current_sdo6 : in std_logic;
        cell_a_pwm6 : out std_logic;
        cell_a_temp_sdo7 : in std_logic;
        cell_a_current_sdo7 : in std_logic;
        cell_a_pwm7 : out std_logic;
        cell_a_temp_sdo8 : in std_logic;
        cell_a_current_sdo8 : in std_logic;
        cell_a_pwm8 : out std_logic;
        cell_a_temp_sdo9 : in std_logic;
        cell_a_current_sdo9 : in std_logic;
        cell_a_pwm9 : out std_logic;
        cell_a_temp_sdo10 : in std_logic;
        cell_a_current_sdo10 : in std_logic;
        cell_a_pwm10 : out std_logic;
        cell_a_temp_sdo11 : in std_logic;
        cell_a_current_sdo11 : in std_logic;
        cell_a_pwm11 : out std_logic;
        cell_a_temp_sdo12 : in std_logic;
        cell_a_current_sdo12 : in std_logic;
        cell_a_pwm12 : out std_logic;
        cell_a_temp_sdo13 : in std_logic;
        cell_a_current_sdo13 : in std_logic;
        cell_a_pwm13 : out std_logic;
        cell_a_temp_sdo14 : in std_logic;
        cell_a_current_sdo14 : in std_logic;
        cell_a_pwm14 : out std_logic;
        cell_a_rtd_sdo1 : in std_logic;
        cell_a_rtd_sdo2 : in std_logic;
        cell_b_adc_sclk : out std_logic;
        cell_b_adc_cs : out std_logic;
        cell_b_temp_sdo1 : in std_logic;
        cell_b_current_sdo1 : in std_logic;
        cell_b_pwm1 : out std_logic;
        cell_b_temp_sdo2 : in std_logic;
        cell_b_current_sdo2 : in std_logic;
        cell_b_pwm2 : out std_logic;
        cell_b_temp_sdo3 : in std_logic;
        cell_b_current_sdo3 : in std_logic;
        cell_b_pwm3 : out std_logic;
        cell_b_temp_sdo4 : in std_logic;
        cell_b_current_sdo4 : in std_logic;
        cell_b_pwm4 : out std_logic;
        cell_b_temp_sdo5 : in std_logic;
        cell_b_current_sdo5 : in std_logic;
        cell_b_pwm5 : out std_logic;
        cell_b_temp_sdo6 : in std_logic;
        cell_b_current_sdo6 : in std_logic;
        cell_b_pwm6 : out std_logic;
        cell_b_temp_sdo7 : in std_logic;
        cell_b_current_sdo7 : in std_logic;
        cell_b_pwm7 : out std_logic;
        cell_b_temp_sdo8 : in std_logic;
        cell_b_current_sdo8 : in std_logic;
        cell_b_pwm8 : out std_logic;
        cell_b_temp_sdo9 : in std_logic;
        cell_b_current_sdo9 : in std_logic;
        cell_b_pwm9 : out std_logic;
        cell_b_temp_sdo10 : in std_logic;
        cell_b_current_sdo10 : in std_logic;
        cell_b_pwm10 : out std_logic;
        cell_b_temp_sdo11 : in std_logic;
        cell_b_current_sdo11 : in std_logic;
        cell_b_pwm11 : out std_logic;
        cell_b_temp_sdo12 : in std_logic;
        cell_b_current_sdo12 : in std_logic;
        cell_b_pwm12 : out std_logic;
        cell_b_temp_sdo13 : in std_logic;
        cell_b_current_sdo13 : in std_logic;
        cell_b_pwm13 : out std_logic;
        cell_b_temp_sdo14 : in std_logic;
        cell_b_current_sdo14 : in std_logic;
        cell_b_pwm14 : out std_logic;
        cell_b_rtd_sdo1 : in std_logic;
        cell_b_rtd_sdo2 : in std_logic;
        cell_c_adc_sclk : out std_logic;
        cell_c_adc_cs : out std_logic;
        cell_c_temp_sdo1 : in std_logic;
        cell_c_current_sdo1 : in std_logic;
        cell_c_pwm1 : out std_logic;
        cell_c_temp_sdo2 : in std_logic;
        cell_c_current_sdo2 : in std_logic;
        cell_c_pwm2 : out std_logic;
        cell_c_temp_sdo3 : in std_logic;
        cell_c_current_sdo3 : in std_logic;
        cell_c_pwm3 : out std_logic;
        cell_c_temp_sdo4 : in std_logic;
        cell_c_current_sdo4 : in std_logic;
        cell_c_pwm4 : out std_logic;
        cell_c_temp_sdo5 : in std_logic;
        cell_c_current_sdo5 : in std_logic;
        cell_c_pwm5 : out std_logic;
        cell_c_temp_sdo6 : in std_logic;
        cell_c_current_sdo6 : in std_logic;
        cell_c_pwm6 : out std_logic;
        cell_c_temp_sdo7 : in std_logic;
        cell_c_current_sdo7 : in std_logic;
        cell_c_pwm7 : out std_logic;
        cell_c_temp_sdo8 : in std_logic;
        cell_c_current_sdo8 : in std_logic;
        cell_c_pwm8 : out std_logic;
        cell_c_temp_sdo9 : in std_logic;
        cell_c_current_sdo9 : in std_logic;
        cell_c_pwm9 : out std_logic;
        cell_c_temp_sdo10 : in std_logic;
        cell_c_current_sdo10 : in std_logic;
        cell_c_pwm10 : out std_logic;
        cell_c_temp_sdo11 : in std_logic;
        cell_c_current_sdo11 : in std_logic;
        cell_c_pwm11 : out std_logic;
        cell_c_temp_sdo12 : in std_logic;
        cell_c_current_sdo12 : in std_logic;
        cell_c_pwm12 : out std_logic;
        cell_c_temp_sdo13 : in std_logic;
        cell_c_current_sdo13 : in std_logic;
        cell_c_pwm13 : out std_logic;
        cell_c_temp_sdo14 : in std_logic;
        cell_c_current_sdo14 : in std_logic;
        cell_c_pwm14 : out std_logic;
        cell_c_rtd_sdo1 : in std_logic;
        cell_c_rtd_sdo2 : in std_logic
    );
end entity board_top;

architecture structural of board_top is
    constant version : std_logic_vector(31 downto 0) := x"22222222";
    signal dummy_register, mcu_settings1 : std_logic_vector(31 downto 0);
    signal memory_in, memory_out : std_logic_vector(31 downto 0);
    signal address_memory : std_logic_vector(15 downto 0);
    signal read_memory, write_memory : std_logic;
    signal pwm_period : unsigned(pwm_counter_width - 1 downto 0);

    -- Cell A
    signal cell_a_temp_sense1 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense1 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request1 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense2 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense2 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request2 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense3 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense3 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request3 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense4 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense4 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request4 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense5 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense5 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request5 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense6 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense6 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request6 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense7 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense7 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request7 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense8 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense8 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request8 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense9 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense9 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request9 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense10 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense10 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request10 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense11 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense11 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request11 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense12 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense12 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request12 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense13 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense13 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request13 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_temp_sense14 : std_logic_vector(31 downto 0);
    signal cell_a_current_sense14 : std_logic_vector(31 downto 0);
    signal cell_a_pwm_duty_request14 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_a_rtd_sense1 : std_logic_vector(31 downto 0);
    signal cell_a_rtd_sense2 : std_logic_vector(31 downto 0);

    -- Cell B
    signal cell_b_temp_sense1 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense1 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request1 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense2 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense2 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request2 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense3 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense3 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request3 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense4 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense4 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request4 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense5 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense5 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request5 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense6 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense6 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request6 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense7 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense7 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request7 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense8 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense8 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request8 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense9 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense9 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request9 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense10 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense10 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request10 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense11 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense11 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request11 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense12 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense12 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request12 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense13 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense13 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request13 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_temp_sense14 : std_logic_vector(31 downto 0);
    signal cell_b_current_sense14 : std_logic_vector(31 downto 0);
    signal cell_b_pwm_duty_request14 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_b_rtd_sense1 : std_logic_vector(31 downto 0);
    signal cell_b_rtd_sense2 : std_logic_vector(31 downto 0);

    -- Cell C
    signal cell_c_temp_sense1 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense1 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request1 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense2 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense2 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request2 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense3 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense3 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request3 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense4 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense4 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request4 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense5 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense5 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request5 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense6 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense6 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request6 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense7 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense7 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request7 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense8 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense8 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request8 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense9 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense9 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request9 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense10 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense10 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request10 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense11 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense11 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request11 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense12 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense12 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request12 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense13 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense13 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request13 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_temp_sense14 : std_logic_vector(31 downto 0);
    signal cell_c_current_sense14 : std_logic_vector(31 downto 0);
    signal cell_c_pwm_duty_request14 : unsigned(pwm_counter_width - 1 downto 0);
    signal cell_c_rtd_sense1 : std_logic_vector(31 downto 0);
    signal cell_c_rtd_sense2 : std_logic_vector(31 downto 0);
begin
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

    -- Service registers use 0x00xx. Cells A, B, and C start at 0x0100, 0x0200, and 0x0300.
    -- Heater h starts at cell base + 8 * (h - 1), using schematic numbering.
    -- Heater offset +2 is reserved. PWM duty remains at +3.
    -- RTDs are at cell base + 0x78 and + 0x79.
    process (clk, reset)
    begin
        if reset = '1' then
            memory_out <= (others => '0');
            dummy_register <= (others => '0');
            mcu_settings1 <= x"11111111";
            pwm_period <= (others => '0');
            cell_a_pwm_duty_request1 <= (others => '1');
            cell_a_pwm_duty_request2 <= (others => '1');
            cell_a_pwm_duty_request3 <= (others => '1');
            cell_a_pwm_duty_request4 <= (others => '1');
            cell_a_pwm_duty_request5 <= (others => '1');
            cell_a_pwm_duty_request6 <= (others => '1');
            cell_a_pwm_duty_request7 <= (others => '1');
            cell_a_pwm_duty_request8 <= (others => '1');
            cell_a_pwm_duty_request9 <= (others => '1');
            cell_a_pwm_duty_request10 <= (others => '1');
            cell_a_pwm_duty_request11 <= (others => '1');
            cell_a_pwm_duty_request12 <= (others => '1');
            cell_a_pwm_duty_request13 <= (others => '1');
            cell_a_pwm_duty_request14 <= (others => '1');
            cell_b_pwm_duty_request1 <= (others => '1');
            cell_b_pwm_duty_request2 <= (others => '1');
            cell_b_pwm_duty_request3 <= (others => '1');
            cell_b_pwm_duty_request4 <= (others => '1');
            cell_b_pwm_duty_request5 <= (others => '1');
            cell_b_pwm_duty_request6 <= (others => '1');
            cell_b_pwm_duty_request7 <= (others => '1');
            cell_b_pwm_duty_request8 <= (others => '1');
            cell_b_pwm_duty_request9 <= (others => '1');
            cell_b_pwm_duty_request10 <= (others => '1');
            cell_b_pwm_duty_request11 <= (others => '1');
            cell_b_pwm_duty_request12 <= (others => '1');
            cell_b_pwm_duty_request13 <= (others => '1');
            cell_b_pwm_duty_request14 <= (others => '1');
            cell_c_pwm_duty_request1 <= (others => '1');
            cell_c_pwm_duty_request2 <= (others => '1');
            cell_c_pwm_duty_request3 <= (others => '1');
            cell_c_pwm_duty_request4 <= (others => '1');
            cell_c_pwm_duty_request5 <= (others => '1');
            cell_c_pwm_duty_request6 <= (others => '1');
            cell_c_pwm_duty_request7 <= (others => '1');
            cell_c_pwm_duty_request8 <= (others => '1');
            cell_c_pwm_duty_request9 <= (others => '1');
            cell_c_pwm_duty_request10 <= (others => '1');
            cell_c_pwm_duty_request11 <= (others => '1');
            cell_c_pwm_duty_request12 <= (others => '1');
            cell_c_pwm_duty_request13 <= (others => '1');
            cell_c_pwm_duty_request14 <= (others => '1');
        elsif rising_edge(clk) then
            if read_memory = '1' then
                memory_out <= x"01234567";
                if address_memory = x"0000" then memory_out <= dummy_register; end if;
                if address_memory = x"0001" then memory_out <= mcu_settings1; end if;
                if address_memory = x"0002" then memory_out <= version; end if;
                if address_memory = x"0004" then memory_out <= std_logic_vector(resize(pwm_period, 32)); end if;

                -- Cell A
                if address_memory = x"0100" then memory_out <= cell_a_temp_sense1; end if;
                if address_memory = x"0101" then memory_out <= cell_a_current_sense1; end if;
                if address_memory = x"0103" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request1, 32)); end if;
                if address_memory = x"0108" then memory_out <= cell_a_temp_sense2; end if;
                if address_memory = x"0109" then memory_out <= cell_a_current_sense2; end if;
                if address_memory = x"010B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request2, 32)); end if;
                if address_memory = x"0110" then memory_out <= cell_a_temp_sense3; end if;
                if address_memory = x"0111" then memory_out <= cell_a_current_sense3; end if;
                if address_memory = x"0113" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request3, 32)); end if;
                if address_memory = x"0118" then memory_out <= cell_a_temp_sense4; end if;
                if address_memory = x"0119" then memory_out <= cell_a_current_sense4; end if;
                if address_memory = x"011B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request4, 32)); end if;
                if address_memory = x"0120" then memory_out <= cell_a_temp_sense5; end if;
                if address_memory = x"0121" then memory_out <= cell_a_current_sense5; end if;
                if address_memory = x"0123" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request5, 32)); end if;
                if address_memory = x"0128" then memory_out <= cell_a_temp_sense6; end if;
                if address_memory = x"0129" then memory_out <= cell_a_current_sense6; end if;
                if address_memory = x"012B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request6, 32)); end if;
                if address_memory = x"0130" then memory_out <= cell_a_temp_sense7; end if;
                if address_memory = x"0131" then memory_out <= cell_a_current_sense7; end if;
                if address_memory = x"0133" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request7, 32)); end if;
                if address_memory = x"0138" then memory_out <= cell_a_temp_sense8; end if;
                if address_memory = x"0139" then memory_out <= cell_a_current_sense8; end if;
                if address_memory = x"013B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request8, 32)); end if;
                if address_memory = x"0140" then memory_out <= cell_a_temp_sense9; end if;
                if address_memory = x"0141" then memory_out <= cell_a_current_sense9; end if;
                if address_memory = x"0143" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request9, 32)); end if;
                if address_memory = x"0148" then memory_out <= cell_a_temp_sense10; end if;
                if address_memory = x"0149" then memory_out <= cell_a_current_sense10; end if;
                if address_memory = x"014B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request10, 32)); end if;
                if address_memory = x"0150" then memory_out <= cell_a_temp_sense11; end if;
                if address_memory = x"0151" then memory_out <= cell_a_current_sense11; end if;
                if address_memory = x"0153" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request11, 32)); end if;
                if address_memory = x"0158" then memory_out <= cell_a_temp_sense12; end if;
                if address_memory = x"0159" then memory_out <= cell_a_current_sense12; end if;
                if address_memory = x"015B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request12, 32)); end if;
                if address_memory = x"0160" then memory_out <= cell_a_temp_sense13; end if;
                if address_memory = x"0161" then memory_out <= cell_a_current_sense13; end if;
                if address_memory = x"0163" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request13, 32)); end if;
                if address_memory = x"0168" then memory_out <= cell_a_temp_sense14; end if;
                if address_memory = x"0169" then memory_out <= cell_a_current_sense14; end if;
                if address_memory = x"016B" then memory_out <= std_logic_vector(resize(cell_a_pwm_duty_request14, 32)); end if;
                if address_memory = x"0178" then memory_out <= cell_a_rtd_sense1; end if;
                if address_memory = x"0179" then memory_out <= cell_a_rtd_sense2; end if;

                -- Cell B
                if address_memory = x"0200" then memory_out <= cell_b_temp_sense1; end if;
                if address_memory = x"0201" then memory_out <= cell_b_current_sense1; end if;
                if address_memory = x"0203" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request1, 32)); end if;
                if address_memory = x"0208" then memory_out <= cell_b_temp_sense2; end if;
                if address_memory = x"0209" then memory_out <= cell_b_current_sense2; end if;
                if address_memory = x"020B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request2, 32)); end if;
                if address_memory = x"0210" then memory_out <= cell_b_temp_sense3; end if;
                if address_memory = x"0211" then memory_out <= cell_b_current_sense3; end if;
                if address_memory = x"0213" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request3, 32)); end if;
                if address_memory = x"0218" then memory_out <= cell_b_temp_sense4; end if;
                if address_memory = x"0219" then memory_out <= cell_b_current_sense4; end if;
                if address_memory = x"021B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request4, 32)); end if;
                if address_memory = x"0220" then memory_out <= cell_b_temp_sense5; end if;
                if address_memory = x"0221" then memory_out <= cell_b_current_sense5; end if;
                if address_memory = x"0223" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request5, 32)); end if;
                if address_memory = x"0228" then memory_out <= cell_b_temp_sense6; end if;
                if address_memory = x"0229" then memory_out <= cell_b_current_sense6; end if;
                if address_memory = x"022B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request6, 32)); end if;
                if address_memory = x"0230" then memory_out <= cell_b_temp_sense7; end if;
                if address_memory = x"0231" then memory_out <= cell_b_current_sense7; end if;
                if address_memory = x"0233" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request7, 32)); end if;
                if address_memory = x"0238" then memory_out <= cell_b_temp_sense8; end if;
                if address_memory = x"0239" then memory_out <= cell_b_current_sense8; end if;
                if address_memory = x"023B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request8, 32)); end if;
                if address_memory = x"0240" then memory_out <= cell_b_temp_sense9; end if;
                if address_memory = x"0241" then memory_out <= cell_b_current_sense9; end if;
                if address_memory = x"0243" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request9, 32)); end if;
                if address_memory = x"0248" then memory_out <= cell_b_temp_sense10; end if;
                if address_memory = x"0249" then memory_out <= cell_b_current_sense10; end if;
                if address_memory = x"024B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request10, 32)); end if;
                if address_memory = x"0250" then memory_out <= cell_b_temp_sense11; end if;
                if address_memory = x"0251" then memory_out <= cell_b_current_sense11; end if;
                if address_memory = x"0253" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request11, 32)); end if;
                if address_memory = x"0258" then memory_out <= cell_b_temp_sense12; end if;
                if address_memory = x"0259" then memory_out <= cell_b_current_sense12; end if;
                if address_memory = x"025B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request12, 32)); end if;
                if address_memory = x"0260" then memory_out <= cell_b_temp_sense13; end if;
                if address_memory = x"0261" then memory_out <= cell_b_current_sense13; end if;
                if address_memory = x"0263" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request13, 32)); end if;
                if address_memory = x"0268" then memory_out <= cell_b_temp_sense14; end if;
                if address_memory = x"0269" then memory_out <= cell_b_current_sense14; end if;
                if address_memory = x"026B" then memory_out <= std_logic_vector(resize(cell_b_pwm_duty_request14, 32)); end if;
                if address_memory = x"0278" then memory_out <= cell_b_rtd_sense1; end if;
                if address_memory = x"0279" then memory_out <= cell_b_rtd_sense2; end if;

                -- Cell C
                if address_memory = x"0300" then memory_out <= cell_c_temp_sense1; end if;
                if address_memory = x"0301" then memory_out <= cell_c_current_sense1; end if;
                if address_memory = x"0303" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request1, 32)); end if;
                if address_memory = x"0308" then memory_out <= cell_c_temp_sense2; end if;
                if address_memory = x"0309" then memory_out <= cell_c_current_sense2; end if;
                if address_memory = x"030B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request2, 32)); end if;
                if address_memory = x"0310" then memory_out <= cell_c_temp_sense3; end if;
                if address_memory = x"0311" then memory_out <= cell_c_current_sense3; end if;
                if address_memory = x"0313" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request3, 32)); end if;
                if address_memory = x"0318" then memory_out <= cell_c_temp_sense4; end if;
                if address_memory = x"0319" then memory_out <= cell_c_current_sense4; end if;
                if address_memory = x"031B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request4, 32)); end if;
                if address_memory = x"0320" then memory_out <= cell_c_temp_sense5; end if;
                if address_memory = x"0321" then memory_out <= cell_c_current_sense5; end if;
                if address_memory = x"0323" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request5, 32)); end if;
                if address_memory = x"0328" then memory_out <= cell_c_temp_sense6; end if;
                if address_memory = x"0329" then memory_out <= cell_c_current_sense6; end if;
                if address_memory = x"032B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request6, 32)); end if;
                if address_memory = x"0330" then memory_out <= cell_c_temp_sense7; end if;
                if address_memory = x"0331" then memory_out <= cell_c_current_sense7; end if;
                if address_memory = x"0333" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request7, 32)); end if;
                if address_memory = x"0338" then memory_out <= cell_c_temp_sense8; end if;
                if address_memory = x"0339" then memory_out <= cell_c_current_sense8; end if;
                if address_memory = x"033B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request8, 32)); end if;
                if address_memory = x"0340" then memory_out <= cell_c_temp_sense9; end if;
                if address_memory = x"0341" then memory_out <= cell_c_current_sense9; end if;
                if address_memory = x"0343" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request9, 32)); end if;
                if address_memory = x"0348" then memory_out <= cell_c_temp_sense10; end if;
                if address_memory = x"0349" then memory_out <= cell_c_current_sense10; end if;
                if address_memory = x"034B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request10, 32)); end if;
                if address_memory = x"0350" then memory_out <= cell_c_temp_sense11; end if;
                if address_memory = x"0351" then memory_out <= cell_c_current_sense11; end if;
                if address_memory = x"0353" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request11, 32)); end if;
                if address_memory = x"0358" then memory_out <= cell_c_temp_sense12; end if;
                if address_memory = x"0359" then memory_out <= cell_c_current_sense12; end if;
                if address_memory = x"035B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request12, 32)); end if;
                if address_memory = x"0360" then memory_out <= cell_c_temp_sense13; end if;
                if address_memory = x"0361" then memory_out <= cell_c_current_sense13; end if;
                if address_memory = x"0363" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request13, 32)); end if;
                if address_memory = x"0368" then memory_out <= cell_c_temp_sense14; end if;
                if address_memory = x"0369" then memory_out <= cell_c_current_sense14; end if;
                if address_memory = x"036B" then memory_out <= std_logic_vector(resize(cell_c_pwm_duty_request14, 32)); end if;
                if address_memory = x"0378" then memory_out <= cell_c_rtd_sense1; end if;
                if address_memory = x"0379" then memory_out <= cell_c_rtd_sense2; end if;

            end if;

            if write_memory = '1' then
                if address_memory = x"0001" then dummy_register <= memory_in; end if;
                if address_memory = x"0002" then mcu_settings1 <= memory_in; end if;
                if address_memory = x"0004" then pwm_period <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

                -- Cell A
                if address_memory = x"0103" then cell_a_pwm_duty_request1 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"010B" then cell_a_pwm_duty_request2 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0113" then cell_a_pwm_duty_request3 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"011B" then cell_a_pwm_duty_request4 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0123" then cell_a_pwm_duty_request5 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"012B" then cell_a_pwm_duty_request6 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0133" then cell_a_pwm_duty_request7 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"013B" then cell_a_pwm_duty_request8 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0143" then cell_a_pwm_duty_request9 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"014B" then cell_a_pwm_duty_request10 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0153" then cell_a_pwm_duty_request11 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"015B" then cell_a_pwm_duty_request12 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0163" then cell_a_pwm_duty_request13 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"016B" then cell_a_pwm_duty_request14 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

                -- Cell B
                if address_memory = x"0203" then cell_b_pwm_duty_request1 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"020B" then cell_b_pwm_duty_request2 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0213" then cell_b_pwm_duty_request3 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"021B" then cell_b_pwm_duty_request4 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0223" then cell_b_pwm_duty_request5 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"022B" then cell_b_pwm_duty_request6 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0233" then cell_b_pwm_duty_request7 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"023B" then cell_b_pwm_duty_request8 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0243" then cell_b_pwm_duty_request9 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"024B" then cell_b_pwm_duty_request10 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0253" then cell_b_pwm_duty_request11 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"025B" then cell_b_pwm_duty_request12 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0263" then cell_b_pwm_duty_request13 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"026B" then cell_b_pwm_duty_request14 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

                -- Cell C
                if address_memory = x"0303" then cell_c_pwm_duty_request1 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"030B" then cell_c_pwm_duty_request2 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0313" then cell_c_pwm_duty_request3 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"031B" then cell_c_pwm_duty_request4 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0323" then cell_c_pwm_duty_request5 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"032B" then cell_c_pwm_duty_request6 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0333" then cell_c_pwm_duty_request7 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"033B" then cell_c_pwm_duty_request8 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0343" then cell_c_pwm_duty_request9 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"034B" then cell_c_pwm_duty_request10 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0353" then cell_c_pwm_duty_request11 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"035B" then cell_c_pwm_duty_request12 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"0363" then cell_c_pwm_duty_request13 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;
                if address_memory = x"036B" then cell_c_pwm_duty_request14 <= unsigned(memory_in(pwm_counter_width - 1 downto 0)); end if;

            end if;
        end if;
    end process;

    cell_a : entity work.cell_top
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk                => clk,
            reset              => reset,
            global_sync        => global_sync,
            pwm_period         => pwm_period,
            adc_sclk           => cell_a_adc_sclk,
            adc_cs             => cell_a_adc_cs,
            temp_sdo1          => cell_a_temp_sdo1,
            current_sdo1       => cell_a_current_sdo1,
            pwm1               => cell_a_pwm1,
            temp_sense1        => cell_a_temp_sense1,
            current_sense1     => cell_a_current_sense1,
            pwm_duty_request1  => cell_a_pwm_duty_request1,
            temp_sdo2          => cell_a_temp_sdo2,
            current_sdo2       => cell_a_current_sdo2,
            pwm2               => cell_a_pwm2,
            temp_sense2        => cell_a_temp_sense2,
            current_sense2     => cell_a_current_sense2,
            pwm_duty_request2  => cell_a_pwm_duty_request2,
            temp_sdo3          => cell_a_temp_sdo3,
            current_sdo3       => cell_a_current_sdo3,
            pwm3               => cell_a_pwm3,
            temp_sense3        => cell_a_temp_sense3,
            current_sense3     => cell_a_current_sense3,
            pwm_duty_request3  => cell_a_pwm_duty_request3,
            temp_sdo4          => cell_a_temp_sdo4,
            current_sdo4       => cell_a_current_sdo4,
            pwm4               => cell_a_pwm4,
            temp_sense4        => cell_a_temp_sense4,
            current_sense4     => cell_a_current_sense4,
            pwm_duty_request4  => cell_a_pwm_duty_request4,
            temp_sdo5          => cell_a_temp_sdo5,
            current_sdo5       => cell_a_current_sdo5,
            pwm5               => cell_a_pwm5,
            temp_sense5        => cell_a_temp_sense5,
            current_sense5     => cell_a_current_sense5,
            pwm_duty_request5  => cell_a_pwm_duty_request5,
            temp_sdo6          => cell_a_temp_sdo6,
            current_sdo6       => cell_a_current_sdo6,
            pwm6               => cell_a_pwm6,
            temp_sense6        => cell_a_temp_sense6,
            current_sense6     => cell_a_current_sense6,
            pwm_duty_request6  => cell_a_pwm_duty_request6,
            temp_sdo7          => cell_a_temp_sdo7,
            current_sdo7       => cell_a_current_sdo7,
            pwm7               => cell_a_pwm7,
            temp_sense7        => cell_a_temp_sense7,
            current_sense7     => cell_a_current_sense7,
            pwm_duty_request7  => cell_a_pwm_duty_request7,
            temp_sdo8          => cell_a_temp_sdo8,
            current_sdo8       => cell_a_current_sdo8,
            pwm8               => cell_a_pwm8,
            temp_sense8        => cell_a_temp_sense8,
            current_sense8     => cell_a_current_sense8,
            pwm_duty_request8  => cell_a_pwm_duty_request8,
            temp_sdo9          => cell_a_temp_sdo9,
            current_sdo9       => cell_a_current_sdo9,
            pwm9               => cell_a_pwm9,
            temp_sense9        => cell_a_temp_sense9,
            current_sense9     => cell_a_current_sense9,
            pwm_duty_request9  => cell_a_pwm_duty_request9,
            temp_sdo10         => cell_a_temp_sdo10,
            current_sdo10      => cell_a_current_sdo10,
            pwm10              => cell_a_pwm10,
            temp_sense10       => cell_a_temp_sense10,
            current_sense10    => cell_a_current_sense10,
            pwm_duty_request10 => cell_a_pwm_duty_request10,
            temp_sdo11         => cell_a_temp_sdo11,
            current_sdo11      => cell_a_current_sdo11,
            pwm11              => cell_a_pwm11,
            temp_sense11       => cell_a_temp_sense11,
            current_sense11    => cell_a_current_sense11,
            pwm_duty_request11 => cell_a_pwm_duty_request11,
            temp_sdo12         => cell_a_temp_sdo12,
            current_sdo12      => cell_a_current_sdo12,
            pwm12              => cell_a_pwm12,
            temp_sense12       => cell_a_temp_sense12,
            current_sense12    => cell_a_current_sense12,
            pwm_duty_request12 => cell_a_pwm_duty_request12,
            temp_sdo13         => cell_a_temp_sdo13,
            current_sdo13      => cell_a_current_sdo13,
            pwm13              => cell_a_pwm13,
            temp_sense13       => cell_a_temp_sense13,
            current_sense13    => cell_a_current_sense13,
            pwm_duty_request13 => cell_a_pwm_duty_request13,
            temp_sdo14         => cell_a_temp_sdo14,
            current_sdo14      => cell_a_current_sdo14,
            pwm14              => cell_a_pwm14,
            temp_sense14       => cell_a_temp_sense14,
            current_sense14    => cell_a_current_sense14,
            pwm_duty_request14 => cell_a_pwm_duty_request14,
            rtd_sdo1           => cell_a_rtd_sdo1,
            rtd_sense1         => cell_a_rtd_sense1,
            rtd_sdo2           => cell_a_rtd_sdo2,
            rtd_sense2         => cell_a_rtd_sense2
        );

    cell_b : entity work.cell_top
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk                => clk,
            reset              => reset,
            global_sync        => global_sync,
            pwm_period         => pwm_period,
            adc_sclk           => cell_b_adc_sclk,
            adc_cs             => cell_b_adc_cs,
            temp_sdo1          => cell_b_temp_sdo1,
            current_sdo1       => cell_b_current_sdo1,
            pwm1               => cell_b_pwm1,
            temp_sense1        => cell_b_temp_sense1,
            current_sense1     => cell_b_current_sense1,
            pwm_duty_request1  => cell_b_pwm_duty_request1,
            temp_sdo2          => cell_b_temp_sdo2,
            current_sdo2       => cell_b_current_sdo2,
            pwm2               => cell_b_pwm2,
            temp_sense2        => cell_b_temp_sense2,
            current_sense2     => cell_b_current_sense2,
            pwm_duty_request2  => cell_b_pwm_duty_request2,
            temp_sdo3          => cell_b_temp_sdo3,
            current_sdo3       => cell_b_current_sdo3,
            pwm3               => cell_b_pwm3,
            temp_sense3        => cell_b_temp_sense3,
            current_sense3     => cell_b_current_sense3,
            pwm_duty_request3  => cell_b_pwm_duty_request3,
            temp_sdo4          => cell_b_temp_sdo4,
            current_sdo4       => cell_b_current_sdo4,
            pwm4               => cell_b_pwm4,
            temp_sense4        => cell_b_temp_sense4,
            current_sense4     => cell_b_current_sense4,
            pwm_duty_request4  => cell_b_pwm_duty_request4,
            temp_sdo5          => cell_b_temp_sdo5,
            current_sdo5       => cell_b_current_sdo5,
            pwm5               => cell_b_pwm5,
            temp_sense5        => cell_b_temp_sense5,
            current_sense5     => cell_b_current_sense5,
            pwm_duty_request5  => cell_b_pwm_duty_request5,
            temp_sdo6          => cell_b_temp_sdo6,
            current_sdo6       => cell_b_current_sdo6,
            pwm6               => cell_b_pwm6,
            temp_sense6        => cell_b_temp_sense6,
            current_sense6     => cell_b_current_sense6,
            pwm_duty_request6  => cell_b_pwm_duty_request6,
            temp_sdo7          => cell_b_temp_sdo7,
            current_sdo7       => cell_b_current_sdo7,
            pwm7               => cell_b_pwm7,
            temp_sense7        => cell_b_temp_sense7,
            current_sense7     => cell_b_current_sense7,
            pwm_duty_request7  => cell_b_pwm_duty_request7,
            temp_sdo8          => cell_b_temp_sdo8,
            current_sdo8       => cell_b_current_sdo8,
            pwm8               => cell_b_pwm8,
            temp_sense8        => cell_b_temp_sense8,
            current_sense8     => cell_b_current_sense8,
            pwm_duty_request8  => cell_b_pwm_duty_request8,
            temp_sdo9          => cell_b_temp_sdo9,
            current_sdo9       => cell_b_current_sdo9,
            pwm9               => cell_b_pwm9,
            temp_sense9        => cell_b_temp_sense9,
            current_sense9     => cell_b_current_sense9,
            pwm_duty_request9  => cell_b_pwm_duty_request9,
            temp_sdo10         => cell_b_temp_sdo10,
            current_sdo10      => cell_b_current_sdo10,
            pwm10              => cell_b_pwm10,
            temp_sense10       => cell_b_temp_sense10,
            current_sense10    => cell_b_current_sense10,
            pwm_duty_request10 => cell_b_pwm_duty_request10,
            temp_sdo11         => cell_b_temp_sdo11,
            current_sdo11      => cell_b_current_sdo11,
            pwm11              => cell_b_pwm11,
            temp_sense11       => cell_b_temp_sense11,
            current_sense11    => cell_b_current_sense11,
            pwm_duty_request11 => cell_b_pwm_duty_request11,
            temp_sdo12         => cell_b_temp_sdo12,
            current_sdo12      => cell_b_current_sdo12,
            pwm12              => cell_b_pwm12,
            temp_sense12       => cell_b_temp_sense12,
            current_sense12    => cell_b_current_sense12,
            pwm_duty_request12 => cell_b_pwm_duty_request12,
            temp_sdo13         => cell_b_temp_sdo13,
            current_sdo13      => cell_b_current_sdo13,
            pwm13              => cell_b_pwm13,
            temp_sense13       => cell_b_temp_sense13,
            current_sense13    => cell_b_current_sense13,
            pwm_duty_request13 => cell_b_pwm_duty_request13,
            temp_sdo14         => cell_b_temp_sdo14,
            current_sdo14      => cell_b_current_sdo14,
            pwm14              => cell_b_pwm14,
            temp_sense14       => cell_b_temp_sense14,
            current_sense14    => cell_b_current_sense14,
            pwm_duty_request14 => cell_b_pwm_duty_request14,
            rtd_sdo1           => cell_b_rtd_sdo1,
            rtd_sense1         => cell_b_rtd_sense1,
            rtd_sdo2           => cell_b_rtd_sdo2,
            rtd_sense2         => cell_b_rtd_sense2
        );

    cell_c : entity work.cell_top
        generic map (pwm_counter_width => pwm_counter_width)
        port map (
            clk                => clk,
            reset              => reset,
            global_sync        => global_sync,
            pwm_period         => pwm_period,
            adc_sclk           => cell_c_adc_sclk,
            adc_cs             => cell_c_adc_cs,
            temp_sdo1          => cell_c_temp_sdo1,
            current_sdo1       => cell_c_current_sdo1,
            pwm1               => cell_c_pwm1,
            temp_sense1        => cell_c_temp_sense1,
            current_sense1     => cell_c_current_sense1,
            pwm_duty_request1  => cell_c_pwm_duty_request1,
            temp_sdo2          => cell_c_temp_sdo2,
            current_sdo2       => cell_c_current_sdo2,
            pwm2               => cell_c_pwm2,
            temp_sense2        => cell_c_temp_sense2,
            current_sense2     => cell_c_current_sense2,
            pwm_duty_request2  => cell_c_pwm_duty_request2,
            temp_sdo3          => cell_c_temp_sdo3,
            current_sdo3       => cell_c_current_sdo3,
            pwm3               => cell_c_pwm3,
            temp_sense3        => cell_c_temp_sense3,
            current_sense3     => cell_c_current_sense3,
            pwm_duty_request3  => cell_c_pwm_duty_request3,
            temp_sdo4          => cell_c_temp_sdo4,
            current_sdo4       => cell_c_current_sdo4,
            pwm4               => cell_c_pwm4,
            temp_sense4        => cell_c_temp_sense4,
            current_sense4     => cell_c_current_sense4,
            pwm_duty_request4  => cell_c_pwm_duty_request4,
            temp_sdo5          => cell_c_temp_sdo5,
            current_sdo5       => cell_c_current_sdo5,
            pwm5               => cell_c_pwm5,
            temp_sense5        => cell_c_temp_sense5,
            current_sense5     => cell_c_current_sense5,
            pwm_duty_request5  => cell_c_pwm_duty_request5,
            temp_sdo6          => cell_c_temp_sdo6,
            current_sdo6       => cell_c_current_sdo6,
            pwm6               => cell_c_pwm6,
            temp_sense6        => cell_c_temp_sense6,
            current_sense6     => cell_c_current_sense6,
            pwm_duty_request6  => cell_c_pwm_duty_request6,
            temp_sdo7          => cell_c_temp_sdo7,
            current_sdo7       => cell_c_current_sdo7,
            pwm7               => cell_c_pwm7,
            temp_sense7        => cell_c_temp_sense7,
            current_sense7     => cell_c_current_sense7,
            pwm_duty_request7  => cell_c_pwm_duty_request7,
            temp_sdo8          => cell_c_temp_sdo8,
            current_sdo8       => cell_c_current_sdo8,
            pwm8               => cell_c_pwm8,
            temp_sense8        => cell_c_temp_sense8,
            current_sense8     => cell_c_current_sense8,
            pwm_duty_request8  => cell_c_pwm_duty_request8,
            temp_sdo9          => cell_c_temp_sdo9,
            current_sdo9       => cell_c_current_sdo9,
            pwm9               => cell_c_pwm9,
            temp_sense9        => cell_c_temp_sense9,
            current_sense9     => cell_c_current_sense9,
            pwm_duty_request9  => cell_c_pwm_duty_request9,
            temp_sdo10         => cell_c_temp_sdo10,
            current_sdo10      => cell_c_current_sdo10,
            pwm10              => cell_c_pwm10,
            temp_sense10       => cell_c_temp_sense10,
            current_sense10    => cell_c_current_sense10,
            pwm_duty_request10 => cell_c_pwm_duty_request10,
            temp_sdo11         => cell_c_temp_sdo11,
            current_sdo11      => cell_c_current_sdo11,
            pwm11              => cell_c_pwm11,
            temp_sense11       => cell_c_temp_sense11,
            current_sense11    => cell_c_current_sense11,
            pwm_duty_request11 => cell_c_pwm_duty_request11,
            temp_sdo12         => cell_c_temp_sdo12,
            current_sdo12      => cell_c_current_sdo12,
            pwm12              => cell_c_pwm12,
            temp_sense12       => cell_c_temp_sense12,
            current_sense12    => cell_c_current_sense12,
            pwm_duty_request12 => cell_c_pwm_duty_request12,
            temp_sdo13         => cell_c_temp_sdo13,
            current_sdo13      => cell_c_current_sdo13,
            pwm13              => cell_c_pwm13,
            temp_sense13       => cell_c_temp_sense13,
            current_sense13    => cell_c_current_sense13,
            pwm_duty_request13 => cell_c_pwm_duty_request13,
            temp_sdo14         => cell_c_temp_sdo14,
            current_sdo14      => cell_c_current_sdo14,
            pwm14              => cell_c_pwm14,
            temp_sense14       => cell_c_temp_sense14,
            current_sense14    => cell_c_current_sense14,
            pwm_duty_request14 => cell_c_pwm_duty_request14,
            rtd_sdo1           => cell_c_rtd_sdo1,
            rtd_sense1         => cell_c_rtd_sense1,
            rtd_sdo2           => cell_c_rtd_sdo2,
            rtd_sense2         => cell_c_rtd_sense2
        );

end architecture structural;
