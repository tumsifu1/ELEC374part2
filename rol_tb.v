module rol_tb();

  reg [31:0] data_in;
  reg [31:0] rotate_num;
  wire [31:0] data_out;

  rotateLeft rol_instance(data_in, rotate_num, data_out);

  initial begin

    
    data_in = 32'h8FEDCBA9;
    rotate_num = 4;
    #10; // Delay for 10 time units data_out should = 32'hFEDCBA98

    data_in = 32'h78123456;
    rotate_num = 8;
    #10; // Delay for 10 time units data_out should = 32'h12345678
  end 

endmodule