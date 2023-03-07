module mul_32bit(
    input wire [31:0] a,
    input wire [31:0] b,
    output reg [63:0] p
);

    wire [31:0] recoded_b;
	 integer j,i;
    // recoding the multiplier using bit-pair
    always @* begin
        for (i = 1; i < 32; i = i + 2) begin
            recoded_b[i+1] = b[i] ^ b[i+1];
            recoded_b[i] = b[i];
        end 
    end

    always @* begin
        p = {64{1'b0}};
    end
     
    // Iterate over the bits of recoded_b
    always @* begin
        for (j = 0; j < 32; j = j + 1) begin
            if (recoded_b[j] == 1'b0) begin
                p = p << 1;
            end else if (recoded_b[j] == 1'b1) begin
                p = p + {1'b0, a};
            end else if (j < 31 && recoded_b[j+1] == 1'b1) begin
                p = p - {1'b0, a};
                p = p << 1;
                p = p + {1'b0, a};
            end
        end   
    end

endmodule
