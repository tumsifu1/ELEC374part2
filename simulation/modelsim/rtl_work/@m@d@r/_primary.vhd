library verilog;
use verilog.vl_types.all;
entity MDR is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        MDR_read        : in     vl_logic;
        MDR_enable      : in     vl_logic;
        BusMuxOut       : in     vl_logic_vector(31 downto 0);
        MDataIn         : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
    );
end MDR;
