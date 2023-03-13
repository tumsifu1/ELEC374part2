module MDR(
input clk, clr, MDR_read, MDR_enable,
input [31:0] BusMuxOut, MDataIn,  //BusMuxOut is from bus, MDataIn is from memory chip
output wire [31:0] Q
);

wire [31:0] S; //connects the 2_to_1 multiplexer to the register

mux2_1 my_MDR_Multiplexer(
	.inputOne(BusMuxOut),
	.inputTwo(MDataIn),
	.signal(MDR_read),
	.out(S)
);

Register MDRregister(clr,clk,S,MDR_enable,Q);

endmodule