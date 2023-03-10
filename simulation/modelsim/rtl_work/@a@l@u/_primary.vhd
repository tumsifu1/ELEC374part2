library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        Add             : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi1);
        Sub             : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        \And\           : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi1);
        \Or\            : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi0);
        Shift_Right     : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi1);
        Shift_RightA    : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        Shift_Left      : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi1);
        Rotate_Right    : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi0);
        Rotate_Left     : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi1);
        Mul             : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi1);
        Div             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi0);
        Negate          : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi1);
        \Not\           : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        A_reg           : in     vl_logic_vector(31 downto 0);
        B_reg           : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(4 downto 0);
        C_reg           : out    vl_logic_vector(63 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Add : constant is 1;
    attribute mti_svvh_generic_type of Sub : constant is 1;
    attribute mti_svvh_generic_type of \And\ : constant is 1;
    attribute mti_svvh_generic_type of \Or\ : constant is 1;
    attribute mti_svvh_generic_type of Shift_Right : constant is 1;
    attribute mti_svvh_generic_type of Shift_RightA : constant is 1;
    attribute mti_svvh_generic_type of Shift_Left : constant is 1;
    attribute mti_svvh_generic_type of Rotate_Right : constant is 1;
    attribute mti_svvh_generic_type of Rotate_Left : constant is 1;
    attribute mti_svvh_generic_type of Mul : constant is 1;
    attribute mti_svvh_generic_type of Div : constant is 1;
    attribute mti_svvh_generic_type of Negate : constant is 1;
    attribute mti_svvh_generic_type of \Not\ : constant is 1;
end ALU;
