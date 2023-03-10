library verilog;
use verilog.vl_types.all;
entity negate_32_bit is
    port(
        Ra              : in     vl_logic_vector(31 downto 0);
        Rz              : out    vl_logic_vector(31 downto 0)
    );
end negate_32_bit;
