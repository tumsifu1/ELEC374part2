module MDR(input clear,
    input clock, 
    input read,
    input MDRin,  
    input [31:0] Mdatain, 
    output [31:0] memOut);
	
	 wire [31:0] BusMuxOut;
    wire [31:0] regOut;
    mux2_1 MDmux(BusMuxOut, BusMuxIn, Mdatain, read);
    register MDRegister(clr, clock, BusMuxOut, MDRin, regOut);

    assign memOut = regOut;
    
endmodule 