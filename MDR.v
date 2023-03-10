module MDR(input clear,
    input clock, 
    input read,
    input MDRin,  
    input [31:0] Mdatain,BusMuxOut,
    output [31:0] memOut);
	
	wire [31:0] D;
    mux2_1 MDmux(BusMuxOut, MdataIn, read, D);
    Register MDRegister(clr, clock, D, MDRin, memOut);

endmodule 