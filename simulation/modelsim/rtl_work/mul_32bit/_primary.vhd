library verilog;
use verilog.vl_types.all;
entity mul_32bit is
    port(
        multiplicand    : in     vl_logic_vector(31 downto 0);
        multiplier      : in     vl_logic_vector(31 downto 0);
        product         : out    vl_logic_vector(63 downto 0)
    );
end mul_32bit;
