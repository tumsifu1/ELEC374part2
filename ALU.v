
module ALU(input clk, 
            input [31:0] A_reg, //might need to be wires
            input [31:0] B_reg,
            //input [31:0] Y_reg,
            input [4:0] opcode,
            output reg [63:0] C_reg

);
    //addition is just a placeholder for the real names
    parameter   Add = 5'b00011, 
                Sub = 5'b00100, 
                And = 5'b00101, 
                Or = 5'b00110,
                Shift_Right = 5'b00111,
                Shift_RightA = 5'b00100,
                Shift_Left = 5'b01001,
                Rotate_Right = 5'b01010,
                Rotate_Left = 5'b01011,
                Mul = 5'b01111,
                Div = 5'b10000,
                Negate = 5'b10001,
                Not = 5'b10010;

    wire [31:0] IncPC_out, shr_out, shl_out, lor_out, land_out,
                neg_out, not_out, add_sum, adder_cout, sub_sum,
                sub_cout, rol_out, ror_out;
    wire cin,cout;

	wire [63:0] mul_out, div_out;
// think this is all we need 

    wire [31:0] IncPC;//put outputs of each module
    
    add_32_bit adding(A_reg,B_reg,cin,add_sum,cout);
    mul_32bit multiply(A_reg,B_reg,mul_out);
    sub_32bit subtraction(A_reg,B_reg,cin,sub_out,cout);
    div_32bit division(A_reg,B_reg,div_out);
    
    always @(*)
        begin
            case(opcode)
                Add:begin
                    C_reg[31:0]<= add_sum;
                    C_reg[63:32]<= 32'd0;
                end
                Sub: begin
                    C_reg[31:0]<= sub_out;
                    C_reg[63:32]<= 32'd0;
                end
                Mul: begin
                    C_reg<= mul_out;
                end
                Div: begin
                    C_reg<= div_out;
                end
                And: begin
                    C_reg<= A_reg & B_reg;
                end
                Or: begin
                    C_reg<= A_reg | B_reg;
                end
                Shift_Right: begin
                    C_reg<= A_reg>>B_reg;
                end
                Shift_RightA: begin
                    C_reg<=A_reg>>>B_reg;
                end
                Shift_Left: begin
                    C_reg<= A_reg<<B_reg;
                end
                Rotate_Right: begin
                    C_reg<= (A_reg >> B_reg) | (A_reg << ~B_reg);
                end
                Rotate_Left: begin
                    C_reg<= (A_reg << B_reg) | (A_reg >> ~B_reg);
                end
            endcase 
        end
endmodule