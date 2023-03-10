library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    port(
        \out\           : out    vl_logic;
        input1          : in     vl_logic;
        input0          : in     vl_logic;
        \select\        : in     vl_logic
    );
end mux2_1;
