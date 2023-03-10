module div_32bit(
    input [31:0] M,
    input [31:0] Q,
    output [63:0] z
);

    reg [31:0] A_reg, Q_reg;
    integer count;

    initial begin
        A_reg = 32'b0; // initialize A_reg to zero
        Q_reg = Q;
        count = 32; // initialize count to number of bits in Q
    end

    always @(*) begin
        if (count > 0) begin
            // shift left
            A_reg = A_reg << 1;
            A_reg[0] = Q_reg[31];
            Q_reg = Q_reg << 1;

            // subtract
            A_reg = A_reg - M;

            // A < 0?
            if (A_reg[31] == 1) begin
                Q_reg[0] = 0;
                A_reg = A_reg + M;
            end else begin
                Q_reg[0] = 1;
            end

            count = count - 1;
        end
    end

    assign z = {Q_reg[31:0], A_reg[31:0]};
endmodule