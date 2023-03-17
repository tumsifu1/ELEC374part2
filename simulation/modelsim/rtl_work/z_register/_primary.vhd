library verilog;
use verilog.vl_types.all;
entity z_register is
    port(
        ZIn             : in     vl_logic;
        ZLowSelect      : in     vl_logic;
        ZHighSelect     : in     vl_logic;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        D               : in     vl_logic_vector(63 downto 0);
        ZHighDataOut    : out    vl_logic_vector(31 downto 0);
        ZLowDataOut     : out    vl_logic_vector(31 downto 0)
    );
end z_register;
