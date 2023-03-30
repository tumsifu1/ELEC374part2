// This module defines a memory address register unit that contains a general register called MAR
module mar_unit(
  input wire MARin,     // Input to the general register MAR
  input wire clk,       // Clock signal
  input wire clr,       // Reset signal
  input wire [31:0] bus,   // Contents of the bus
  output [8:0] q        // Output representing the lower 9 bits of the MAR register
);
  
  wire [31:0] MAR_data_out;    // Create a wire to store the output of the MAR register

  // Instantiate a general register called MAR
  Register MAR(MARin, clk, clr, bus, MAR_data_out);

  // Assign the lower 9 bits of the MAR register output to the output q
  assign q = MAR_data_out[8:0];

endmodule