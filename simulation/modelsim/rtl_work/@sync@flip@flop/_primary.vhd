library verilog;
use verilog.vl_types.all;
entity SyncFlipFlop is
    port(
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end SyncFlipFlop;
