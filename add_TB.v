`timescale 1ns/ 10ps

module add_TB;
    //input
    reg [31:0] Ra;
    reg [31:0] Rb;
    reg cin;

    //output
    reg [31:0] sum;
    reg cout;

    add_32_bit add_instance(Ra, Rb, cin, sum, cout);
	 
	 initial begin

    Ra = 32'h0000_0001;
    Rb = 32'h0000_0001;
    cin = 0;

    //sum == 32'h0000_0002
    //cout = 0
    
    #10;

    Ra = 32'h7fff_ffff;
    Rb = 32'h0000_0001;
    cin = 1;

    //sum = 32'h8000_0000
    //cout = 1
	 end 


endmodule