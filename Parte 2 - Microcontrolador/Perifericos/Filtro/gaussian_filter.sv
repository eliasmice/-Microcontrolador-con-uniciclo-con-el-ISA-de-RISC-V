module gaussian_filter (
    input logic clk,
    input logic rst,
    input logic inicio,
    input logic [7:0] pixel_00, pixel_01, pixel_02,
    input logic [7:0] pixel_10, pixel_11, pixel_12,
    input logic [7:0] pixel_20, pixel_21, pixel_22,
    output logic [7:0] pixel_procesado
);

    logic [11:0] calculo;
    reg [7:0] pixel;
    assign calculo = ((pixel_00 + pixel_02 + pixel_20 + pixel_22) + ((pixel_01 + pixel_10 + pixel_12 + pixel_21) << 1) + (pixel_11 << 2)) >> 4;

    always_ff @(posedge clk) begin
        if (rst) begin
            pixel <= 8'b0;
        end else begin
            if (inicio) begin
                pixel <= calculo[7:0];
            end
        end
    end

    assign pixel_procesado = pixel;

endmodule

