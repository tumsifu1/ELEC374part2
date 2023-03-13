library verilog;
use verilog.vl_types.all;
entity MDR is
    port(
<<<<<<< HEAD
        clear           : in     vl_logic;
        clock           : in     vl_logic;
        read            : in     vl_logic;
        MDRin           : in     vl_logic;
        Mdatain         : in     vl_logic_vector(31 downto 0);
        memOut          : out    vl_logic_vector(31 downto 0)
=======
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        MDR_read        : in     vl_logic;
        MDR_enable      : in     vl_logic;
        BusMuxOut       : in     vl_logic_vector(31 downto 0);
        MDataIn         : in     vl_logic_vector(31 downto 0);
        Q               : out    vl_logic_vector(31 downto 0)
>>>>>>> dd8851dfb0e897f992c29e931a384ed3083f210f
    );
end MDR;
