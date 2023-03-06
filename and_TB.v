`timescale 1ns/ 10ps

module and_TB;
    reg [31:0] Ra;
    reg [31:0] Rb;

    initial begin
        Ra = 32'hffff_ffff;
        Rb = 32'hffff_ffff;
        //Rz should be 32'hffff_ffff


        #10 
        Ra = 32'hffff_ffff;
        Rb = 32'h0000_0000;

        //rz should be 32'h0000_0000
    end 

endmodule