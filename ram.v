module ram(output [31:0] ram_out, input [31:0] ram_in, input [8:0] addr, input en, clk);

	reg [31:0] ram_contents[0:511];
	reg [31:0] addr_reg;
	
	initial $readmemh("memory_file.mif", ram_contents);

	
	always@(posedge clk)
	begin
		if(en)
			ram_contents[addr] <= ram_in;
		else 
			addr_reg <= addr;
	end
	
	assign ram_out = ram_contents[addr_reg];
	

endmodule

/*
module ram
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=9)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input we, clk,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**9-1:0];
	
	initial begin
	  $readmemh("testmif5.hex", ram); // Load data from hex file into memory array
	end


	always @ (posedge clk)
	begin
		// Write
		if (we) begin
			ram[write_addr] <= data;
			//q <= ram[read_addr];
			end

		// Read (if read_addr == write_addr, return OLD data).	To return
		// NEW data, use = (blocking write) rather than <= (non-blocking write)
		// in the write assignment.	 NOTE: NEW data may require extra bypass
		// logic around the RAM.
		else
			q <= ram[read_addr];
	end

endmodule */