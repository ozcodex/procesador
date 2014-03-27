
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY instructionmemory_tb IS
END instructionmemory_tb;
 
ARCHITECTURE behavior OF instructionmemory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         clk : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          clk => clk,
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		address <= "00000000000000000000000000000001";
      wait for 100 ns;	
		address <= "00000000000000000000000000000010";
		wait for 100 ns;	
		address <= "00000000000000000000000000000011";
      wait;
   end process;

END;
