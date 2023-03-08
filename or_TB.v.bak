`timescale 1ns/ 10ps

module or_TB;
    reg [31:0] Ra;
    reg [31:0] Rb;
    reg [31:0] Rz;

    or_32bit add_instance(Ra,Rb,Rz)
    initial begin
        Ra = 32'hffff_ffff;
        Rb = 32'hffff_ffff;
        //Rz should be 32'hffff_ffff


        #10 
        Ra = 32'hffff_fff0;
        Rb = 32'h0000_0000;

        //rz should be 32'hffff_fff0
    end 

endmodule