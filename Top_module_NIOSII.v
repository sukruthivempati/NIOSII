Top Module: NIOS_II.v
`timescale 1ns/1ps
module NIOS_II(pc_out, inst_out, read_data_1, read_data_2, sign_ext_imme, ALU_result, zero_flag, ALU_ctrl, read_mem_data, mux_data_out, WB_reg, WB_result, clock, reset);

output [31:0]pc_out;
output [31:0] inst_out;
output [31:0] read_data_1, read_data_2;
output [31:0] sign_ext_imme;
output [31:0] ALU_result;
output zero_flag;
output [2:0] ALU_ctrl;
output [31:0] read_mem_data;
output [31:0] mux_data_out;
output [4:0] WB_reg;
output [31:0] WB_result;
//output reg_write, mem_write, mem_read, ALU_Src, RegDst, mem_to_reg;

input clock;
input reset;

wire [31:0] pc_out, sign_ext_imme, inst_out, read_data_1, read_data_2, WB_result, ALU_result, mux_data_out, read_mem_data;  
wire [4:0] WB_reg;            
wire [2:0] ALU_ctrl;        
wire zero_flag, reg_write, mem_write, mem_read, ALU_Src, RegDst, mem_to_reg;


//-------------------------Program Counter------------------

pgm_cntr P1(.pc_out(pc_out), .sign_ext_imme(sign_ext_imme), .inst_out(inst_out), .zero_flag(zero_flag), .clock(clock), .reset(reset));

//----------------------Instruction Memory----------------------------

instr_ROM R1(.inst_out(inst_out), .pc_out(pc_out), .reset(reset));

//--------------------------Register File-----------------------------

reg_file R2(.read_data_1(read_data_1), .read_data_2(read_data_2), .inst_out(inst_out), .WB_result(WB_result), .WB_reg(WB_reg), .reset(reset), .clock(clock), .reg_write(reg_write));

//-------------------------Control Unit-----------------------------

ctrl_unit C1(.reg_write(reg_write), .mem_write(mem_write), .mem_read(mem_read), .ALU_Src(ALU_Src), .RegDst(RegDst), .mem_to_reg(mem_to_reg), .inst_out(inst_out), .reset(reset));

//------------------------------------Sign Extension---------------------

sign_ext S1(.sign_ext_imme(sign_ext_imme), .inst_out(inst_out), .reset(reset));

//------------------------------------ALU Unit--------------------

ALU_unit A2(.ALU_result(ALU_result), .zero_flag(zero_flag), .read_data_1(read_data_1), .mux_data_out(mux_data_out), .ALU_ctrl(ALU_ctrl), .reset(reset));

//------------------------------------------ALU Control----------------------

ALU_ctrl A1(.ALU_ctrl(ALU_ctrl), .inst_out(inst_out), .reset(reset));

//--------------------------------------Data Memory--------------------

data_RAM D1(.read_mem_data(read_mem_data), .ALU_result(ALU_result), .read_data_2(read_data_2), .mem_write(mem_write), .mem_read(mem_read), .clock(clock), .reset(reset));

//---------------------------------Multiplexer for selecting ALU input------------------------

mux_ALU M1(.mux_data_out(mux_data_out), .read_data_2(read_data_2), .sign_ext_imme(sign_ext_imme), .ALU_Src(ALU_Src));

//--------------------------------Multiplexer for selecting Destination Register------------------

mux_inst_type M2(.WB_reg(WB_reg), .inst_out(inst_out), .RegDst(RegDst));

//------------------------------Writeback Multiplexer------------------

mux_write_back M3(.WB_result(WB_result), .ALU_result(ALU_result), .read_mem_data(read_mem_data), .mem_to_reg(mem_to_reg));

endmodule

