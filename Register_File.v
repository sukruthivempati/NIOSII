//Register File: reg_file.v

`timescale 1ns/1ps
module reg_file (read_data_1, read_data_2, inst_out, WB_result, WB_reg, reset, clock, reg_write);
output [31:0] read_data_1, read_data_2;
input [31:0] WB_result,inst_out;
input [4:0] WB_reg;
input reset, clock, reg_write;
reg [31:0] read_data_1, read_data_2;
reg [31:0] register [0:31];  
//wire enable;

//assign WB_reg = (enable) ? inst_out[21:17] : inst_out[26:22];  //enable = 1, R-type 
//assign sign_ext_imme[15:0] = inst_out[15:0];
//assign sign_ext_imme[31:16] = inst_out[15];

//always@(inst_out[31:27] or inst_out[26:22] or reset)
always@(inst_out)
 begin
   if(reset)
      begin 
	read_data_1 <= 32'b0;
        read_data_2 <= 32'b0;
      end
   else
      begin
	read_data_1 <= register[inst_out[31:27]];
	read_data_2 <= register[inst_out[26:22]];
      end
 end

always@(posedge (clock) or posedge (reset))
 begin
  if(reset)
    begin 
		register [0] <= 32'b0;
	 /*	register [1] <= 32'b1;
		register [2] <= 32'b10;
		register [3] <= 32'b11;
		register [4] <= 32'b100;
		register [5] <= 32'b101;
		register [6] <= 32'b110;
		register [7] <= 32'b111;
		register [8] <= 32'b1000;
		register [9] <= 32'b1001;
		register [10] <= 32'b1010;
		register [11] <= 32'b1011;
		register [12] <= 32'b1100;
		register [13] <= 32'b1101;
		register [14] <= 32'b1110;
		register [15] <= 32'b1111;
		register [16] <= 32'b10000;
		register [17] <= 32'b10001;
		register [18] <= 32'b10010;
		register [19] <= 32'b10011;
		register [20] <= 32'b10100;
		register [21] <= 32'b10101;
		register [22] <= 32'b10110;
		register [23] <= 32'b10111;
		register [24] <= 32'b11000;
		register [25] <= 32'b11001;
		register [26] <= 32'b11010;
		register [27] <= 32'b11011;
		register [28] <= 32'b11100;
		register [29] <= 32'b11101;
		register [30] <= 32'b11110;
		register [31] <= 32'b11111;      */
                register [1] <= 32'b0;
		register [2] <= 32'b0;
		register [3] <= 32'b0;
		register [4] <= 32'b0;
		register [5] <= 32'b0;
		register [6] <= 32'b0;
		register [7] <= 32'b0;
		register [8] <= 32'b0;
		register [9] <= 32'b0;
		register [10] <= 32'b0;
		register [11] <= 32'b0;
		register [12] <= 32'b0;
		register [13] <= 32'b0;
		register [14] <= 32'b0;
		register [15] <= 32'b0;
		register [16] <= 32'b0;
		register [17] <= 32'b0;
		register [18] <= 32'b0;
		register [19] <= 32'b0;
		register [20] <= 32'b0;
		register [21] <= 32'b0;
		register [22] <= 32'b0;
		register [23] <= 32'b0;
		register [24] <= 32'b0;
		register [25] <= 32'b0;
		register [26] <= 32'b0;
		register [27] <= 32'b0;
		register [28] <= 32'b0;
		register [29] <= 32'b0;
		register [30] <= 32'b0;
		register [31] <= 32'b0;

	 end
	 
	else if(reg_write)
          register[WB_reg] <= WB_result;
 end
  endmodule
