module registerTB;
	reg clock;
	reg [31:0] input_a;
	wire [31:0] output_a;
	reg clear;
	Register register_instance (clear,clock,input_a,1,output_a);
	
	
	
	initial
		begin
		clear<=1;
		clock<=0;

		
		#10 clear<=0;
			input_a<=3;
		end
		
			
	
	always begin 
	#10 clock = !clock;
	end
	
endmodule