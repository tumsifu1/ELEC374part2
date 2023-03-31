library verilog;
use verilog.vl_types.all;
entity CON_FF_LOGIC is
    port(
        Intr            : in     vl_logic_vector(31 downto 0);
        \bus\           : in     vl_logic_vector(31 downto 0);
        CONin           : in     vl_logic;
        clk             : in     vl_logic;
        CONout          : out    vl_logic
    );
end CON_FF_LOGIC;
