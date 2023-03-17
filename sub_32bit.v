module sub_32bit(input  [31:0] Ra, input  [31:0] Rb, input wire cin, output wire [31:0] sum, output wire cout);
	wire [31:0]negative_Rb;

	add_32_bit negative_sum(.Ra(Ra), .Rb(~Rb+1), .cin(cin), .sum(sum),.cout(cout)); //negate Rb in the function using 2's comp
endmodule