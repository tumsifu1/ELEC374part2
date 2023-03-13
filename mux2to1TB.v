`timescale 1ns/10ps
module mux2to1TB;

  // Parameters
  parameter WIDTH = 32;
  
  // Inputs
  reg [WIDTH-1:0] inputOne;
  reg [WIDTH-1:0] inputTwo;
  reg signal;
  
  // Outputs
  wire [WIDTH-1:0] out;
  
  // Instantiate the DUT
  mux2_1 dut(
    .inputOne(inputOne),
    .inputTwo(inputTwo),
    .signal(signal),
    .out(out)
  );
  
  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;
  
  // Test vectors
  initial begin
    // Test case 1
	 #10
    inputOne = 32'h00000001;
    inputTwo = 32'h00000002;
    signal = 0;
    #20;
    if (out != inputOne) $display("Test case 1 failed");
    
    // Test case 2
    inputOne = 32'h00000001;
    inputTwo = 32'h00000002;
    signal = 1;
    #30;
    if (out != inputTwo) $display("Test case 2 failed");
    
    // Test case 3
    inputOne = 32'h7FFFFFFF;
    inputTwo = 32'h80000000;
    signal = 0;
    #40;
    if (out != inputOne) $display("Test case 3 failed");
    
    // Test case 4
    inputOne = 32'h7FFFFFFF;
    inputTwo = 32'h80000000;
    signal = 1;
    #50;
    if (out != inputTwo) $display("Test case 4 failed");
    
    // Add more test cases here...
  end
  
endmodule
