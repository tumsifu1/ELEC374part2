module MDR(input clear,
    input clock, 
    input read,
    input MDRin, 
    wire [31:0] BusMuxOut, 
    input [31:0] Mdatain, 
    output [31:0] memOut);

    wire [31:0] temp;
    mux2_1 MDmux(BusMuxOut, BusMuxIn, Mdatain, read);
    register MDRegister(clr, clock, BusMuxOut, MDRin, temp);

    assign memOut = temp;
    
endmodule 