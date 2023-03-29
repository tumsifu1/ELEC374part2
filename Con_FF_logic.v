// This module implements a control flow logic for comparing signed values from a bus.
module ControlFlowLogic (
    input [31:0] instruction,
    input signed [31:0] bus,
    input CONin, clk,
    output out
);

// Declare internal signals
wire [3:0] control_enable;
wire eval, equal, not_equal, greater_than_or_equal, less_than;

// Instantiate a 2-to-4 decoder
decoder_2_to_4 decoder(instruction[20:19], control_enable);

// Compare bus value with 0 based on control_enable signals
assign equal = ((bus == 0) & control_enable[0]) ? 1'b1 : 1'b0;
assign not_equal = ((bus != 0) & control_enable[1]) ? 1'b1 : 1'b0;
assign greater_than_or_equal = ((bus >= 0) & control_enable[2])  ? 1'b1 : 1'b0;
assign less_than = ((bus < 0) & control_enable[3]) ? 1'b1 : 1'b0;

// Combine comparison results
assign eval = equal | not_equal | greater_than_or_equal