//Data Memory: data_RAM.v

`timescale 1ns/1ps
module data_RAM (read_mem_data,ALU_result,read_data_2,mem_write,mem_read,clock,reset);
output [31:0] read_mem_data;
input [31:0] ALU_result,read_data_2;
input mem_write,mem_read,clock,reset;
reg [31:0] read_mem_data;
reg [7:0] data_mem [0:127];

always@(posedge clock)
//always@(*)
 begin
  if(reset)
    begin
     data_mem[0] <= 8'b00000000;
     data_mem[1] <= 8'b00000000;
     data_mem[2] <= 8'b00000000;
     data_mem[3] <= 8'b00000000;

     data_mem[4] <= 8'b00000000;
     data_mem[5] <= 8'b00000000;
     data_mem[6] <= 8'b00000000;
     data_mem[7] <= 8'b00000000;

     data_mem[8] <= 8'b00000110;
     data_mem[9] <= 8'b00000000;
     data_mem[10]<= 8'b00000000;
     data_mem[11] <= 8'b00000000;

     data_mem[12] <= 8'b00000000;
     data_mem[13] <= 8'b00000000;
     data_mem[14] <= 8'b00000000;
     data_mem[15] <= 8'b00000000;

     data_mem[16] <= 8'b00000000;
     data_mem[17] <= 8'b00000000;
     data_mem[18] <= 8'b00000000;
     data_mem[19] <= 8'b00000000;

     data_mem[20] <= 8'b00000101;
     data_mem[21] <= 8'b00000000;
     data_mem[22] <= 8'b00000000;
     data_mem[23] <= 8'b00000000;

     data_mem[24] <= 8'b00000011;
     data_mem[25] <= 8'b00000000;
     data_mem[26] <= 8'b00000000;
     data_mem[27] <= 8'b00000000;

     data_mem[28] <= 8'b00000110;
     data_mem[29] <= 8'b00000000;
     data_mem[30] <= 8'b00000000;
     data_mem[31] <= 8'b00000000;

     data_mem[32] <= 8'b00010011;
     data_mem[33] <= 8'b00000000;
     data_mem[34] <= 8'b00000000;
     data_mem[35] <= 8'b00000000;

     data_mem[36] <= 8'b00001000;
     data_mem[37] <= 8'b00000000;
     data_mem[38] <= 8'b00000000;
     data_mem[39] <= 8'b00000000;

     data_mem[40] <= 8'b00001100;
     data_mem[41] <= 8'b00000000;
     data_mem[42] <= 8'b00000000;
     data_mem[43] <= 8'b00000000;

     data_mem[44] <= 8'b00000000;
     data_mem[45] <= 8'b00000000;
     data_mem[46] <= 8'b00000000;
     data_mem[47] <= 8'b00000000;

     data_mem[48] <= 8'b00000000;
     data_mem[49] <= 8'b00000000;
     data_mem[50] <= 8'b00000000;
     data_mem[51] <= 8'b00000000;

     data_mem[52] <= 8'b00000000;
     data_mem[53] <= 8'b00000000;
     data_mem[54] <= 8'b00000000;
     data_mem[55] <= 8'b00000000;

     data_mem[56] <= 8'b00000000;
     data_mem[57] <= 8'b00000000;
     data_mem[58] <= 8'b00000000;
     data_mem[59] <= 8'b00000000;

     data_mem[60] <= 8'b00000010;
     data_mem[61] <= 8'b00000000;
     data_mem[62] <= 8'b00000000;
     data_mem[63] <= 8'b00000000;

     data_mem[64] <= 8'b00001110;
     data_mem[65] <= 8'b00000000;
     data_mem[66] <= 8'b00000000;
     data_mem[67] <= 8'b00000000;

     data_mem[68] <= 8'b00000011;
     data_mem[69] <= 8'b00000000;
     data_mem[70] <= 8'b00000000;
     data_mem[71] <= 8'b00000000;

     data_mem[72] <= 8'b00000010;
     data_mem[73] <= 8'b00000000;
     data_mem[74] <= 8'b00000000;
     data_mem[75] <= 8'b00000000;

     data_mem[76] <= 8'b00000101;
     data_mem[77] <= 8'b00000000;
     data_mem[78] <= 8'b00000000;
     data_mem[79] <= 8'b00000000;

     data_mem[80] <= 8'b00100100;
     data_mem[81] <= 8'b00000000;
     data_mem[82] <= 8'b00000000;
     data_mem[83] <= 8'b00000000;

     data_mem[84] <= 8'b00000000;
     data_mem[85] <= 8'b00000000;
     data_mem[86] <= 8'b00000000;
     data_mem[87] <= 8'b00000000;

     data_mem[88] <= 8'b00000000;
     data_mem[89] <= 8'b00000000;
     data_mem[90] <= 8'b00000000;
     data_mem[91] <= 8'b00000000;

     data_mem[92] <= 8'b00000000;
     data_mem[93] <= 8'b00000000;
     data_mem[94] <= 8'b00000000;
     data_mem[95] <= 8'b00000000;

     data_mem[96] <= 8'b00000000;
     data_mem[97] <= 8'b00000000;
     data_mem[98] <= 8'b00000000;
     data_mem[99] <= 8'b00000000;
     data_mem[100] <= 8'b00000000;

     data_mem[ALU_result]<= 8'b0;
  end
  else if(mem_write)
       begin
       data_mem[ALU_result] <= read_data_2[7:0];
       data_mem[ALU_result + 1] <= read_data_2[15:8];
       data_mem[ALU_result + 2] <= read_data_2[23:16];
       data_mem[ALU_result + 3] <= read_data_2[31:24];
       end
    else
       begin
       data_mem[ALU_result] <= data_mem[ALU_result];
       data_mem[ALU_result + 1] <= data_mem[ALU_result + 1];
       data_mem[ALU_result + 2] <= data_mem[ALU_result + 2];
       data_mem[ALU_result + 3] <= data_mem[ALU_result + 3];
       end
 end

//always@(posedge clock)
always@(*)
 begin
  if(reset)
    read_mem_data <= 32'b0;
  else if(mem_read)
    begin
    read_mem_data[7:0] <= data_mem[ALU_result];
    read_mem_data[15:8] <= data_mem[ALU_result + 1];
    read_mem_data[23:16] <= data_mem[ALU_result + 2];
    read_mem_data[31:24] <= data_mem[ALU_result + 3];
    end
  else
    read_mem_data <= 32'b0;
 end
 
endmodule