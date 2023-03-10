module encoder_32to5 (
input wire R0Out,
input wire R1Out,
input wire R2Out,
input wire R3Out,
input wire R4Out,
input wire R5Out,
input wire R6Out,
input wire R7Out,
input wire R8Out,
input wire R9Out,
input wire R10Out,
input wire R11Out,
input wire R12Out,
input wire R13Out,
input wire R14Out,
input wire R15Out,
input wire HIOut,
input wire LOOut,
input wire ZHIOut,
input wire ZLOOut,
input wire PCOut,
input wire MDROut,
input wire InportOut,
input wire COut,
output reg [4:0] Yout
);
reg [4:0] encoderOutput;
always @(*) begin
	if (R0Out == 1)
		 encoderOutput = 5'b00001;
	else if (R1Out == 1)
		 encoderOutput = 5'b00010;
	else if (R2Out == 1)
		 encoderOutput = 5'b00011;
	else if (R3Out == 1)
		 encoderOutput = 5'b00100;
	else if (R4Out == 1)
		 encoderOutput = 5'b00101;
	else if (R5Out == 1)
		 encoderOutput = 5'b00110;
	else if (R6Out == 1)
		 encoderOutput = 5'b00111;
	else if (R7Out == 1)
		 encoderOutput = 5'b01000;
	else if (R8Out == 1)
		 encoderOutput = 5'b01001;
	else if (R9Out == 1)
		 encoderOutput = 5'b01010;
	else if (R10Out == 1)
		 encoderOutput = 5'b01011;
	else if (R11Out == 1)
		 encoderOutput = 5'b01100;
	else if (R12Out == 1)
		 encoderOutput = 5'b01101;
	else if (R13Out == 1)
		 encoderOutput = 5'b01110;
	else if (R14Out == 1)
		 encoderOutput = 5'b01111;
	else if (R15Out == 1)
		 encoderOutput = 5'b10000;
	else if (HIOut == 1)
		 encoderOutput = 5'b10001;
	else if (LOOut == 1)
		 encoderOutput = 5'b10010;
	else if (ZHIOut == 1)
		 encoderOutput = 5'b10011;
	else if (ZLOOut == 1)
		 encoderOutput = 5'b10100;
	else if (PCOut == 1)
		 encoderOutput = 5'b10101;
	else if (MDROut == 1)
		 encoderOutput = 5'b10110;
	else if (InportOut == 1)
		 encoderOutput = 5'b10111;
	else if (COut == 1)
		 encoderOutput = 5'b11000;
	else
		 encoderOutput = 5'b00000; // assign default value
	Yout = encoderOutput;
	end
endmodule




