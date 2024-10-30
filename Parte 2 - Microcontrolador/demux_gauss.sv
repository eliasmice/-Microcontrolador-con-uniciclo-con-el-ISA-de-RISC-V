module demux_gauss (
    input logic select,
    input logic wr_i,
    output logic wr1_c, //control
    output logic wr1_d  //datos
);

    assign wr1_c = (select) ? 1'b0 : wr_i;
    assign wr1_d = (select) ? wr_i : 1'b0;

endmodule