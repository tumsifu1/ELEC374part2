

module mul_32bit_tb;

  // Declare the signals
  reg signed [31:0] multiplicand;
  reg signed [31:0] multiplier;
  wire [32*2-1:0] product;

  // Instantiate the DUT
  mul_32bit dut(
    .multiplicand(multiplicand),
    .multiplier(multiplier),
    .product(product)
  );

  // Initialize the inputs
  initial begin
	 #10; 
    multiplicand = 16;
    multiplier = 10;
    
  end

  // Print the output
  always @* begin
    $display("multiplicand = %d, multiplier = %d, product = %d", multiplicand, multiplier, product);
  end

endmodule