library verilog;
use verilog.vl_types.all;
entity select_encode is
    port(
        Gra             : in     vl_logic;
        Grb             : in     vl_logic;
        Grc             : in     vl_logic;
        Rin             : in     vl_logic;
        Rout            : in     vl_logic;
        BaOut           : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        Cdata           : out    vl_logic_vector(31 downto 0);
        cntrl_one       : out    vl_logic_vector(15 downto 0);
        cntrl_two       : out    vl_logic_vector(15 downto 0)
    );
end select_encode;
