library verilog;
use verilog.vl_types.all;
entity not_32bit is
    port(
        Ra              : in     vl_logic_vector(31 downto 0);
        Rz              : out    vl_logic_vector(31 downto 0)
    );
end not_32bit;
