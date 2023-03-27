module decoder_2_to_4(input wire [1:0] decIn, output reg [3:0] decOut);
	always@(*) begin
		case(decIn)
         		4'b00 : decOut <= 4'b0001;    
       		 	4'b01 : decOut <= 4'b0010;    
         		4'b10 : decOut <= 4'b0100;    
         		4'b11 : decOut <= 4'b1000;    
      		endcase
   	end
endmodule