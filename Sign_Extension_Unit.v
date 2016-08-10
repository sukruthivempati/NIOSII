//Sign_Extension: sign_ext.v

`timescale 1ns/1ps
module sign_ext(sign_ext_imme,inst_out,reset);
output [31:0] sign_ext_imme;
input [31:0] inst_out;
input reset;
reg [31:0] sign_ext_imme;
always@(inst_out)
//always@(posedge clock)
 begin
   if(reset)
      sign_ext_imme <= 32'b0;
   else
     begin
       sign_ext_imme [15:0] <= inst_out[21:6];
       sign_ext_imme[31:16] <= {16{inst_out[21]}};
     end
 end
endmodule

