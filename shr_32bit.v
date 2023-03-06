module shr(
    input [31:0] data_in,
    input [31:0] shift_num,
    output [31:0] data_out
);
    assign data_out = data_in >>  shift_num;
endmodule