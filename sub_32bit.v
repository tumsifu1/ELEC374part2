module sub_32bit(input  [31:0] Ra, input  [31:0] Rb, input wire cin, output wire [31:0] sum, output wire cout);
	wire [31:0]negative_Rb;
	negate negative(.Ra(Rb),.Rz(negative_Rb));
	add_32bit negative_sum(.Ra(Ra), .Rb(negative_Rb), .cin(cin),.cout(cout));
endmodule