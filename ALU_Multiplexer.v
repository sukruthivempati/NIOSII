//ALU mux

`timescale 1ns/1ps
module mux_ALU(mux_data_out, read_data_2, sign_ext_imme, ALU_Src);
output [31:0] mux_data_out;
input [31:0] read_data_2, sign_ext_imme;
input ALU_Src;

assign mux_data_out = ALU_Src ? sign_ext_imme : read_data_2;
endmodule
