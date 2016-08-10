//Instruction mux
`timescale 1ns/1ps
module mux_inst_type(WB_reg, inst_out, RegDst);
output [4:0] WB_reg;
input [31:0] inst_out;
input RegDst;

assign WB_reg = RegDst ? inst_out[21:17] : inst_out[26:22];
endmodule
