module shra(
    input [31:0] data_in,
    input [31:0] shift_num,
    output [31:0] data_out
);
	 integer i;
    wire[0] temp;
    always @(*) begin
        assign temp = data_in[31]; //save sign bit
        assign data_out = (data_in >>  shift_num);

        for(i = 0; i < shift_num; i = i + 1) begin
                data_out[31-i] = temp;
            end 
    end 
endmodule
