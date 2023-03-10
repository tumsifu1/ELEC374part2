module negate_32bit( input  [31:0] Ra, output wire [31:0]Rz);
		wire [31:0]not_input;
		wire cout;
		not_32bit not_op(.Ra(Ra),.Rz(not_input));
		add_32bit sum_op(.Ra(not_input),.Rb(32'd1),.cin(1'd0),.sum(Rz),.cout(cout));
endmodule


		
		