library verilog;
use verilog.vl_types.all;
entity decoder_2_to_4 is
    port(
        decIn           : in     vl_logic_vector(1 downto 0);
        decOut          : out    vl_logic_vector(3 downto 0)
    );
end decoder_2_to_4;
