HOW TO IMPLEMENT DFF & FSMs

Schéma global d'architecture VHDL à respecter car ça évite tellement de bugs:

architecture truc of machin is

signal s_next_vec, s_curr_vec: std_logic_vector(4 downto 0 );
signal s_next_bit, s_curr_bit: std_logic;
-- [autres signaux & constantes & types possibles]

begin

-- transition logic
s_next_vec <= not (s_curr_vec);
s_next_bit <= s_curr_bit or s_curr_vector(0);

--synchronous reset dffs - ALWAYS THE SAME
dffs_sync: process(clock)
begin
    if (rising_edge(clock)) then
        if (reset) then
            s_curr_bit <= '0';
            s_curr_vec <= (others => '0');
        else
            s_curr_bit <= s_next_bit;
            s_curr_vec <= s_next_vec;
        end if;
    end if;
end dffs_sync;

--asynchronous reset dffs - ALWAYS THE SAME
dffs: process(clock, reset) --reset in sensibility list!
begin
    if (reset) then
        s_curr_bit <= '0';
        s_curr_vec <= (others => '0');
    else
        if (rising_edge(clock)) then
            s_curr_bit <= s_next_bit;
            s_curr_vec <= s_next_vec;
        end if;
    end if;
end dffs;

--output logic
out_vec <= s_curr_vec and s_curr_bit;
out_bit <= s_curr_bit or s_curr_vec(1);

end truc;

A noter (très important): on ne fait rien de plus, dans les dffs, qu'update les valeurs courantes


--  ----------------------------------------------
--  ----------------- Rest -----------------------

Now pourquoi ne rien faire de plus que des updates dans vos DFFs: 
Supposons qu'on dispose d'un signal unsigned s_sig qu'on veut simplement incrémenter 
puis output dans un output signal: output_here. 
On veut que nombre de ticks de clock = output_here quoi. 
Supposons qu'on dispose d'inputs clock et reset. Ce code a l'air innocent:
-- -----------------------------------------------


dff: process(clock)
begin
    if (rising_edge(clock)) then

        if (reset) then
            s_sig <= 0;
        else
            s_sig <= s_sig + 1;
        end if;

        output_here <= s_sig; --DANS le if rising_edge(clock) i.e. pas ce qu'on veut ici
    end if;
end process;

Eh ben ce code ne marche pas comme on le veut! 
Cette ligne est le problème:
output_here <= s_sig; --DANS le if rising_edge(clock)


-- -------------------------------------------
-- --------------- EXPLANATION ---------------
-- -------------------------------------------

Cette instruction est dans le process de DFF. 
Faut pas croire qu'un process c'est "séquentiel et allez hop c'est bon": ce qui est séquentiel dans un process,
ce sont les écritures vers des signaux: 
la seule garantie que vous avez c'est que la dernière ligne écrivant dans le signal s_signal_a est la seule qui compte, 
ie la dernière valeur écrite dans s_signal_a quand le programme est lu séquentiellement est la valeur de s_signal_a à la sortie. 

Cependant, il n'y a pas de "mise à jour" interne: tous les signaux mis à jour à l'intérieur du process sont mis à jour en même temps,aucun ne lit de nouvelle valeur avant d'être injecté dans un autre signal dans le process. 
(btw je croyais ça aussi jusqu'à littéralement l'avant veille de l'exam de DSD mdr)

Ainsi, le comportement de la ligne ci-dessus est celui de... 2 DFFs en chaîne! 
ainsi au tick n, output_here prendra la valeur de s_sig au tick n-1 et NON au tick n! 
Si vous ne voyez pas pourquoi 2 DFFs en chaîne auraient ce comportement, revoyez le cours/exos sur les shift registers.
