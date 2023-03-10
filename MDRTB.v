`timescale 1ns / 1ps

module MDRTB;

    // Inputs
    reg clear;
    reg clock;
    reg read;
    reg MDRin;
    reg [31:0] Mdatain;
    reg [31:0] BusMuxOut;

    // Outputs
    wire [31:0] memOut;

    // Instantiate the module to be tested
    MDR dut(
        .clear(clear),
        .clock(clock),
        .read(read),
        .MDRin(MDRin),
        .Mdatain(Mdatain),
        .BusMuxOut(BusMuxOut),
        .memOut(memOut)
    );

    // Clock generator
      initial
        begin
            clock=0;
            forever #10 clock= ~clock;
        end


    // Test case 1: write and read from memory
    initial begin
        clear = 0;
        MDRin = 0;
        Mdatain = 32'h12345678;
        BusMuxOut = 0;
        read = 0;
			
			#40;
         clear = 0;
         Mdatain = 32'h87654321;
         BusMuxOut = 1;
			MDRin = 1;
         read = 1;

        // Expected output after one clock cycle
       // #10 expect(memOut == 32'h12345678);

        // Expected output after two clock cycles
        //#10 expect(memOut == 32'h876543;
		  end
endmodule 