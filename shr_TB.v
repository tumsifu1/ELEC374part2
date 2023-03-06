`timescale 1ns/10ps
module shr_TB;

	reg [31:0] input_a, shift_numtb, output_a;
	
	shr shr_instance(input_a, shift_numtb, shr_result);
	
	initial
		begin
		input_a <= 31'b00000000_00000000_00000000_00000000;
		shift_numtb <= 5;
		#200
			shift_numtb <= 3;
		end 
endmodule 