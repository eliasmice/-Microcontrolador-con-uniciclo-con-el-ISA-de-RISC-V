module deco_gauss (
    input logic [31:0] Data_Address_o, // direcciÃ³n que proviene de la ALU
    output logic select
);

always_comb begin : decodificador

    if ((Data_Address_o[15:12] == 4'b0010) && 
        (Data_Address_o[7:4]  == 4'b0011) && 
        (Data_Address_o[3:0]   == 4'b0000)) begin // 0x2X30
        select = 1'b0;
    end 
    else if ((Data_Address_o[15:12] == 4'b0010) && 
             (Data_Address_o[7:4]  == 4'b0011) && 
             (Data_Address_o[3:0]   == 4'b0100)) begin // 0x2X34
        select = 1'b1;
    end 
    else begin
        // Valores por defecto si ninguna condiciÃ³n anterior se cumple
        select = 1'b0;
    end

end

endmodule