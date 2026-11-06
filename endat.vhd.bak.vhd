Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity endat is
		port( 	clk, reset  : in  std_logic;
				
				global_sync: in std_logic;
				endat_position: out std_logic_vector(31 downto 0);
				
				endat_clk, endat_tx, endat_dir: out std_logic;
				testpoint : out std_logic;
				endat_rx: in std_logic
		);

end endat;

architecture beh of endat is


	signal mode_bits: std_logic_vector(5 downto 0) := "000111";
	signal command_byt: std_logic_vector(7 downto 0);
	
	type endat_state_type is (idle, modebits, waiting_for_position, positionbits, additional_tx, additional_rx, additional_crc_tx, finalizing);
	signal endat_state : endat_state_type;
	
	signal clk_counter : integer range 0 to 255;
	signal bit_counter : integer range 0 to 63;
	
	signal modebits_buffer : std_logic_vector(7 downto 0) := "11111111";
	signal byte_counter : integer range 0 to 255;
	
	signal endat_position_buf : std_logic_vector(31 downto 0);
													
	signal word_length, additional_word_length: integer range 0 to 255;
	
	signal tx_word : std_logic_vector(15 downto 0);
	
	
	signal crc_clear, crc_tick, crc_in: std_logic;
	constant crc5_polynomial: std_logic_vector(4 downto 0) := "01011";
	signal crc5, crc5_buf: std_logic_vector(4 downto 0);
	
	signal word_counter: integer range 0 to 255;
	
	signal now_reading: std_logic;
	
	constant fullbit: integer := 29;
	constant halfbit: integer := (fullbit + 1) / 2;
	
	signal additional_rx_buf: std_logic_vector(31 downto 0);
	
	signal endat_rx_buf: std_logic;

begin
				--endat_position <= x"33333333";--(others => endat_rx);
--				endat_clk <= '1';
--				endat_tx <= '1';
--				endat_dir <= '0';
				
				process(clk, reset)
				begin
					if reset = '1' then
						endat_clk <= '1';
						endat_tx <= '0';
						endat_dir <= '1';
						
						clk_counter <= 0;
						bit_counter <= 7;
						endat_state <= idle;
						
						modebits_buffer <= x"00";--"11111111";
						
						word_counter <= 0;
														
					elsif rising_edge(clk) then



						case endat_state is
						
							when idle =>
								testpoint <='0';
--								endat_clk <= '1';
								endat_tx <= '1';
								endat_dir <= '0';
								
								clk_counter <= 0;
								bit_counter <= 7;
								
								if global_sync = '1' then
									endat_clk <= '0';
									endat_state <= modebits;
