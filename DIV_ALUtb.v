`timescale 1ns/10ps
module DIV_ALUtb();
    reg R0in,R1in,R2in,R3in,R4in,R5in,R6in,R7in,R8in,R9in,R10in,R11in,R12in,R13in,R14in,R15in,R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, Yout;
    reg HIin, Loin, ZHIin, ZLOin, PCin, MDRin, MARin, IRin, Yin, Zin;
    reg HIout, Loout, PCout, MDRout, Read, Cout, clk, clear, IncPC, ZHighSelect, ZLowSelect, ZHIout, ZLOout, InPortout;
    reg[4:0] ALUopCode = 5'b10000;//code for not operation
    reg[31:0] MdataIn;
    wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, Y, ZLO, ZHI, IR, BusMuxOut, BUSSINY;
    wire[63:0] ZReg;
    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100,T6 = 4'b1101;

    reg[3:0] Present_state = Default;

    datapath testDP(	.R0in(R0in),.R1in(R1in),.R2in(R2in),.R3in(R3in),.R4in(R4in),.R5in(R5in),.R6in(R6in),.R7in(R7in),.R8in(R8in),.R9in(R9in),.R10in(R10in),.R11in(R11in),.R12in(R12in),.R13in(R13in),.R14in(R14in),.R15in(R15in),
	                    .R0out(R0out),.R1out(R1out),.R2out(R2out),.R3out(R3out),.R4out(R4out),.R5out(R5out),.R6out(R6out),.R7out(R7out),.R8out(R8out),.R9out(R9out),.R10out(R10out),.R11out(R11out),.R12out(R12out),.R13out(R13out),.R14out(R14out),.R15out(R15out),.Yout(Yout),
	                    .HIin(HIin),.Loin(Loin),.ZHIin(ZHIin),.ZLOin(ZLOin),.PCin(PCin),.MDRin(MDRin),.MARin(MARin),.IRin(IRin),.Yin(Yin),.Zin(Zin),.HIout(HIout),.Loout(Loout),.PCout(PCout),.MDRout(MDRout),.MDRread(Read),.Cout(Cout),.clk(clk),.clr(clear),.IncPC(IncPC),.ZHighSelect(ZHighSelect),.ZLowSelect(ZLowSelect),.ZHIout(ZHIout),.ZLOout(ZLOout),.InPortout(InPortout),
                        .ALU_opcode(ALUopCode),.Mdatain(MdataIn),
                        .R0(R0),.R1(R1),.R2(R2),.R3(R3),.R4(R4),.R5(R5),.R6(R6),.R7(R7),.R8(R8),.R9(R9),.R10(R10),.R11(R11),.R12(R12),.R13(R13),.R14(R14),.R15(R15),.HI(HI),.LO(LO),.Y(Y),.ZLO(ZLO),.ZHI(ZHI),
	                    .Z_register(testZRegister)
                    );

    initial
        begin
            clk=0;
            forever #10 clk= ~clk;
        end

always @(posedge clk)//finite state machine  
    begin					//changes on rising ede
        case (Present_state)//why #40 time units
            Default			:	#40 Present_state = Reg_load1a;
            Reg_load1a		:	#40 Present_state = Reg_load1b;
            Reg_load1b		:	#40 Present_state = Reg_load2a;
            Reg_load2a		:	#40 Present_state = Reg_load2b;
            Reg_load2b		:	#40 Present_state = Reg_load3a;
            Reg_load3a		:	#40 Present_state = Reg_load3b;
            Reg_load3b		:	#40 Present_state = T0;
            T0				:	#40 Present_state = T1;
            T1				:	#40 Present_state = T2;
            T2				:	#40 Present_state = T3;
            T3				:	#40 Present_state = T4;
            T4				:	#40 Present_state = T5;
            T5              :   #40 Present_state = T6;
        endcase
    end

    always @(Present_state)
        begin
            case(Present_state)
                Default:
                    begin
                        PCout <= 0; 
						ZLowSelect <= 0;
						ZHighSelect <= 0;
						MDRout <= 0;
						MARin <= 0;
						PCin <= 0;
						MDRin <= 0;
						IRin <= 0; 
						Yin <= 0;
						Zin<=0;
						IncPC <= 0;
						Read <= 0;
						ALUopCode <= 0;
							
						R1in <= 0;
						R2in <= 0;
						R3in <=0;
						R4in <= 0;
						R1out<=0;
						R2out<=0;
						R3out<=0;
						R4out<=0;
						
						MdataIn <= 32'h00000000;
						R5in <=0;
						R6in <=0;
						R7in <=0;
						
						Loin <=0;
						HIin<=0;
						HIout<=0;
						Loout<=0;
							
						ZHIin<=0;
						ZLOin<=0;
						ZLOout<=0;
						ZHIout<=0;
                    end

                Reg_load1a:
                    begin
                        MdataIn<=32'h0000000F;
                        Read = 0;
                        MDRin= 0;
                        #10 Read <=1; MDRin <= 1;
                        #15 Read <=0; MDRin <=0;
                    end
                Reg_load1b:
                    begin
                        #10 MDRout <= 1; R6in <= 1;
                        #15 MDRout <= 0; R6in <= 0;
                    end
                Reg_load2a:
                    begin
                        MdataIn<=32'h00000004;
                        #10 Read <= 1; MDRin <=1;
                        #15 Read <= 0; MDRin <=0;
                    end
                Reg_load2b:
                    begin
                        #10 MDRout <= 1; R7in <= 1;
                        #15 MDRout <= 0; R7in <= 0;
                    end
                Reg_load3a:
                    begin
                        MdataIn <= 32'h00000012;
                        #10 Read <=1; MDRin <=1;
                        #15 Read <=0; MDRin <=0;
                    end
                Reg_load3b:
                    begin
                        #10 Read <=1; R1in <=1;
                        #15 Read <=0; R1in <=0;
                    end
                T0: begin end
                T1: begin end
                T2: begin end 
                T3: 
                    begin
                        #10 R6out<=1; Yin<=1;
                        #25 Yin <= 0; R2out <=0;
                    end
                T4:
                    begin	 
					
					ZLOin<=1; ALUopCode = 5'b10000; ZHIin <=1; R7out<=1; 
                    #25 ZLOin<=0;  ZHIin <=0; R7out<=0;
					
				    end
						
				T5: 
                    begin

						ZLOout<=1; Loin<=1;
                        #25 ZLOout<=0; Loin<=0;

					end
                T6:
                    begin
                        ZHighout<=1; HIin<=1;
                        #25 ZHighout<=0; HIin<=0;
                    end
            endcase
        end
endmodule