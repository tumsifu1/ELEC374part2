`timescale 1ns/10ps

module encoderTb;
    reg [31:0] in;
    reg [4:0] out;

    encoder encoderInstance(in, out);
    initial begin
    in = 32'b00000000000000000000000000000000;
    //s = 5'b00001
    #10
    i = 32'b00000000000000000000000000000001;
    //s = 5'b00001
    
    end 
endmodule