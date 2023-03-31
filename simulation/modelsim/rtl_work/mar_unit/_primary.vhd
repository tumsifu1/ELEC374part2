library verilog;
use verilog.vl_types.all;
entity mar_unit is
    port(
        MARin           : in     vl_logic;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        \bus\           : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(8 downto 0)
    );
end mar_unit;
