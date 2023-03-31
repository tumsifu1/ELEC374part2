module PC(

input clk, IncPC, enbl,
input [31:0] D,
output reg [31:0] Q
);

initial Q = 0;

always @(posedge clk)
begin
    if(IncPC == 1 && enbl == 1)
			Q <= Q + 1 ;
    else if (enbl == 1)
		Q <= D;
end
endmodule



