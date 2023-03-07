
module alu(input clk, 
            clear InPC, 
            branc_flag,
            input [31:0] A_reg, //might need to be wires
            input [31:0] B_reg,
            input [31:0] Y_reg,
            input [4:0] opcode,
            output reg [63:0] C_reg

);
    //addition is just a placeholder for the real names
    parameter Addition = 5'b, Addition = 5'b, Addition = 5'b, Addition = 5'b, Addition = 5'b,
                 Addition = 5'b, Addition = 5'b, Addition = 5'b, Addition = 5'b, Addition = 5'b,
                  Addition = 5'b, Addition = 5'b, Addition = 5'b, Addition = 5'b, Addition = 5'b;

    wire [31:0] IncPC,;//put outputs of each module
    wire [64:0]; //outputs of 64 bit modules

    always @(*)
        begin
            case(opcode)
                //put cases heres e.g addition:
            endcase 
        end

    //ALU operations should go here


endmodule