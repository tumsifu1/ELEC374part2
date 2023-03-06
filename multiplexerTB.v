`timescale 1ns/10ps

module mux32_1_tb();

  reg [31:0] i;
  reg [4:0] s;
  wire o;

  mux32_1 uut(i, s, o);

  initial begin
    //test case 1
    i = 32'h0000_0000;
    s = 5'b00000;
    #1;
    assert(o == 32'h0000_0000);

    //test case 2
    i = 32'h1234_5678;
    s = 5'b10000;
    #1;
    assert(o == 32'h1234_5678);

    //test case 3
    i = 32'h1234_5678;
    s = 5'b01000;
    #1;
    assert(o == 32'h5678_1234);
    
    //final test case
    i = 32'hffff_ffff;
    s = 5'b11111;
    #1;
    assert(o == 32'hffff_ffff);

  end
endmodule