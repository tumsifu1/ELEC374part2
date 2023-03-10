`timescale 1ns/10ps
module shr_TB;

	reg [31:0] input_a, shift_numtb, output_a;
	
	shr shr_instance(input_a, shift_numtb, shr_result);
	assign shr_result = 31'b00000000_00000000_00000000_00100010;
	initial
		begin
		
		input_a <= 31'b00000000_00000000_00000000_00100010;
		shift_numtb <= 1;
		#20
		shift_numtb <= 2;
		end 
endmodule 