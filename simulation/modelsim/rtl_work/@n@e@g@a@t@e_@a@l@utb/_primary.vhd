library verilog;
use verilog.vl_types.all;
<<<<<<<< HEAD:simulation/modelsim/rtl_work/@n@o@t_@a@l@utb/_primary.vhd
entity NOT_ALUtb is
========
entity NEGATE_ALUtb is
>>>>>>>> 30867ceee1f31f70d3d422537c0a53b0c2a3b547:simulation/modelsim/rtl_work/@n@e@g@a@t@e_@a@l@utb/_primary.vhd
    generic(
        Default         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        Reg_load1a      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        Reg_load1b      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        Reg_load2a      : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        Reg_load2b      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        Reg_load3a      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        Reg_load3b      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        T0              : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        T1              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        T2              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        T3              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        T4              : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi1);
        T5              : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Default : constant is 1;
    attribute mti_svvh_generic_type of Reg_load1a : constant is 1;
    attribute mti_svvh_generic_type of Reg_load1b : constant is 1;
    attribute mti_svvh_generic_type of Reg_load2a : constant is 1;
    attribute mti_svvh_generic_type of Reg_load2b : constant is 1;
    attribute mti_svvh_generic_type of Reg_load3a : constant is 1;
    attribute mti_svvh_generic_type of Reg_load3b : constant is 1;
    attribute mti_svvh_generic_type of T0 : constant is 1;
    attribute mti_svvh_generic_type of T1 : constant is 1;
    attribute mti_svvh_generic_type of T2 : constant is 1;
    attribute mti_svvh_generic_type of T3 : constant is 1;
    attribute mti_svvh_generic_type of T4 : constant is 1;
    attribute mti_svvh_generic_type of T5 : constant is 1;
<<<<<<<< HEAD:simulation/modelsim/rtl_work/@n@o@t_@a@l@utb/_primary.vhd
end NOT_ALUtb;
========
end NEGATE_ALUtb;
>>>>>>>> 30867ceee1f31f70d3d422537c0a53b0c2a3b547:simulation/modelsim/rtl_work/@n@e@g@a@t@e_@a@l@utb/_primary.vhd
