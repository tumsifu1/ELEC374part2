library verilog;
use verilog.vl_types.all;
entity MDR is
    port(
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        read            : in     vl_logic;
        MDRin           : in     vl_logic;
        Mdatain         : in     vl_logic_vector(31 downto 0);
        memOut          : out    vl_logic_vector(31 downto 0)
    );
end MDR;
