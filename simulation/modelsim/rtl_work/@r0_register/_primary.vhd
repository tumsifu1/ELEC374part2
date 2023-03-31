library verilog;
use verilog.vl_types.all;
entity R0_register is
    port(
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        D               : in     vl_logic_vector(31 downto 0);
        enbl            : in     vl_logic;
        BAout           : in     vl_logic;
        Q               : out    vl_logic_vector(31 downto 0)
    );
end R0_register;
