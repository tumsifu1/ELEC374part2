library verilog;
use verilog.vl_types.all;
entity decoder_4_to_16 is
    port(
        decoderInput    : in     vl_logic_vector(3 downto 0);
        decoderOutput   : out    vl_logic_vector(15 downto 0)
    );
end decoder_4_to_16;
