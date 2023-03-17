library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    port(
        inputOne        : in     vl_logic_vector(31 downto 0);
        inputTwo        : in     vl_logic_vector(31 downto 0);
        \signal\        : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end mux2_1;
