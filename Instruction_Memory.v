Instruction Memory: instr_ROM.v

`timescale 1ns/1ps
module instr_ROM (inst_out,pc_out,reset);
output [31:0]inst_out;
input [31:0] pc_out;
input reset;
//input clock;
reg [31:0] inst_out;
reg [7:0] mem[0:255];
always@(pc_out or reset)
 begin 
   if(reset==1)
      begin
          mem[0] <= 8'b00110100;     //orhi for Avector, instruction 1
          mem[1] <= 8'b00000000;
          mem[2] <= 8'b10000000;
          mem[3] <= 8'b00000000;

          mem[4] <= 8'b00010100;     //ori for Avector, instruction 2
          mem[5] <= 8'b00000101;
          mem[6] <= 8'b10000000;
          mem[7] <= 8'b00010000;

          mem[8] <= 8'b00110100;     //orhi for Bvector, instruction 3
          mem[9] <= 8'b00000000;
          mem[10] <= 8'b11000000;
          mem[11] <= 8'b00000000;
           
          mem[12] <= 8'b00010100;     //ori for Bvector, instruction 4
          mem[13] <= 8'b00001111;
          mem[14] <= 8'b11000000;	
          mem[15] <= 8'b00011000;

          mem[16] <= 8'b00110100;       //orhi for N, instuction 5
          mem[17] <= 8'b00000000;
          mem[18] <= 8'b00000000;
          mem[19] <= 8'b00000001;

          mem[20] <= 8'b00010100;       //ori for N, instruction 6
          mem[21] <= 8'b00000010;
          mem[22] <= 8'b00000000;
          mem[23] <= 8'b00100001;

          mem[24] <= 8'b00010111;       //ldw, instruction 7
          mem[25] <= 8'b00000000;
          mem[26] <= 8'b00000000;
          mem[27] <= 8'b00100001;

          mem[28] <= 8'b00111010;        //add, instruction 8
          mem[29] <= 8'b10001000;
          mem[30] <= 8'b00001011;
          mem[31] <= 8'b00000000;
  
          mem[32] <= 8'b00010111;        //loop: ldw, instruction 9
          mem[33] <= 8'b00000000;
          mem[34] <= 8'b10000000;
          mem[35] <= 8'b00010001;

          mem[36] <= 8'b00010111;        //ldw, instruction 10
          mem[37] <= 8'b00000000;
          mem[38] <= 8'b11000000;
          mem[39] <= 8'b00011001;

          mem[40] <= 8'b00111010;        //mul, instruction 11
          mem[41] <= 8'b00111000;
          mem[42] <= 8'b11010001;
          mem[43] <= 8'b00110001;
 
          mem[44] <= 8'b00111010;        //add, instruction 12
          mem[45] <= 8'b10001000;
          mem[46] <= 8'b00001011;
          mem[47] <= 8'b00101010;

          mem[48] <= 8'b00000100;        // addi, instruction 13
          mem[49] <= 8'b00000001;
          mem[50] <= 8'b10000000;
          mem[51] <= 8'b00010000;

          mem[52] <= 8'b00000100;         //addi, instruction 14
          mem[53] <= 8'b00000001;
          mem[54] <= 8'b11000000;
          mem[55] <= 8'b00011000;
     
          mem[56] <= 8'b11000100;     //addi, instruction 15
          mem[57] <= 8'b11111111;
          mem[58] <= 8'b00111111;
          mem[59] <= 8'b00100001;

          mem[60] <= 8'b00010110;     // blt, instruction 16
          mem[61] <= 8'b00001000;
          mem[62] <= 8'b00000000;
          mem[63] <= 8'b00000001;

          mem[64] <= 8'b00010101;       //stw, instruction 17
          mem[65] <= 8'b00011001;
          mem[66] <= 8'b01000000;
          mem[67] <= 8'b00000001;

          mem[68] <= 8'b00000110;        // stop: br, instruction 18
          mem[69] <= 8'b00010001;
          mem[70] <= 8'b00000000;
          mem[71] <= 8'b00000000;

       
	  inst_out[31:0] <= 32'b0;
	end
        else
	 begin
	 inst_out[7:0] <= mem[pc_out];
	 inst_out[15:8] <= mem[pc_out+1];
	 inst_out[23:16] <= mem[pc_out+2];
	 inst_out[31:24] <= mem[pc_out+3];
	 end
 end
endmodule
