library verilog;
use verilog.vl_types.all;
entity \Register\ is
    port(
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        inputD          : in     vl_logic_vector(31 downto 0);
        enbl            : in     vl_logic;
        outputQ         : out    vl_logic_vector(31 downto 0)
    );
end \Register\;
