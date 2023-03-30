//v2

//added ZHIin, ZLOin, Zin, ZLO, ZHI, ZHIout, ZLOout, to datapath, 
//changed ZLowout/Highout to ZLow/HighSelect

module datapath(


//I/0 Definition

//enables for the registers
input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, //feeding into registers


//input signals for the encoders
R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, Yout,

//ins are enables for the registers, outs are input signals for the encoder
input HIin, Loin, ZHIin, ZLOin, PCin, MDRin, MARin, IRin, Yin, Zin, 
HIout, Loout, PCout, MDRout, MDRread, Cout, clk, clr, IncPC, ZLowSelect, ZHighSelect, ZHIout, ZLOout, InPortout, 

input [4:0] ALU_opcode,
input[31:0] Mdatain,

output[31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, HI, LO, Y, ZLO, ZHI,

output  [63:0] Z_register

);

wire[31:0] bus;
//wire clr;
wire [31:0] IROut;
wire [31:0] YData, XData;
wire[63:0] ZData;
wire[31:0] ZHighData, ZLowData; //FROM Z_REG_64 to two seperate Z 32 Regs

//General Registers

wire [31:0] busInR0, busInR1, busInR2, busInR3, busInR4, busInR5, busInR6, busInR7, busInR8, busInR9, 
busInR10, busInR11, busInR12, busInR13, busInR14, busInR15, busInPC, busInMAR, busInMDR, busInHI, busInLo,  busInInPort, busInC, busInY; 
wire [31:0] busInZHI, busInZLO;

//General Registers

//feeding out of registers into bus


R0_register r0(clr,clk,bus,R0in,BAout, busInR0);
Register r1(clr,clk,bus,R1in,busInR1);
Register r2(clr,clk,bus,R2in,busInR2);
Register r3(clr,clk,bus,R3in,busInR3);
Register r4(clr,clk,bus,R4in,busInR4);
Register r5(clr,clk,bus,R5in,busInR5);
Register r6(clr,clk,bus,R6in,busInR6);
Register r7(clr,clk,bus,R7in,busInR7);
Register r8(clr,clk,bus,R8in,busInR8);
Register r9(clr,clk,bus,R9in,busInR9);
Register r10(clr,clk,bus,R10in,busInR10);
Register r11(clr,clk,bus,R11in,busInR11);
Register r12(clr,clk,bus,R12in,busInR12);
Register r13(clr,clk,bus,R13in,busInR13);
Register r14(clr,clk,bus,R14in,busInR14);
Register r15(clr,clk,bus,R15in,busInR15);

//Program Counter and Instruction Register
Register IR(clr, clk,  bus, IRin, IROut);
PC PC(PCin, IncPC, clk, clr, bus, busInPC); // need to make this 

//MAR and MDR

Register MAR(clr,clk,bus,MARin,busInMAR);
MDR MDR_register(.clr(clr),.clk(clk),.MDR_read(MDRread),.BusMuxOut(bus),.MDR_enable(MDRin),.MDataIn(Mdatain),.Q(busInMDR));

//Other Special Registers


Register hi(clr,clk,bus,HIin,busInHI);
Register lo(clr,clk,bus,Loin,busInLo);

z_register z_reg(Zin, ZLowSelect, ZHighSelect, clk, clr, ZData, ZHighData, ZLowData);

Register zhi(clr,clk,bus,ZHIin,busInZHI);
Register zlo(clr,clk,bus,ZLOin,busInZLo);

Register y(clr,clk,bus,Yin,YData);



//ALU

ALU alu_instance(clk, bus,YData, ALU_opcode, ZData);



//Bus
bidirectional_bus my_bus(
//enable signals for the encoder
R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out,
 R10out, R11out, R12out, R13out, R14out, R15out, HIout, Loout, ZHIout, ZLOout, PCout, MDRout, InPortout, Cout, Yout,
//Yout,

//inputs for the multiplexer
busInR0, busInR1, busInR2, busInR3, busInR4, busInR5, busInR6, busInR7, busInR8,
 busInR9, busInR10, busInR11, busInR12, busInR13,busInR14, busInR15, busInHI, busInLo, ZHighData,
  ZLowData, busInPC, busInMDR,  busInInPort, busInC, busInY,
//busInY,

//output of bus
bus

);


assign R0 = busInR0;
assign R1 = busInR1;
assign R2 = busInR2; // debugging 
assign R3 = busInR3;

assign R4 = busInR4;
assign R5 = busInR5;
assign R6 = busInR6;
assign R7 = busInR7;
assign R8 = busInR8;
assign R9 = busInR9;
assign R10 = busInR10; //debugging change later
assign R11 = busInR11;
assign R12 = busInR12;
assign R13 = busInR13;
assign R14 = busInR14;
assign R15 = busInR15;
assign HI = busInHI;
assign LO = busInLo;
assign Y = YData;
assign ZLO = ZLowData;
assign ZHI = ZHighData;
assign Z_register = ZData;

endmodule
