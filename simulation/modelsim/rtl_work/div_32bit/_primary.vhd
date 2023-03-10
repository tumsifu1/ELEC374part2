library verilog;
use verilog.vl_types.all;
entity div_32bit is
    port(
        M               : in     vl_logic_vector(31 downto 0);
        Q               : in     vl_logic_vector(31 downto 0);
        z               : out    vl_logic_vector(63 downto 0)
    );
end div_32bit;
