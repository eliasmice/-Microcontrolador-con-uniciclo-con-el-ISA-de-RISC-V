module registro_datos_gauss (
    input logic clk,         
    input logic rst,

    input logic [7:0] in_pixel,
    input logic [7:0] in_procesado,
    input logic we,
    input logic we_fsm,

    input logic [3:0] addr_i,

    output logic [31:0] out_d,

    output logic [7:0] out_pixel_1,
    output logic [7:0] out_pixel_2,
    output logic [7:0] out_pixel_3,
    output logic [7:0] out_pixel_4,
    output logic [7:0] out_pixel_5,
    output logic [7:0] out_pixel_6,
    output logic [7:0] out_pixel_7,
    output logic [7:0] out_pixel_8,
    output logic [7:0] out_pixel_9
);

reg [7:0] registros [8:0];
reg [31:0] registro_out;

//salida de datos
assign out_pixel_1=registros[0];
assign out_pixel_2=registros[1];
assign out_pixel_3=registros[2];
assign out_pixel_4=registros[3];
assign out_pixel_5=registros[4];
assign out_pixel_6=registros[5];
assign out_pixel_7=registros[6];
assign out_pixel_8=registros[7];
assign out_pixel_9=registros[8];
assign out_d = registro_out;

always_ff @(posedge clk) begin : write
    if (rst) begin
        foreach(registros[i])begin 
            registros[i]<=0;       
        end
    end
    if (we) begin
        registros[addr_i - 1] <= in_pixel;  
        registro_out <= {24'b000000000000000000000000,in_procesado};
    end
end
endmodule