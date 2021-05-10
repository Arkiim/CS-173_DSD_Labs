LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY TFF_SR IS
   PORT ( 
					clock   : IN  std_logic;
          reset   : IN  std_logic;
          T       : IN  std_logic;
          LED     : OUT std_logic );
END TFF_SR;
