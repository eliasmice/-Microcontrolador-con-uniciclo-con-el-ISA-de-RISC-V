module deco_write(
    input logic [31:0] Data_Address_o, // dirección que proviene de la ALU
    input logic we_o,                  // we_o proviene del main control
    output logic we_Mem, we_Leds, we_7seg, we_Gauss, we_Uart // señales de habilitación
);

assign we_Uart = ((Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0001) && we_o) ? 1'b1 : 1'b0;

//always_comb begin : decodificador
//    // Inicializar todas las señales de habilitación a 0
//    case(we_o)
//        1'b1: begin
//            if (Data_Address_o[15:12] == 4'b0001) begin 
//                we_Mem = 1'b1;
//                we_Leds = 1'b0;
//                we_7seg = 1'b0;
//                we_Gauss = 1'b0;
//                we_Uart = 1'b0;
//            end else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[3:0] == 4'b0100) begin
//                we_Leds = 1'b1;
//                we_Mem = 1'b0;
//                we_7seg = 1'b0;
//                we_Gauss = 1'b0;
//                we_Uart = 1'b0;
//            end else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[3:0] == 4'b1000) begin
//                we_7seg = 1'b1;
//                we_Mem = 1'b0;
//                we_Leds = 1'b0;
//                we_Gauss = 1'b0;
//                we_Uart = 1'b0;
//            end else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0001) begin
//                we_Uart = 1'b1;
//                we_Mem = 1'b0;
//                we_Leds = 1'b0;
//                we_7seg = 1'b0;
//                we_Gauss = 1'b0;
//            end else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0011) begin
//                we_Gauss = 1'b1;
//                we_Mem = 1'b0;
//                we_Leds = 1'b0;
//                we_7seg = 1'b0;
//                we_Uart = 1'b0;
//            end
//        end
        
//        1'b0: begin
//            we_Mem = 1'b0;
//            we_Leds = 1'b0;
//            we_7seg = 1'b0;
//            we_Gauss = 1'b0;
//            we_Uart = 1'b0;
//        end
        
//        default: begin
//            we_Mem = 1'b0;
//            we_Leds = 1'b0;
//            we_7seg = 1'b0;
//            we_Gauss = 1'b0;
//            we_Uart = 1'b0;
//        end
//    endcase
//end

endmodule