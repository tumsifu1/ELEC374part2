module Register (clr,clk,inputD,enbl,outputQ); //declaring inputs and outputs for register
	
	input		enbl;
	input		clr;
	input		clk;
	input	[31:0]inputD;
	output reg [31:0]outputQ;
	
	always @(posedge clk or posedge clr)
	begin
	
		if(clr)
			outputQ<=0;
			
		else if (enbl)
			outputQ<=inputD;

	end
		
endmodule