module deco_read (
    input logic [31:0] Data_Address_o, // direccion que proviene de la alu
    output logic [1:0] select
);

always_comb begin : decodificador
 
        if (Data_Address_o[15:12] == 4'b0001) //0x1XXX
            select=2'b00;
        else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0001) //0x2X1X
            select=2'b01;
        else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[3:0] == 4'b1000) //0x2XX8
            select=2'b10;
        else if (Data_Address_o[15:12] == 4'b0010 && Data_Address_o[7:4] == 4'b0011) //0x203X
            select=2'b11;
        else
            select=2'b00;   // Caso default para cubrir todas las demÃ¡s
    end

    
endmodule
