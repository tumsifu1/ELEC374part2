`timescale 1ns/10ps

module storeTB;
    reg clk, clr;
    reg IncPC, CON_ff_in;
    reg [31:0] Mdatain;
    wire [31:0] bus_contents;
    reg RAM_write, MDRin, MDRread;
    reg PC_enable, Y_enable, Zin;
    reg HI_enable, LO_enable;
    reg Gra, Grb, Grc, BAOut;
    wire [4:0] ALU_opcode;
    reg ZLOin, ZHIin;
    wire [63:0] ZReg;
    wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, Y, ZLO, ZHI, MdataIn;
    //MIISED SIGNAL
    reg PCout, MARin, ZLOout, PCin, Read, MDRout, IRin, BAout, Yin, Loin, Cout, Rout;
    // Instantiate the datapath module
	 datapath testDP(
		 .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout),
		 .BAOut(BAOut), .CON_ff_in(CON_ff_in), .CON_ff_out(CON_ff_out), .WRen(WRen),
		 .HIin(HIin), .Loin(Loin), .ZHIin(ZHIin), .ZLOin(ZLOin), .PCin(PCin), .MDRin(MDRin), .MARin(MARin), .IRin(IRin), .Yin(Yin), .Zin(Zin),
		 .HIout(HIout), .Loout(Loout), .PCout(PCout), .MDRout(MDRout), .MDRread(MDRread), .Cout(Cout), .clk(clk), .clr(clr), .IncPC(IncPC), .ZLowSelect(ZLowSelect), .ZHighSelect(ZHighSelect), .ZHIout(ZHIout), .ZLOout(ZLOout), .InPortout(InPortout),
		 .ALU_opcode(ALU_opcode), .MDataIn(MdataIn),.RAM_write(RAM_write),
		 .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), .R12(R12), .R13(R13), .R14(R14), .R15(R15), .HI(HI), .LO(LO), .Y(Y), .ZLO(ZLO), .ZHI(ZHI),
		 .Z_register(ZReg)
	);

    initial
    begin
        clk = 0;
        clr = 0;
    end

    always
        #10 clk <= ~clk;

    // State definitions
    localparam Default = 4'b0000, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101, T7 = 4'b1110;
    reg [3:0] Present_state = Default;

    always @(posedge clk)
    begin
        case (Present_state)
            Default: #40 Present_state = T0;
            T0: #40 Present_state = T1;
            T1: #40 Present_state = T2;
            T2: #20 Present_state = T3;
            T3: #40 Present_state = T4;
            T4: #40 Present_state = T5;
            T5: #40 Present_state = T6;
            T6: #40 Present_state = T7;
        endcase
    end

    always @(Present_state)
    begin
        #10
        case (Present_state) // Assert the required signals in each clock cycle
            Default: begin // Initialize the signals
                PCin <= 0; MARin <= 0; MDRin <= 0;
                IRin <= 0; Yin <= 0; Zin <= 0;
                HI_enable <= 0; Loin <= 0; ZHIin <= 0; ZLOin <= 0;
                Gra <= 0; Grb <= 0; Grc <= 0;
                CON_ff_in <= 0; IncPC <= 0;
                RAM_write <= 0; MDRread <= 0;
                Mdatain <= 32'h00000000;
            end

         T0: begin                                           
						PCout <= 1; MARin <= 1; IncPC <= 1; ZLOin <= 1;
				 end 
			T1: begin
						PCout <= 0; MARin <= 0; IncPC <= 0; ZLOin <= 0;
						ZLOout<= 1; PCin <= 1; Read <= 1; MDRin <= 1;
             end
         T2: begin 
						ZLOout<= 0; PCin <= 0; Read <= 0; MDRin <= 0;
						MDRout <= 1; IRin <= 1;
             end
         T3: begin 	
						MDRout<= 0; IRin <= 0;
						Grb <= 1; BAout <= 1; Yin <= 1;
             end
         T4: begin	
						Grb <= 0; BAout <= 0; Yin <= 0;
						Cout <= 1; ZHIin <= 1; ZLOin <= 1;
             end
         T5: begin	
						Cout <= 0; ZHIin <= 1; ZLOin <= 0;
						ZLOout<= 1; MARin <= 1;
				 end
         T6: begin	
						ZLOout<= 0; MARin <= 0;
						Read <= 0; Gra <= 1; Rout <= 1;  MDRin <= 1;
				 end
         T7: begin	
						Gra <= 0; Rout <= 0;  MDRin <= 0; MDRout <= 1; RAM_write <= 1;
				 end
    endcase 
end 
endmodule

/*Old TB
            // Test sequence
            T0: begin
                PC_enable <= 1;
                MARin <= 1;
                MDRin <= 0;
                IR_enable <= 0;
                Y_enable <= 0;
                Zin <= 0;
                HI_enable <= 0;
                LO_enable <= 0;
                ZHIin <= 0;
                ZLOin <= 0;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 0;
                RAM_write <= 0;
                MDR_read <= 0;
                Mdatain <= 32'h00000000;
                end
            T1: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 1;
                IR_enable <= 0;
                Y_enable <= 0;
                Zin <= 0;
                HI_enable <= 0;
                LO_enable <= 0;
                ZHIin <= 0;
                ZLOin <= 0;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 0;
                RAM_write <= 1;
                MDR_read <= 0;
                Mdatain <= 32'h00000001;
            end

            T2: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 0;
                IR_enable <= 1;
                Y_enable <= 0;
                Zin <= 0;
                HI_enable <= 0;
                LO_enable <= 0;
                ZHIin <= 0;
                ZLOin <= 0;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 0;
                RAM_write <= 0;
                MDR_read <= 1;
                Mdatain <= 32'h00000000;
            end

            T3: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 0;
                IR_enable <= 0;
                Zin <= 0;
                HI_enable <= 0;
                LO_enable <= 0;
                ZHIin <= 0;
                ZLOin <= 0;
                Gra <= 0;
                Grc <= 0;
                CON_ff_in <= 1;
                IncPC <= 0;
                RAM_write <= 0;
                MDR_read <= 0;
                Mdatain <= 32'h00000000;

                Grb <= 1;
                Rout <= 1;
                Y_enable <= 1;
            end

            T4: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 0;
                IR_enable <= 0;
                Y_enable <= 0;
                Zin <= 1;
                HI_enable <= 0;
                LO_enable <= 0;
                ZHIin <= 0;
                ZLOin <= 0;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 0;
                RAM_write <= 0;
                MDR_read <= 0;
                Mdatain <= 32'h00000000;

                Cout <= 1;
                BAOut <= 0;
                ZHIin <= 1;



            end

            T5: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 0;
                IR_enable <= 0;
                Y_enable <= 0;
                Zin <= 0;
                HI_enable <= 1;
                LO_enable <= 0;
                ZHIin <= 1;
                ZLOin <= 0;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 0;
                RAM_write <= 0;
                MDR_read <= 0;
                Mdatain <= 32'h00000000;
                end
            T6: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 0;
                IR_enable <= 0;
                Y_enable <= 0;
                Zin <= 0;
                HI_enable <= 0;
                LO_enable <= 1;
                ZHIin <= 0;
                ZLOin <= 1;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 0;
                RAM_write <= 0;
                MDR_read <= 0;
                Mdatain <= 32'h00000000;
            end

            T7: begin
                PC_enable <= 0;
                MARin <= 0;
                MDRin <= 0;
                IR_enable <= 0;
                Y_enable <= 0;
                Zin <= 0;
                HI_enable <= 0;
                LO_enable <= 0;
                ZHIin <= 0;
                ZLOin <= 0;
                Gra <= 0;
                Grb <= 0;
                Grc <= 0;
                CON_ff_in <= 0;
                IncPC <= 1;
                RAM_write <= 0;
                MDR_read <= 0;
                Mdatain <= 32'h00000000;
            end
        endcase
        end

    endmodule
*/