Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


	
Entity EncoderTop is
-- ---------------------------
		port( 	clki, interrupt  : in  std_logic;
				
				spi_sck, spi_mosi, spi_scs: in std_logic;
				spi_miso: out std_logic;
				
				adc_sclk, adc_cs: out std_logic;
				adc_sdo: in std_logic;
				
				led6, led7: inout std_logic;
				spare1, spare2, spare3, spare4, spare5, spare6: inout std_logic
		);
		
			
End entity EncoderTop;

architecture beh of EncoderTop is


	signal version: std_logic_vector(31 downto 0) := x"22222222";

	signal global_sync: std_logic;
	signal reset, clk: std_logic := '0';
	signal reset_counter_usec: integer range 0 to 255 := 0;
	signal reset_counter: integer range 0 to 1023 := 0;
	signal adc_data: std_logic_vector(31 downto 0);
	signal mcu_settings1: std_logic_vector(31 downto 0) := x"11111111";
	signal interrupt_buf: std_logic_vector(1 downto 0);
	
	
	signal memory_in, memory_out, memory_out_buf, dummy_register: std_logic_vector(31 downto 0);
	signal address_memory: std_logic_vector(15 downto 0);
	signal read_memory, write_memory: std_logic;
	
	signal usec_interrupt_counter: integer range 0 to 255;
	signal interrupt_counter: integer range 0 to 2**16 - 1;

	component adc_read is
		port(	clk, reset: in std_logic;
				global_sync: in std_logic;
				adc_sclk, adc_cs: out std_logic;
				adc_sdo: in std_logic;
				adc_data: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component spi_slave is
		port( 	clk, reset  : in  std_logic;				
		
		
				memory_in: out std_logic_vector(31 downto 0);
				memory_out: in std_logic_vector(31 downto 0);
				
				read_memory: out std_logic;
				write_memory: out std_logic;
				address_memory: out std_logic_vector(15 downto 0);
				
				spi_sck, spi_mosi, spi_scs: in std_logic;
				spi_miso: out std_logic
		);
	end component;
	
	component pll is
		port (
			CLKI: in  std_logic; 
			CLKOP: out  std_logic);
		end component;


begin 

	pll1: pll port map(
		clki	=> clki,
		clkop	=> clk
	);

	spi1: spi_slave port map(
		clk 			=> clk,
		reset 			=> reset,

		memory_in		=> memory_in,
		memory_out		=> memory_out,
		
		read_memory		=> read_memory,
		write_memory	=> write_memory,
		address_memory	=> address_memory,
		
		spi_sck			=> spi_sck,
		spi_mosi		=> spi_mosi,
		spi_miso		=> spi_miso,
		spi_scs			=> spi_scs

	
	);

	adc1: adc_read port map(
		clk				=> clk,
		reset			=> reset,
		global_sync		=> global_sync,
		adc_sclk		=> adc_sclk,
		adc_cs			=> adc_cs,
		adc_sdo			=> adc_sdo,
		adc_data		=> adc_data
	);

--	led6 <= interrupt;
	led7 <= adc_sdo;
	spare6 <= spi_scs;

	process (reset,clk)

		begin
--			if reset='1' then


			if rising_edge(clk) then
				if reset_counter < 99 then
					reset <= '1';
					if reset_counter_usec = 99 then
						reset_counter_usec <= 0;
						reset_counter <= reset_counter + 1;
					else
						reset_counter_usec <= reset_counter_usec + 1;
					end if;
				else
					reset <= '0';
				end if;
			end if;
		end process;
		
	process (reset, clk)
		begin
			if reset = '1' then
				usec_interrupt_counter <= 0;
				interrupt_counter <= 0;
				global_sync <= '0';
			elsif rising_edge(clk) then
			
				interrupt_buf(0) <= interrupt;
				interrupt_buf(1) <= interrupt_buf(0);
				
				if (usec_interrupt_counter = 99 and interrupt_counter = 999) or (interrupt_buf = "10") then
					usec_interrupt_counter <= 0;
					interrupt_counter <= 0;
					
					global_sync <= '1';
				else
					global_sync <= '0';
				end if;
				
				if usec_interrupt_counter = 99 and interrupt_counter /= 999 and interrupt_buf /= "10" then
					usec_interrupt_counter <= 0;
					interrupt_counter <= interrupt_counter + 1;
					
					global_sync <= '0';
				end if;
				
				if usec_interrupt_counter /= 99 and interrupt_buf /= "10" then
					usec_interrupt_counter <= usec_interrupt_counter + 1;
					
					global_sync <= '0';
				end if;
				
				
			end if;
		end process;
		
				
	process (reset, clk)
		begin
			if reset = '1' then
				memory_out <= (others => '0');
				led6 <= '0';
			elsif rising_edge(clk) then
			
				memory_out <= memory_out_buf;
			
				if global_sync = '1' then
					led6 <= not led6;
				end if;
				
				if write_memory = '1' and address_memory = x"0001" then dummy_register 	<= memory_in; end if;
				if write_memory = '1' and address_memory = x"0002" then mcu_settings1 	<= memory_in; end if;
			end if;
			
		end process;


	memory_out_buf <=
					dummy_register						when (read_memory = '1' and address_memory = x"0000") else
					mcu_settings1 						when (read_memory = '1' and address_memory = x"0001") else
					version								when (read_memory = '1' and address_memory = x"0002") else
					
					adc_data when (read_memory = '1' and address_memory = x"0003") else
					x"01234567"							when (read_memory = '1');
	



end beh;
