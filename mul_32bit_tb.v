

module mul_32bit_tb;

  // Declare the signals
  reg signed [31:0] a;
  reg signed [31:0] b;
  wire [32*2-1:0] z;

  // Instantiate the DUT
  mul_32bit dut(
    .a(a),
    .b(b),
    .z(z)
  );

  // Initialize the inputs
  initial begin
    a = 16;
    b = 10;
    #10 $finish;
  end

  // Print the output
  always @* begin
    $display("a = %d, b = %d, z = %d", a, b, z);
  end

endmodule