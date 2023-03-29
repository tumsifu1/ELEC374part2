module select_encode(
	input Gra,Grb,Grc,Rin,Rout,BaOut,
	input [31:0] instr,
	output [31:0] Cdata,
	output [31:0] cntrl_one, cntrl_two
);

	wire[3:0] ra, rb, rc, decoder_in;
	wire[15:0] decoder_out;
	assign ra = instr[26:23];
	assign rb = instr[22:19];
	assign rc = instr[18:15];
	
	// maybe add logic assigning those to the correct part of instruction register
	
	assign decoder_in = (ra&{4{Gra}})| (rb&{4{Grb}})|(rc&{4{Grc}});
	
	decoder_4_to_16 out(decoder_in,decoder_out);
	
	wire Rout_en;
	assign Rout_en = BaOut | Rout;
	assign ctrl_one = Rin ? decoder_out : 16'b0; 
	assign ctrl_two = Rout_en ? decoder_out : 16'b0; 
											
	assign Cdata = (instr[18] == 1) ? {{13{1'b1}}, instr[18:0]} : {13'b0, instr[18:0]};
											
endmodule