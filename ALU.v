

module ALU(
	input clk, clr, IncPC, branch_flag,
	input wire [31:0] A_reg,
	input wire [31:0] B_reg,
	input wire [31:0] Y_reg,

	input wire [4:0] opcode,

	output reg [63:0] C_reg 
);

/*module ALU(input clk, 
            input [31:0] A_reg, //might need to be wires
            input [31:0] B_reg,
            input [31:0] Y_reg,
            input [4:0] opcode,
            output reg [63:0] C_reg

);*/
    //addition is just a placeholder for the real names
parameter Add = 5'b00011, 
          Sub = 5'b00100, 
          And = 5'b00101, 
          Or = 5'b00110,
          Shift_Right = 5'b00111,
          Shift_RightA = 5'b01000,
          Shift_Left = 5'b01001,
          Rotate_Right = 5'b01010,
          Rotate_Left = 5'b01011,
          Addi = 5'b01100,
          Andi = 5'b01101,
          Ori = 5'b01110,
          Mul = 5'b01111,
          Div = 5'b10000,
          Negate = 5'b10001,
          Not = 5'b10010,
          Brzr = 5'b1001100,
          Brnz = 5'b1001101,
          Brmi = 5'b1001110,
          Brpl = 5'b1001111,
          Jr = 5'b10100,
          Jal = 5'b10101,
          In = 5'b10110,
          Out = 5'b10111,
          Mfhi = 5'b11000,
          Mflo = 5'b11001,
          Nop = 5'b11010,
          Halt = 5'b11011,
          ld = 5'b00000,
          ldi = 5'b00001,
			 st = 5'b00010;
    wire [31:0] IncPC_out, shr_out, shl_out, lor_out, land_out, //where is there IncPcout
                neg_out, not_out, add_sum, adder_cout, sub_sum,
                sub_cout, rol_out, ror_out,div_out,remainder_out;
    wire cin;
    wire cout;
    assign cin=0;
	wire [63:0] mul_out;
// think this is all we need 
    
    add_32_bit adding(A_reg,B_reg,cin,add_sum,cout);
    mul_32bit multiply(A_reg,B_reg,mul_out);
    sub_32bit subtraction(A_reg,B_reg,cin,sub_sum,cout);
    div_32bit division(A_reg,B_reg,div_out,remainder_out);
    
    always @(*)
        begin
            case(opcode)
                Add, Addi:begin
                    C_reg[31:0]<= A_reg+B_reg;
                    C_reg[63:32]<= 32'b0;
                end
					Negate:begin
							C_reg[31:0]<=~B_reg+1;
							C_reg[63:32]<=32'b0;
					 end
                Not:begin
                    		C_reg[31:0]<=~B_reg;
							C_reg[63:32]<=32'b0;
                end
                Sub: begin
                    C_reg[31:0]<= A_reg-B_reg;
                    C_reg[63:32]<= 32'b0;
                end
                Mul: begin
                    C_reg<= mul_out;
                end
                Div: begin
                    C_reg[31:0]<= div_out;
                    C_reg[63:31]<= remainder_out;
                end
                And, Andi: begin
                    C_reg[31:0]<= A_reg & B_reg;
                    C_reg[63:32]<= 32'b0;
                end
                Or, Ori: begin
                    C_reg[31:0]<= A_reg | B_reg;
                    C_reg[63:32]<= 32'b0;
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
                ld, ldi, st:begin 
                    C_reg[31:0] <= add_sum[31:0];
					C_reg[63:32] <= 32'd0;
                end
                Jr, Jal: begin
                    C_reg[31:0] <= A_reg[31:0];
                    C_reg[63:32] <= 32'b0;
                end               
                Brnz: begin
                    if (branch_flag == 1) begin
                        if (Y_reg[31:0] != 0) begin
                            C_reg[31:0] <= add_sum[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                        else begin
                            C_reg[31:0] <= Y_reg[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                    end
                    else begin
                        C_reg[31:0] <= Y_reg[31:0];
                        C_reg[63:32] <= 32'd0;
                    end
                end

                // Brzr: Branch if zero
                Brzr: begin
                    if (branch_flag == 1) begin
                        if (Y_reg[31:0] == 0) begin
                            C_reg[31:0] <= add_sum[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                        else begin
                            C_reg[31:0] <= Y_reg[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                    end
                    else begin
                        C_reg[31:0] <= Y_reg[31:0];
                        C_reg[63:32] <= 32'd0;
                    end
                end 

            // Brmi: Branch if negative
                Brmi: begin
                    if (branch_flag == 1) begin
                        if (Y_reg[31] == 1) begin
                            C_reg[31:0] <= add_sum[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                        else begin
                            C_reg[31:0] <= Y_reg[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                    end
                    else begin
                        C_reg[31:0] <= Y_reg[31:0];
                        C_reg[63:32] <= 32'd0;
                    end
                end

                // Brpl: Branch if positive
                Brpl: begin
                    if (branch_flag == 1) begin
                        if (Y_reg[31] == 0) begin
                            C_reg[31:0] <= add_sum[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                        else begin
                            C_reg[31:0] <= Y_reg[31:0];
                            C_reg[63:32] <= 32'd0;
                        end
                    end
                    else begin
                        C_reg[31:0] <= Y_reg[31:0];
                        C_reg[63:32] <= 32'd0;
                    end
                     /*
               // In: Input
                In: begin
                    // Assuming a 32-bit input port value
                    C_reg[31:0] <= input_port_value;
                    C_reg[63:32] <= 32'b0;
                end
                
                // Out: Output
                Out: begin
                    // Assuming a 32-bit output port
                    output_port_value <= A_reg[31:0];
                    C_reg[63:32] <= 32'b0;
                end
                
                // Mfhi: Move from HI
                Mfhi: begin
                    C_reg[31:0] <= HI[31:0];
                    C_reg[63:32] <= 32'b0;
                end
                
                // Mflo: Move from LO
                Mflo: begin
                    C_reg[31:0] <= LO[31:0];
                    C_reg[63:32] <= 32'b0;
                end
                nop: begin
                    //do nothing 
                end 
                        */
                end  
            endcase 
        end
endmodule