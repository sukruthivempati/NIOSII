Test bench: NIOS_II_tb.v

`timescale 1ns/1ps
module NIOS_II_tb();
reg clock;
reg reset;

wire [31:0] pc_out, sign_ext_imme, inst_out, read_data_1, read_data_2, WB_result, ALU_result, mux_data_out, read_mem_data;  
wire [4:0] WB_reg;            
wire [2:0] ALU_ctrl;        
wire zero_flag;//, reg_write, mem_write, mem_read, ALU_Src, RegDst, mem_to_reg;

NIOS_II N1(.pc_out(pc_out), .inst_out(inst_out), .read_data_1(read_data_1), .read_data_2(read_data_2), .sign_ext_imme(sign_ext_imme), .ALU_result(ALU_result), .zero_flag(zero_flag), .ALU_ctrl(ALU_ctrl), .read_mem_data(read_mem_data), .mux_data_out(mux_data_out), .WB_reg(WB_reg), .WB_result(WB_result), .clock(clock), .reset(reset));

initial
begin
$dumpfile("NIOS_II.vcd");
$dumpvars(0,NIOS_II_tb);
 clock = 1'b1; reset = 1'b1;
#10 reset = 1'b0;
#100000 $finish;
end

always
begin
#5 clock = ~clock;
end
endmodule
