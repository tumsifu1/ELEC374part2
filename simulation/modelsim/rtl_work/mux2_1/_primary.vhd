library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    port(
<<<<<<< HEAD
        \out\           : out    vl_logic;
        input1          : in     vl_logic;
        input0          : in     vl_logic;
        \select\        : in     vl_logic
=======
        inputOne        : in     vl_logic_vector(31 downto 0);
        inputTwo        : in     vl_logic_vector(31 downto 0);
        \signal\        : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
>>>>>>> dd8851dfb0e897f992c29e931a384ed3083f210f
    );
end mux2_1;
