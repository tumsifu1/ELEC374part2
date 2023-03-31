module R0_register(
    input clr,
    input clk,
    input	[31:0]D,
	input enbl,
    input BAout,
	output reg [31:0]Q
);

  // Create a 32-bit register called "temp"
  reg [31:0] temp;

  // Initialize the output Q to 0
  initial Q = 0;

  // just the register code
  always @(posedge clk) begin
    if (clr) begin
      temp <= 32'b0;
    end else if (enbl) begin
      temp <= D;
    end

    // Compute the output by ANDing the contents of complement BAout and temp
    Q <= temp & ~{32{BAout}};
  end

endmodule