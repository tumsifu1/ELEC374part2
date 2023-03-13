library verilog;
use verilog.vl_types.all;
entity mux32_1 is
    port(
        i               : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(4 downto 0);
        o               : out    vl_logic
    );
end mux32_1;
