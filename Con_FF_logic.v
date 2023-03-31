// This module implements a control flow logic for comparing signed values from a bus.
module CON_FF_LOGIC (
    input [31:0] instruction,
    input signed [31:0] bus,
    input CONin, clk,
    output CONout
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
assign eval = equal | not_equal | greater_than_or_equal | less_than;

// Instantiate a synchronous flip-flop with enable and clear signals
SyncFlipFlop flip_flop(eval, clk, 1'b0, CONin, CONout);

endmodule

// This module implements a synchronous flip-flop with enable and clear signals.
module SyncFlipFlop(
    input enable, clk, clr,
    input D,
    output reg Q
);

    // Initialize the output Q to 0
    initial Q = 0;

    // Handle the flip-flop logic on the rising edge of the clock
    always @(posedge clk)
    begin
        // If the clear signal is high, set the output Q to 0
        if (clr) begin
            Q = 1'b0;
        end
        // If the enable signal is high, set the output Q to the input D
        else if (enable) begin
            Q = D;
        end
    end
endmodule