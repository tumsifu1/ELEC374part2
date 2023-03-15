/* module mul_32bit(input signed [31:0] a, b, output[32*2-1:0] z);
	reg [2:0] cc[(32 / 2) - 1:0];
	reg [32:0] pp[(32 / 2) - 1:0];
	reg[32*2-1:0] spp[(32 / 2) - 1:0];
	

	reg [32*2-1:0] product;
	
	integer j,i;
	
	wire [32:0] inv_a;
	assign inv_a = {~a[31], ~a} +1;
	
	always @ (a or b or inv_a) 
	begin
		cc[0] = {b[1], b[0], 1'b0};
		
		for (j=1; j < (32/2); j = j+1)
			cc[j] = {b[2*j+1], b[2*j], b[2*j-1]};
			
		for (j=0; j < (32/2); j = j+1) 
		begin	
			case(cc[j])
				3'b001 : pp[j] = {a[32-1], a}; 
				3'b010 : pp[j] = {a[32-1], a};
				3'b011 : pp[j] = {a, 1'b0};
				3'b100 : pp[j] = {inv_a[32-1:0], 1'b0};
				3'b101 : pp[j] = inv_a; 
				3'b110 : pp[j] = inv_a;
				default : pp[j] = 0;
			endcase
			spp[j] = $signed(pp[j]);
			
			for (i=0 ; i<j ; i = i + 1)
				spp[j] = {spp[j], 2'b00};
		end
	
		product = spp[0];
	
		for (j=1; j < (32/2); j = j+1)
			product = product + spp[j];
	end
	assign z = product;	
endmodule
*/

module mul_32bit(input signed [31:0] multiplicand, multiplier, output[32*2-1:0] product);
	reg [2:0] column_control[(32 / 2) - 1:0]; // array to hold control bits for each column
	reg [32:0] partial_products[(32 / 2) - 1:0]; // array to hold partial products for each column
	reg[32*2-1:0] signed_partial_products[(32 / 2) - 1:0]; // array to hold signed partial products for each column

	reg [32*2-1:0] final_product; // variable to hold the final product
	
	integer j, i;
	
	wire [32:0] inverted_multiplicand; // variable to hold the inverted multiplicand
	assign inverted_multiplicand = {~multiplicand[31], ~multiplicand} +1; // invert the multiplicand using two's complement
	
	always @ (multiplicand or multiplier or inverted_multiplicand) 
	begin
		// set control bits for each column
		column_control[0] = {multiplier[1], multiplier[0], 1'b0};
		
		for (j=1; j < (32/2); j = j+1)
			column_control[j] = {multiplier[2*j+1], multiplier[2*j], multiplier[2*j-1]};
			
		// calculate partial products for each column
		for (j=0; j < (32/2); j = j+1) 
		begin	
			case(column_control[j])
				3'b001 : partial_products[j] = {multiplicand[32-1], multiplicand}; // multiplicand * 1
				3'b010 : partial_products[j] = {multiplicand[32-1], multiplicand}; // multiplicand * 2
				3'b011 : partial_products[j] = {multiplicand, 1'b0}; // multiplicand * 4
				3'b100 : partial_products[j] = {inverted_multiplicand[32-1:0], 1'b0}; // (-multiplicand) * 8
				3'b101 : partial_products[j] = inverted_multiplicand; // (-multiplicand) * 16
				3'b110 : partial_products[j] = inverted_multiplicand; // (-multiplicand) * 32
				default : partial_products[j] = 0;
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
