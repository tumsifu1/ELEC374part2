module mul_tb;
    reg [31:0] a;
    reg[31:0] b;
    reg [63:0] p;

    mul_32bit mulInstance(a,b,p);

    initial begin
    a= 32'h123f_4231;
    b= 32'hee3f_4ef1;
    // p should be 64'h7bfa_16d9_c7c1_1c1
    #10;

    a= 32'hffff_ffff;
    b= 32'hffff_ffff;
    // p should be 64'h0000_0000_0001_ffff
    #10;
    end
endmodule