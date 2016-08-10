//Program Counter: pgm_cntr.v

`timescale 1ns/1ps
module pgm_cntr(pc_out, sign_ext_imme, inst_out, zero_flag, clock, reset);
output [31:0] pc_out;
input [31:0] sign_ext_imme;
input [31:0] inst_out;
input zero_flag, clock, reset;

reg [31:0] pc_out;


always@(posedge (clock) or posedge (reset))
 begin
   if(reset)
     begin
       pc_out <= 32'b0;
     end
   else
    begin
      //pc_out <= pc_out + 32'b100;
 
    if(zero_flag == 1'b0 && (inst_out[5:0] == 6'b010110)) // blt instruction   
      pc_out <= sign_ext_imme;
   else if(zero_flag == 1'b1 && (inst_out[5:0] == 6'b000110)) // br instruction
      pc_out <= sign_ext_imme; 
   //else if(zero_flag == 1'b0)
     else
      pc_out <= pc_out + 32'b100;
    end
 end
endmodule