--									modebits_buffer <= x"09";
--									byte_counter <= byte_counter + 1;
--									modebits_buffer <= conv_std_logic_vector(byte_counter, 8);
								else
									endat_clk <= '1';
								end if;
								
								crc_tick <= '0';
								crc_clear <= '1';
								
								case word_counter is
									when 0 =>
										modebits_buffer <= x"2A";  --Encoder receive reset
										tx_word <= x"3456";
										word_length <= 20;
										additional_word_length <= 24;
										now_reading <= '1';
									when 1 =>
										modebits_buffer <= x"0E"; -- Selection of memory area
										tx_word <= x"0A10";
										word_length <= 20;
										additional_word_length <= 24;
										now_reading <= '0';
									when 2 =>
										modebits_buffer <= x"23"; --Encoder send parameter
										tx_word <= x"1236";
										word_length <= 20;
										additional_word_length <= 24;
										now_reading <= '1';
									when 3 =>
										modebits_buffer <= x"1C";
										tx_word <= x"40007";
										word_length <= 25;
										now_reading <= '0';									
									when 4 =>
										modebits_buffer <= x"23";
										tx_word <= x"3008";
										word_length <= 30;
										additional_word_length <= 24;
										now_reading <= '0';	
									when 5 =>
										modebits_buffer <= x"31";
										tx_word <= x"3008";
										word_length <= 30;
										additional_word_length <= 24;
										now_reading <= '1';

								end case;
								
								if global_sync = '1' and word_counter = 1 then
									word_counter <= 0;
									testpoint <= '1';
								else
									testpoint <= '0';
								end if;
								
								if global_sync = '1' and word_counter /= 1 then
									word_counter <= word_counter + 1;

								end if;
								
								
						
							when modebits =>
							
								testpoint <='0';
								
								endat_dir <= '1';
								
								crc_tick <= '0';
								crc_clear <= '1';
								
								
								if clk_counter = fullbit then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
									endat_tx <= modebits_buffer(bit_counter);
								end if;
								
								if clk_counter =halfbit then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = fullbit and bit_counter /= 0 then
									bit_counter <= bit_counter - 1;
								end if;
								
								if clk_counter = fullbit and bit_counter = 0 then
									bit_counter <= 0;
									endat_state <= waiting_for_position;
								end if;
								
							when waiting_for_position =>

								testpoint <='0';

								crc_tick <= '0';
								crc_clear <= '1';
								
								
							--	if clk_counter = halfbit then
									endat_tx <= '0';
									endat_dir <= '0';
							--	end if;
							
								if clk_counter = fullbit then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter =halfbit then 
									endat_rx_buf <= endat_rx;
									endat_clk <= '1';
								end if;
								
								if clk_counter = fullbit and bit_counter /= 9 then --7
									bit_counter <= bit_counter + 1;
								end if;

								if clk_counter = fullbit and (bit_counter = 9 or (endat_rx_buf = '1' and bit_counter > 2)) then
									bit_counter <= 0;
									endat_state <= positionbits;
								end if;	
								
		
							when positionbits =>
							
								testpoint <='0';

								crc_clear <= '0';
								
								endat_tx <= '1';
								endat_dir <= '0';
							
								if clk_counter = fullbit then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter = halfbit then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = halfbit then
									endat_position_buf(bit_counter) <= endat_rx;
									crc_in <= endat_rx;
								end if;
								
								if clk_counter = halfbit and bit_counter /= 0 then
									crc_tick <= '1';
								else
									crc_tick <= '0';
								end if;
								
								if clk_counter = fullbit and bit_counter /= word_length then
									bit_counter <= bit_counter + 1;
								end if;
								
								if clk_counter = fullbit and bit_counter = word_length and now_reading = '0' then
									endat_state <= additional_tx;
									bit_counter <= word_length;
									crc_clear <= '1';
								end if;
								
								if clk_counter = fullbit and bit_counter = word_length and now_reading = '1' then
									endat_state <= additional_rx;
									bit_counter <= 0;
									crc_clear <= '1';
								end if;
								
							when additional_rx =>
		
							
								testpoint <='0';

								crc_clear <= '0';
								
								endat_tx <= '1';
								endat_dir <= '0';
							
								if clk_counter = fullbit then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter = halfbit then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = halfbit then
									additional_rx_buf(bit_counter) <= endat_rx;
									crc_in <= endat_rx;
								end if;
								
								if clk_counter = halfbit and bit_counter /= 0 then
									crc_tick <= '1';
								else
									crc_tick <= '0';
								end if;
								
								if clk_counter = fullbit and bit_counter /= additional_word_length then
									bit_counter <= bit_counter + 1;
								end if;
								
								if clk_counter = fullbit and bit_counter = additional_word_length then
									endat_state <= finalizing;
									bit_counter <= 0;
								end if;
																
							when additional_tx =>
							
								testpoint <='1';
							
								endat_dir <= '1';
								
								crc_tick <= '0';
								crc_clear <= '0';
								
								
								if clk_counter = fullbit then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
									endat_tx <= tx_word(bit_counter);
									crc_in <= tx_word(bit_counter);
									crc_tick <= '1';
								else
									crc_tick <= '0';
								end if;
								
								if clk_counter =halfbit then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = fullbit and bit_counter /= 0 then
									bit_counter <= bit_counter - 1;
								end if;
								
								if clk_counter = fullbit and bit_counter = 0 then
									bit_counter <= 5;
									endat_state <= additional_crc_tx;
									crc5_buf <= crc5;
								end if;									
							
							when additional_crc_tx =>
							
								testpoint <='0';							

								endat_dir <= '1';
								
								crc_tick <= '0';
								crc_clear <= '0';
								
								
								if clk_counter = fullbit then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
									endat_tx <= crc5_buf(bit_counter);
								end if;
								
								if clk_counter = halfbit then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = fullbit and bit_counter /= 0 then
									bit_counter <= bit_counter - 1;
								end if;
								
								if clk_counter = fullbit and bit_counter = 0 then
									bit_counter <= 0;
									endat_state <= finalizing;
								end if;		


							when finalizing =>
--								testpoint <='0';
								endat_dir <= '1';
								
								endat_position <= endat_position_buf;
								endat_state <= idle;
						end case;


						if crc_clear = '1' then
							crc5 <= "11111";
						end if;
						
						if crc_clear = '0' and crc_tick = '1' then
/*							crc5(0) <= ( (crc5_polynomial(0)) and (crc5(4) xor crc_in)) 	and ( ((not crc5_polynomial(0)) and crc_in));
							crc5(1) <= ( (crc5_polynomial(1)) and (crc5(4) xor crc5(0)) ) 	and ( ((not crc5_polynomial(1)) and crc5(0)));
							crc5(2) <= ( (crc5_polynomial(2)) and (crc5(4) xor crc5(1)) ) 	and ( ((not crc5_polynomial(0)) and crc5(1)));
							crc5(3) <= ( (crc5_polynomial(3)) and (crc5(4) xor crc5(2)) ) 	and ( ((not crc5_polynomial(0)) and crc5(2)));
							crc5(4) <= ( (crc5_polynomial(4)) and (crc5(4) xor crc5(3)) ) 	and ( ((not crc5_polynomial(0)) and crc5(3)));*/
							
							crc5(0) <= crc_in xor crc5(4);
							crc5(1) <= crc5(0) xor crc5(4);
							crc5(2) <= crc5(1);
							crc5(3) <= crc5(2) xor crc5(4);
							crc5(4) <= crc5(3);
						end if;
							


					end if;
				end process;
				
				
				


