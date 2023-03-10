module mux2_1(
input wire [31:0] inputOne, 
input wire [31:0] inputTwo, 
input wire signal, 
output reg [31:0] out
);

always@(*)begin
			if (signal) begin
				out[31:0] <= inputTwo[31:0];
				
			end
			else begin
				out[31:0] <= inputOne[31:0];
			end
			
	end
	
endmodule
module mux8_1(input [7:0] i, input [2:0] s, output o);

    wire o_m1, o_m2, o_m3, o_m4, o_m5, o_m6; //outputs for each of the 2-1 muxes

    //level 1
    mux2_1 m0(o_m1, i[0], i[1], s[0]);
    mux2_1 m2(o_m2, i[2], i[3], s[0]);
    mux2_1 m3(o_m3, i[4], i[5], s[0]);
    mux2_1 m4(o_m4, i[6], i[7], s[0]);
    //level 2
    mux2_1 m5(o_m5, o_m1, o_m2, s[1]);
    mux2_1 m6(o_m6, o_m3, o_m4, s[1]);
    //level 3
    mux2_1 m7(o, o_m5, o_m6, s[2]);
endmodule

module mux16_1(input [15:0] i, input [3:0] s, output o);

    wire o_m1, o_m2; //outputs for each of muxes
    //level 1
    mux8_1 m1(o_m1, i[7:0], s[2:0]);
    mux8_1 m2(o_m2, i[15:8], s[2:0]);
    //level 2
    mux2_1 m3(o, o_m1, o_m2, s[3]);

endmodule


module mux32_1(input [31:0] i, input [4:0] s, output o);

    wire o_m1, o_m2; //outputs for each of muxes
    //level 1
    mux8_1 m1(o_m1, i[15:0], s[3:0]);
    mux8_1 m2(o_m2, i[31:16], s[3:0]);
    //level 2
    mux2_1 m3(o, o_m1, o_m2, s[4]);

endmodule