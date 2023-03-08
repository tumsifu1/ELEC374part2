module not_tb()
    reg [31:0] Ra;
    reg [32:0] Rz;

    not_32bit(Ra,Rz);

    initial begin
        Ra = 32'hffff_ffff;
        // result should be 32'h0000_0000
        #10
        Ra = 32'h34da_7acf;
        // result should be 32'hcb25_8530
    end
endmodule