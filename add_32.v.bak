module add_32_bit(input [31:0]Ra,input [31:0]Rb,input wire cin, output wire[31:0] sum, output wire cout);
wire cout1;
	CLA16 CLA1(.Ra(Ra[15:0]), .Rb(Rb[15:0]), .cin(cin), .sum(sum[15:0]), .cout(cout1));
	CLA16 CLA2(.Ra(Ra[32:16]), .Rb(Rb[32:16]), .cin(cout1), .sum(sum[32:16]), .cout(cout));
endmodule



module CLA16(input wire [15:0] Ra, input wire [15:0] Rb, input wire cin, output wire [15:0] sum, output wire cout);
wire cout1,cout2,cout3;

	CLA4 CLA1(.Ra(Ra[3:0]), .Rb(Rb[3:0]), .cin(cin), .sum(sum[3:0]), .cout(cout1));
	CLA4 CLA2(.Ra(Ra[7:4]), .Rb(Rb[7:4]), .cin(cout1), .sum(sum[7:4]), .cout(cout2));				
	CLA4 CLA3(.Ra(Ra[11:8]), .Rb(Rb[11:8]), .cin(cout2), .sum(sum[11:8]), .cout(cout3));
	CLA4 CLA4(.Ra(Ra[15:12]), .Rb(Rb[15:12]), .cin(cout3), .sum(sum[15:12]), .cout(cout));
endmodule 

module CLA4(input wire [3:0] Ra, input wire [3:0] Rb, input wire cin, output wire[3:0] sum, output wire cout);

	wire g1,g2,g3,g4,p1,p2,p3,p4;
	//carry generate signals 
	assign g1 = Ra[0]&Rb[0];
	assign g2 = Ra[1]&Rb[1];
	assign g3 = Ra[2]&Rb[2];
	assign g4 = Ra[3]&Rb[3];
	//carry propagate signals
	assign p1 = Ra[0]|Rb[0];
	assign p2 = Ra[1]|Rb[1];
	assign p3 = Ra[2]|Rb[2];
	assign p4 = Ra[3]|Rb[3];
	//calculate cout 
	assign cout = g1| (p1&g2)|(p2&g3) | (p3&g4);
	
	//calculate sum
	assign sum[0]= Ra[0] ^ Rb[0]^cin;
	assign sum[1]= Ra[1] ^ Rb[1]^(p1&cin);
	assign sum[2]= Ra[2] ^ Rb[2]^(p2&cin);
	assign sum[3]= Ra[3] ^ Rb[3]^(p3&cin);
	
endmodule