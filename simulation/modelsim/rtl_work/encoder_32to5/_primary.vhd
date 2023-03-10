library verilog;
use verilog.vl_types.all;
entity encoder_32to5 is
    port(
        R0Out           : in     vl_logic;
        R1Out           : in     vl_logic;
        R2Out           : in     vl_logic;
        R3Out           : in     vl_logic;
        R4Out           : in     vl_logic;
        R5Out           : in     vl_logic;
        R6Out           : in     vl_logic;
        R7Out           : in     vl_logic;
        R8Out           : in     vl_logic;
        R9Out           : in     vl_logic;
        R10Out          : in     vl_logic;
        R11Out          : in     vl_logic;
        R12Out          : in     vl_logic;
        R13Out          : in     vl_logic;
        R14Out          : in     vl_logic;
        R15Out          : in     vl_logic;
        HIOut           : in     vl_logic;
        LOOut           : in     vl_logic;
        ZHIOut          : in     vl_logic;
        ZLOOut          : in     vl_logic;
        PCOut           : in     vl_logic;
        MDROut          : in     vl_logic;
        InportOut       : in     vl_logic;
        COut            : in     vl_logic;
        Yout            : out    vl_logic_vector(4 downto 0)
    );
end encoder_32to5;
