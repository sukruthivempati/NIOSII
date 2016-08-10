//ALU: ALU_unit.v

`timescale 1ns/1ps
module ALU_unit (ALU_result, zero_flag, read_data_1, mux_data_out, ALU_ctrl, reset);
output [31:0] ALU_result;
output zero_flag;
input [31:0] read_data_1, mux_data_out;
input [2:0] ALU_ctrl;
input reset;
 
reg [31:0] ALU_result;
reg zero_flag;
	
always@(*)
 begin
   if(reset)
     ALU_result <= 32'b0;
   else
     begin
       case(ALU_ctrl)
	         3'b001: ALU_result <= read_data_1 + mux_data_out;
		 3'b010: ALU_result <= read_data_1 - mux_data_out;
		 3'b011: ALU_result <= read_data_1 * mux_data_out;
		 3'b100: ALU_result <= read_data_1 | mux_data_out;
		 3'b101: ALU_result <= read_data_1 < mux_data_out;
	         default: ALU_result <= 32'b0;
	endcase
    
     end
 end
always@(reset or ALU_result)
 begin
  if(reset)
   zero_flag <= 1'b0;
  else if(ALU_result==0)
   zero_flag <= 1'b1;
  else
   zero_flag <= 1'b0;
 end  
endmodule
