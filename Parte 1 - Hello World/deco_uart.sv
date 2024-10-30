module deco_uart (
    input logic [31:0] Data_Address_o, // direcciÃ³n que proviene de la ALU
    output logic reg_sel_i,
    output logic addr_i
);

always_comb begin : decodificador

    if ((Data_Address_o[15:12] == 4'b0010) && 
        (Data_Address_o[7:4]  == 4'b0001) && 
        (Data_Address_o[3:0]   == 4'b0000)) begin // 0x2X10
        reg_sel_i = 1'b0;
        addr_i = 1'b0;
    end 
    else if ((Data_Address_o[15:12] == 4'b0010) && 
             (Data_Address_o[7:4]  == 4'b0001) && 
             (Data_Address_o[3:0]   == 4'b1000)) begin // 0x2X18
        reg_sel_i = 1'b1;
        addr_i = 1'b0;
    end 
    else if ((Data_Address_o[15:12] == 4'b0010) && 
             (Data_Address_o[7:4]  == 4'b0001) && 
             (Data_Address_o[3:0]   == 4'b1100)) begin // 0x2X1C
        reg_sel_i = 1'b1;
        addr_i = 1'b1;
    end 
    else begin
        // Valores por defecto si ninguna condiciÃ³n anterior se cumple
        reg_sel_i = 1'b0;
        addr_i = 1'b0;
    end

end

endmodule
