library IEEE;
use IEEE.std_logic_1164.all;

entity spi_slave is
    port (
        clk, reset : in std_logic;
        memory_in : out std_logic_vector(31 downto 0);
        memory_out : in std_logic_vector(31 downto 0);
        read_memory, write_memory : out std_logic;
        address_memory : out std_logic_vector(15 downto 0);
        spi_sck, spi_mosi, spi_scs : in std_logic;
        spi_miso : out std_logic
    );
end entity spi_slave;

architecture rtl of spi_slave is
    -- Active-low CS, idle-low SCK, MSB first.
    -- One frame: command byte (00 read, 80 write), address high, address low,
    -- then four data bytes. MISO is zero during the header and on writes.
    -- Leave at least two system clock periods between SCK edges.
    type spi_state_type is (idle, header, data_word, finished);
    signal state : spi_state_type;
    signal spi_sck_buf, spi_mosi_buf, spi_scs_buf : std_logic_vector(1 downto 0);
    signal bit_counter : natural range 0 to 31;
    signal header_shift : std_logic_vector(22 downto 0);
    signal write_shift : std_logic_vector(30 downto 0);
    signal read_data : std_logic_vector(31 downto 0);
    signal read_transaction, read_request, read_response_pending : std_logic;
begin
    read_memory <= read_request;

    process (clk, reset)
    begin
        if reset = '1' then
            state <= idle;
            spi_sck_buf <= (others => '0');
            spi_mosi_buf <= (others => '0');
            spi_scs_buf <= (others => '1');
            bit_counter <= 0;
            header_shift <= (others => '0');
            write_shift <= (others => '0');
            read_data <= (others => '0');
            read_transaction <= '0';
            read_request <= '0';
            read_response_pending <= '0';
            write_memory <= '0';
            address_memory <= (others => '0');
            memory_in <= (others => '0');
            spi_miso <= '0';
        elsif rising_edge(clk) then
            spi_sck_buf <= spi_sck_buf(0) & spi_sck;
            spi_mosi_buf <= spi_mosi_buf(0) & spi_mosi;
            spi_scs_buf <= spi_scs_buf(0) & spi_scs;
            read_response_pending <= read_request;
            read_request <= '0';
            write_memory <= '0';

            if read_response_pending = '1' then
                read_data <= memory_out;
            end if;

            if spi_scs_buf = "01" then
                state <= idle;
                spi_miso <= '0';
            else
                case state is
                    when idle =>
                        if spi_scs_buf = "10" then
                            bit_counter <= 23;
                            state <= header;
                        end if;

                    when header =>
                        if spi_sck_buf = "01" then
                            header_shift <= header_shift(21 downto 0) & spi_mosi_buf(1);
                            if bit_counter /= 0 then
                                bit_counter <= bit_counter - 1;
                            else
                                address_memory <= header_shift(14 downto 0) & spi_mosi_buf(1);
                                bit_counter <= 31;
                                case header_shift(22 downto 15) is
                                    when x"00" =>
                                        read_transaction <= '1';
                                        read_request <= '1';
                                        state <= data_word;
                                    when x"80" =>
                                        read_transaction <= '0';
                                        state <= data_word;
                                    when others =>
                                        state <= finished;
                                end case;
                            end if;
                        end if;

                    when data_word =>
                        if spi_sck_buf = "10" and read_transaction = '1' then
                            -- The first data edge can coincide with capture of the registered response.
                            if read_response_pending = '1' then
                                spi_miso <= memory_out(bit_counter);
                            else
                                spi_miso <= read_data(bit_counter);
                            end if;
                        end if;

                        if spi_sck_buf = "01" then
                            write_shift <= write_shift(29 downto 0) & spi_mosi_buf(1);
                            if bit_counter /= 0 then
                                bit_counter <= bit_counter - 1;
                            else
                                if read_transaction = '0' then
                                    memory_in <= write_shift & spi_mosi_buf(1);
                                    write_memory <= '1';
                                end if;
                                state <= finished;
                            end if;
                        end if;

                    when finished =>
                        null;
                end case;
            end if;
        end if;
    end process;
end architecture rtl;
