module deco_write(
    input logic [31:0] Data_Address_o, // dirección que proviene de la ALU
    input logic we_o,                  // we_o proviene del main control
    output logic we_Mem, we_Leds, we_7seg, we_Gauss, we_Uart // señales de habilitación
);

assign we_Uart = ((Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0001) && we_o) ? 1'b1 : 1'b0;
assign we_Gauss = ((Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0011) && we_o) ? 1'b1 : 1'b0;
assign we_Leds = ((Data_Address_o[15:12] == 4'b0010 && Data_Address_o[3:0] == 4'b0100) && we_o) ? 1'b1 : 1'b0;
assign we_7seg = ((Data_Address_o[15:12] == 4'b0010 && Data_Address_o[3:0] == 4'b1000) && we_o) ? 1'b1 : 1'b0;
assign we_Mem = ((Data_Address_o[15:12] == 4'b0001) && we_o) ? 1'b1 : 1'b0;

endmodule