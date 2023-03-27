//bit pair recoding booth
module mul_32bit(input signed [31:0] multiplicand, multiplier, output[32*2-1:0] product);
	reg [2:0] column_control[(32 / 2) - 1:0]; // array to hold control bits for each column (16 3 bit register)
	reg [32:0] partial_products[(32 / 2) - 1:0]; // array to hold partial products for each column
	reg[32*2-1:0] signed_partial_products[(32 / 2) - 1:0]; // array to hold signed partial products for each column

	reg [32*2-1:0] final_product; // variable to hold the final product
	
	integer j, i; //iterator
	
	wire [32:0] inverted_multiplicand; // variable to hold the inverted multiplicand
	assign inverted_multiplicand = {~multiplicand[31], ~multiplicand} +1; // invert the multiplicand using two's complement
	
	always @ (multiplicand or multiplier or inverted_multiplicand) //if any change do the function
	begin
		// initialize
		column_control[0] = {multiplier[1], multiplier[0], 1'b0};
		
		for (j=1; j < (32/2); j = j+1)
			column_control[j] = {multiplier[2*j+1], multiplier[2*j], multiplier[2*j-1]};
			
		// calculate partial products for each column
		for (j=0; j < (32/2); j = j+1) 
		begin	
			case(column_control[j])
				3'b001 : partial_products[j] = {multiplicand[32-1], multiplicand}; // multiplicand * 1 ( 1+0+0)
				3'b010 : partial_products[j] = {multiplicand[32-1], multiplicand}; // multiplicand * 1
				3'b011 : partial_products[j] = {multiplicand, 1'b0}; // multiplicand * 2 same as adding 0
				3'b100 : partial_products[j] = {inverted_multiplicand[32-1:0], 1'b0}; // -2 * multiplicnd
				3'b101 : partial_products[j] = inverted_multiplicand; // (-multiplicand) * -1
				3'b110 : partial_products[j] = inverted_multiplicand; // (-multiplicand) * -1
				3'b111 : partial_products[j] = 0; // (multiplicand) * 0
				default : partial_products[j] = 0; // 0
			endcase
			signed_partial_products[j] = $signed(partial_products[j]); // convert partial products to signed numbers
			
			// shift partial products by the appropriate amount
			for (i=0 ; i<j ; i = i + 1)
				signed_partial_products[j] = {signed_partial_products[j], 2'b00};
		end
	
		final_product = signed_partial_products[0]; // initialize final product to the first partial product
	
		// add up all the partial products to get the final product
		for (j=1; j < (32/2); j = j+1)
			final_product = final_product + signed_partial_products[j];
	end
	
	assign product = final_product; // assign the final product to the output
endmodule