end beh;

	

/*Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity endat is
		port( 	clk, reset  : in  std_logic;
				
				global_sync: in std_logic;
				endat_position: out std_logic_vector(31 downto 0);
				
				endat_clk, endat_tx, endat_dir: out std_logic;
				endat_rx: in std_logic
		);

end endat;

architecture beh of endat is


	signal mode_bits: std_logic_vector(5 downto 0) := "000111";
	signal command_byt: std_logic_vector(7 downto 0);
	
	type endat_state_type is (idle, modebits, waiting_for_position, positionbits, after_position);
	signal endat_state : endat_state_type;
	
	signal clk_counter : integer range 0 to 255;
	signal bit_counter : integer range 0 to 63;
	
	signal modebits_buffer : std_logic_vector(7 downto 0) := "11111111";
	signal byte_counter : integer range 0 to 255;
	

begin
--				endat_position <= x"0halfbit34567";--(others => endat_rx);
--				endat_clk <= '1';
--				endat_tx <= '1';
--				endat_dir <= '0';
				
				process(clk, reset)
				begin
					if reset = '1' then
						endat_clk <= '1';
						endat_tx <= '0';
						endat_dir <= '1';
						
						clk_counter <= 0;
						bit_counter <= 7;
						endat_state <= idle;
						
						modebits_buffer <= x"1C";--"11111111";
														
					elsif rising_edge(clk) then
						case endat_state is
							when idle =>
--								endat_clk <= '1';
								endat_tx <= '1';
								endat_dir <= '0';
								
								clk_counter <= 0;
								bit_counter <= 7;
								
								if global_sync = '1' then
									endat_clk <= '0';
									endat_state <= modebits;
									modebits_buffer <= x"38";
--									byte_counter <= byte_counter + 1;
--									modebits_buffer <= conv_std_logic_vector(byte_counter, 8);
								else
									endat_clk <= '1';
								end if;
								
/*							when init =>
							
								endat_dir <= '1';
								endat_tx <= '0';
								
								if clk_counter = 19 then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter = 9 then 
									endat_clk <= '1';
								end if;
																
								if clk_counter = 19 and bit_counter /= 0 then
									endat_state <= waiting_for_position;
								end if;
								
*//*						
							when modebits =>
							
								endat_dir <= '1';
								
								if clk_counter = 19 then									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
									endat_tx <= modebits_buffer(bit_counter);
								end if;
								
								if clk_counter = 9 then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = 19 and bit_counter /= 0 then
									bit_counter <= bit_counter - 1;
								end if;
								
								if clk_counter = 19 and bit_counter = 0 then
									bit_counter <= 0;
									endat_state <= waiting_for_position;
								end if;
								
							when waiting_for_position =>

								endat_tx <= '0';
								endat_dir <= '0';
							
								if clk_counter = 19 then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter = 9 then 
									endat_clk <= '1';
								end if;
								
								if clk_counter = 19 and bit_counter /= 31 then
									bit_counter <= bit_counter + 1;
								end if;

								if clk_counter = 19 and (bit_counter = 9 or ((bit_counter > 1) and (endat_rx = '1'))) then
									bit_counter <= 0;
									endat_state <= positionbits;
								end if;				
								
							when positionbits =>
							
								endat_tx <= '1';
								endat_dir <= '0';
							
								if clk_counter = 19 then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter = 9 then 
									endat_clk <= '1';
									endat_position(bit_counter) <= endat_rx;
								end if;
								
								if clk_counter = 19 and bit_counter /= 31 then
									bit_counter <= bit_counter + 1;
								end if;
								
								if clk_counter = 19 and bit_counter = 31 then
									bit_counter <= 0;
									endat_state <= after_position;
								end if;
								
							when after_position =>
							
								endat_tx <= '1';
								endat_dir <= '0';
							
								if clk_counter = 19 then
									clk_counter <= 0;
								else
									clk_counter <= clk_counter + 1;
								end if;
								
								if clk_counter = 0 then
									endat_clk <= '0';
								end if;
								
								if clk_counter = 9 then 
									endat_clk <= '1';
--									endat_position(bit_counter) <= endat_rx;
								end if;
								
								if clk_counter = 19 and bit_counter /= 31 then
									bit_counter <= bit_counter + 1;
								end if;
								
								if clk_counter = 19 and bit_counter = 31 then
									endat_state <= idle;
								end if;
								
								

						end case;
					end if;
				end process;
				
				
				


end beh;

	*/