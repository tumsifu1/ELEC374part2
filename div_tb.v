module div_tb;

    // inputs
    reg [31:0] M;
    reg [31:0] Q;

    // outputs
    wire [63:0] z;

    // instantiate the module
    div_32bit divInst(M, Q, z);
	 assign z = 64'b0;

    initial begin
	    //z = 64'b0000000000000000000000000000000000000000000000000000000000000000;
        // initialize inputs
        M = 32'h0000_0000;
        Q = 32'h0000_0000;
        
        // wait for a few clock cycles
        #20;

        // change inputs
        M = 32'h0000_0002;
        Q = 32'h0000_0001;

        // wait for a few clock cycles
        #20;

        // change inputs again
        M = 32'h0000_0004;
        Q = 32'h0000_0002;

        // wait for a few clock cycles
        #20;

    end

endmodule