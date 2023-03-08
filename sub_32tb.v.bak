`timescale 1ns/ 10ps

module sub_32tb;
    //input
    reg [31:0] Ra;
    reg [31:0] Rb;
    wire cin;

    //output
    wire [31:0] sum;
    wire cout;

    sub_32bit sub_instance(Ra, Rb, cin, sum, cout);
	 
	 initial begin

    Ra = 32'h0000_0009;
    Rb = 32'h0000_0001;
    cin = 0;

    //sum == 32'h0000_0008
    //cout = 0
    
    #10;

    Ra = 32'hffff_ffff;
    Rb = 32'h0000_00ff;
    cin = 1;

    //sum = 32'hffff_fffe
    //cout = 1
    
	 end 


endmodule