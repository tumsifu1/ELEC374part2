module rotateLeft(
    input [31:0] data_in,
    input [31:0] rotate_num,
    output [31:0] data_out
);
    reg [31:0] temp;

    always @(*) begin
        temp = data_in >> rotate_num;
        data_out = temp | data_in >> ( 32 - shift); //rotate by combining the two shifts
    end

endmodule