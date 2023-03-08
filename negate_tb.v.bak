module negate_tb();
	reg[31:0] Ra;
	reg[31:0]Rz; 

	negate_32bit neg-instance(Ra,Rz);
	initial begin

		Ra = 32'h1111_1111;
        //  should be 32'hEEEE_EEEF
        #10
        Ra = 32'hEEEE_EEEF;
        //should be 32'h1111_1111
	end
endmodule