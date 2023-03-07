`timescale 1ns/10ps
module MDR_TB;

    //input 
    reg clock;
    reg read;
    reg [31:0] MDRin;
    reg [31:0] BusMuxOut;
    reg [31:0] MdataIn;

    //output
    wire [31:0] memOut;

    //instance of MDR
    MDR mdrInstance(clear, clock, read, MDRin, BusMuxOut, MdataIn, memOut);

    initial begin
        clock = 0;
        clear = 0;
        read = 0;
        MDRin = 0;
        BusMuxOut = 0;
        MdataIn = 0;

        #10 clear = 1;
        #10 clear = 0;
        
        #10 MDRin = 32'h12345678;
        #10 BusMuxOut = 32'h87654321;
        #10 Mdatain = 32'habcdef01;
        #10 read = 1;
        #10 read = 0;
        
        #10 MDRin = 32'hdeadbeef;
        #10 BusMuxOut = 32'h01234567;
        #10 Mdatain = 32'hfedcba98;
        #10 read = 1;
        #10 read = 0;
        
        #10 $finish;
    end

    // Add clock signal
    always #5 clock = ~clock;

endmodule