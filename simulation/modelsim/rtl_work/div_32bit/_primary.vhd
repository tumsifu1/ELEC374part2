library verilog;
use verilog.vl_types.all;
entity div_32bit is
    port(
        dividend        : in     vl_logic_vector(31 downto 0);
        divisor         : in     vl_logic_vector(31 downto 0);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        quotient        : out    vl_logic_vector(31 downto 0);
        remainder       : out    vl_logic_vector(31 downto 0)
=======
        quotient        : out    vl_logic_vector(31 downto 0)
>>>>>>> 6889b348620290086cf5e8c8e14ea4fa5f240fa6
=======
        quotient        : out    vl_logic_vector(31 downto 0)
>>>>>>> 6889b348620290086cf5e8c8e14ea4fa5f240fa6
=======
        quotient        : out    vl_logic_vector(31 downto 0)
>>>>>>> 6889b348620290086cf5e8c8e14ea4fa5f240fa6
    );
end div_32bit;
