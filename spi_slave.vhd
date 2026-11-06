Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;



entity spi_slave is
		port( 	clk, reset  : in  std_logic;				
		
				memory_in: out std_logic_vector(31 downto 0);
				memory_out: in std_logic_vector(31 downto 0);
				
				read_memory: out std_logic;
				write_memory: out std_logic;
				address_memory: out std_logic_vector(7 downto 0);
								
				spi_sck, spi_mosi, spi_scs: in std_logic;
				spi_miso: out std_logic
		);
end spi_slave;
	
architecture beh of spi_slave is

	signal spi_sck_buf, spi_mosi_buf, spi_scs_buf: std_logic_vector(1 downto 0);
	signal bit_counter: integer range 0 to 63;
	
	type spi_state_type is (idle, command_byte, data_word, finishing);
	signal spi_state: spi_state_type;
	
	signal command_byte_buf: std_logic_vector(7 downto 0);
	signal data_word_buf: std_logic_vector(39 downto 0);
	
	signal spi_miso_buf: std_logic;
	signal test_word: std_logic_vector(39 downto 0):= x"00AAAA0000";

begin

	spi_miso <= spi_miso_buf;
	


	process(clk, reset)
	begin
		if reset = '1' then
			spi_state <= idle;
			bit_counter <= 0;
			spi_miso_buf <= '0';
			write_memory <= '0';
			read_memory <= '0';
			command_byte_buf <= x"00";
			
			address_memory <= x"0000";
			
		elsif rising_edge(clk) then
		
			spi_sck_buf(0) <= spi_sck;
			spi_mosi_buf(0) <= spi_mosi;
			spi_scs_buf(0) <= spi_scs;
						
			spi_sck_buf(1) <= spi_sck_buf(0);
			spi_mosi_buf(1) <= spi_mosi_buf(0);
			spi_scs_buf(1) <= spi_scs_buf(0);
			
			
			case spi_state is
				when idle =>
					
					spi_miso_buf <= '0';
					bit_counter <= 7;
					
					if spi_scs_buf = "10" then
						spi_state <= command_byte;
					end if;
					
					write_memory <= '0';
					read_memory <= '0';

				when command_byte =>
					
					if spi_sck_buf="10" then
						spi_miso_buf <= '1';
					end if;
					
					if spi_sck_buf = "01" then
						command_byte_buf(bit_counter) <= spi_mosi_buf(1);
					end if;
					
					if bit_counter /= 0 and spi_sck_buf = "01" then
						bit_counter <= bit_counter - 1;
					end if;
					
					if bit_counter = 0 and spi_sck_buf = "01" then
						bit_counter <= 39;
						spi_state <= data_word;
						
						address_memory <= "0" & command_byte_buf(6 downto 0);
						test_word <= command_byte_buf & memory_out;						
					end if;

					if bit_counter = 0 and spi_sck_buf = "01" and command_byte_buf(7) = '0' then
						read_memory <= '1';
					end if;
					
					if spi_scs_buf = "01" then
						spi_state <= idle;
					end if;
					
					
				when data_word =>

					read_memory <= '0';
							
					if spi_sck_buf="10" then
						spi_miso_buf <= test_word(bit_counter);
					end if;
					
					if spi_sck_buf = "01" then
						data_word_buf(bit_counter) <= spi_mosi_buf(1);
					end if;
					
					if bit_counter /= 0 and spi_sck_buf = "01" then
						bit_counter <= bit_counter - 1;
					end if;
					
					if bit_counter = 0 and spi_sck_buf = "01" then
						spi_state <= finishing;
					end if;

					if bit_counter = 0 and spi_sck_buf = "01" and command_byte_buf(7) = '1' then
						write_memory <= '1';
						memory_in <= data_word_buf(39 downto 8);
					end if;

					if spi_scs_buf = "01" then
						spi_state <= idle;
					end if;
														
				when finishing =>
						write_memory <= '0';
						spi_state <= idle;

			end case;			
			
		end if;
	end process;

end beh;
