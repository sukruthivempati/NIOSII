//ALU Control: ALU_ctrl.v

`timescale 1ns/1ps
module ALU_ctrl(ALU_ctrl, inst_out, reset);
output [2:0] ALU_ctrl;
input [31:0] inst_out;
input reset;

reg [2:0] ALU_ctrl;

always@(*)
 begin
   if(reset)
      ALU_ctrl <= 3'b000;
   else if(inst_out[5:0] == 6'b110100) // orhi
      ALU_ctrl <= 3'b001;
   else if(inst_out[5:0] == 6'b010100)  //ori
      ALU_ctrl <= 3'b001;
   else if (inst_out[5:0] == 6'b010111)  //ldw
      ALU_ctrl <= 3'b001;
   else if (inst_out[5:0] == 6'b111010 && inst_out[10:6] == 5'b00000 && inst_out[16:11] == 6'b110001)  //add
      ALU_ctrl <= 3'b001;
   else if (inst_out[5:0] == 6'b111010 && inst_out[10:6] == 5'b00000 && inst_out[16:11] == 6'b100111)     //mul
      ALU_ctrl <= 3'b011;
   else if (inst_out[5:0] == 6'b000100)  //addi
      ALU_ctrl <= 3'b001;
  else if (inst_out[5:0] == 6'b010110)  //blt
      ALU_ctrl <= 3'b101;
  else if (inst_out[5:0] == 6'b010101)  //stw
      ALU_ctrl <= 3'b001;
  else if (inst_out[5:0] == 6'b000110)  //br
      ALU_ctrl <= 3'b001;
 end
endmodule
