`timescale 1ns/10ps

module div_32bit_tb;

  // Inputs
  reg [31:0] dividend = 32'd100;    // Set dividend to 100
  reg [31:0] divisor = 32'd13;       // Set divisor to 3

  // Outputs
  wire [31:0] quotient;
  wire [31:0] remainder;

  // Instantiate the div_32bit module
  div_32bit dut (
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
	 .remainder(remainder)
  );

  // Stimulus
  initial begin
    // Wait for any initial setup to complete
    #10;

    // Print the inputs
    $display("Inputs:");
    $display("Dividend = %d", dividend);
    $display("Divisor = %d", divisor);

    // Wait for the division to complete
    #100;

    // Print the outputs
    $display("Outputs:");
    $display("Quotient = %d", quotient);

    // Check the result
    if (quotient == dividend/divisor) begin
      $display("Test Passed");
    end else begin
      $display("Test Failed");
    end

    // Stop the simulation
    $finish;
  end

endmodule
