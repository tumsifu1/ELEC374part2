library verilog;
use verilog.vl_types.all;
entity add_32_bit is
    port(
        Ra              : in     vl_logic_vector(31 downto 0);
        Rb              : in     vl_logic_vector(31 downto 0);
        cin             : in     vl_logic;
        sum             : out    vl_logic_vector(31 downto 0);
        cout            : out    vl_logic
    );
end add_32_bit;
