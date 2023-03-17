//Restoring division alg

module div_32bit (
    input [31:0] dividend, // input dividend
    input [31:0] divisor, // input divisor
    output reg[31:0] quotient // output quotient
);

reg [31:0] remainder_reg = 0; // register to hold the remainder
reg [31:0] dividend_reg, divisor_reg; // registers to hold the dividend and divisor
integer i; // loop counter

// Assign inputs to registers
always @ (dividend, divisor)
begin
    dividend_reg = dividend;
    divisor_reg = divisor;

    remainder_reg = 0;

    // Perform binary long division for 32 bits
    for (i = 0; i < 32; i = i + 1)
    begin
        // Shift remainder and dividend left by one bit(A and Q)
        remainder_reg = {remainder_reg[30:0], dividend_reg[31]}; //a
        dividend_reg = {dividend_reg[30:0], 1'b0};

        // Subtract divisor from remainder
        remainder_reg = remainder_reg - divisor_reg; //A-M

        // Check if result is 1
        if (remainder_reg[31] == 1'b1)
        begin
            // Add divisor back to remainder and set quotient bit to 0
            dividend_reg[0] = 1'b0;//Q0 = 0
            remainder_reg = remainder_reg + divisor_reg; //restore A( A = A + M)
        end
        else
        begin
            // Set quotient bit to 1
            dividend_reg[0] = 1'b1;
        end
    end

    // Assign quotient to output register
	 quotient = dividend_reg;
    
end
	
endmodule
