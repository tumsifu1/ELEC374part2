library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        R0in            : in     vl_logic;
        R1in            : in     vl_logic;
        R2in            : in     vl_logic;
        R3in            : in     vl_logic;
        R4in            : in     vl_logic;
        R5in            : in     vl_logic;
        R6in            : in     vl_logic;
        R7in            : in     vl_logic;
        R8in            : in     vl_logic;
        R9in            : in     vl_logic;
        R10in           : in     vl_logic;
        R11in           : in     vl_logic;
        R12in           : in     vl_logic;
        R13in           : in     vl_logic;
        R14in           : in     vl_logic;
        R15in           : in     vl_logic;
        R0out           : in     vl_logic;
        R1out           : in     vl_logic;
        R2out           : in     vl_logic;
        R3out           : in     vl_logic;
        R4out           : in     vl_logic;
        R5out           : in     vl_logic;
        R6out           : in     vl_logic;
        R7out           : in     vl_logic;
        R8out           : in     vl_logic;
        R9out           : in     vl_logic;
        R10out          : in     vl_logic;
        R11out          : in     vl_logic;
        R12out          : in     vl_logic;
        R13out          : in     vl_logic;
        R14out          : in     vl_logic;
        R15out          : in     vl_logic;
        Yout            : in     vl_logic;
        HIin            : in     vl_logic;
        Loin            : in     vl_logic;
        ZHIin           : in     vl_logic;
        ZLOin           : in     vl_logic;
        PCin            : in     vl_logic;
        MDRin           : in     vl_logic;
        MARin           : in     vl_logic;
        IRin            : in     vl_logic;
        Yin             : in     vl_logic;
        Zin             : in     vl_logic;
        HIout           : in     vl_logic;
        Loout           : in     vl_logic;
        PCout           : in     vl_logic;
        MDRout          : in     vl_logic;
        MDRread         : in     vl_logic;
        Cout            : in     vl_logic;
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        IncPC           : in     vl_logic;
        ZLowSelect      : in     vl_logic;
        ZHighSelect     : in     vl_logic;
        ZHIout          : in     vl_logic;
        ZLOout          : in     vl_logic;
        InPortout       : in     vl_logic;
        ALU_opcode      : in     vl_logic_vector(4 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0);
        R0              : out    vl_logic_vector(31 downto 0);
        R1              : out    vl_logic_vector(31 downto 0);
        R2              : out    vl_logic_vector(31 downto 0);
        R3              : out    vl_logic_vector(31 downto 0);
        R4              : out    vl_logic_vector(31 downto 0);
        R5              : out    vl_logic_vector(31 downto 0);
        R6              : out    vl_logic_vector(31 downto 0);
        R7              : out    vl_logic_vector(31 downto 0);
        R8              : out    vl_logic_vector(31 downto 0);
        R9              : out    vl_logic_vector(31 downto 0);
        R10             : out    vl_logic_vector(31 downto 0);
        R11             : out    vl_logic_vector(31 downto 0);
        R12             : out    vl_logic_vector(31 downto 0);
        R13             : out    vl_logic_vector(31 downto 0);
        R14             : out    vl_logic_vector(31 downto 0);
        R15             : out    vl_logic_vector(31 downto 0);
        HI              : out    vl_logic_vector(31 downto 0);
        LO              : out    vl_logic_vector(31 downto 0);
        Y               : out    vl_logic_vector(31 downto 0);
        ZLO             : out    vl_logic_vector(31 downto 0);
        ZHI             : out    vl_logic_vector(31 downto 0);
        Z_register      : out    vl_logic_vector(63 downto 0)
    );
end datapath;