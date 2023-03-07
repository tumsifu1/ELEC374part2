module division_32bit(
    input [31:0] M,
    input [31:0] Q,
    output [63:0] z
);

    //varaibles 
    reg [31:0] A_reg, Q_reg;

    always @(*) begin 
        if(count > 0) begin
            //shift left
            A_reg = A_reg << 1;
            A_reg[0] = Q_reg[31];
            Q_reg = Q_reg << 1;

            //Subtract
            A_reg = A_reg - M;

            // A < 0?
            if(A_reg[0] < 0) begin  
                Q_reg[0] = 0;
                A_reg = A_reg + M;
            end else begin
                Q_reg[0] = 1;
            end 
            count = count - 1;
        end
    z = {Q_reg[31:0], A_reg[31:0]}; //result
				

    end 

    //
    initial begin
        A_reg = 32'b0;
        Q_reg = Q;
        count = $bits(Q); //make count the number of bits in Q
    end
endmodule