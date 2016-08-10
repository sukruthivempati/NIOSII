//Control Unit: ctrl_unit.v

`timescale 1ns/1ps
module ctrl_unit (reg_write,mem_write,mem_read,ALU_Src,RegDst,mem_to_reg,inst_out,reset);
output reg_write,mem_write,mem_read,ALU_Src,RegDst,mem_to_reg;
input [31:0]inst_out;
input reset;
reg reg_write,mem_write,mem_read,ALU_Src,RegDst,mem_to_reg;

always@(reset or inst_out)
//always@(posedge clock)
 begin
   if(reset)
      begin
	reg_write <= 1'b0;
	mem_write <= 1'b0;
	mem_read <= 1'b0;
	ALU_Src <= 1'b0;
	RegDst <= 1'b0;
	mem_to_reg <= 1'b0;
      end
   else
      begin
	case(inst_out[5:0])
	6'b110100:                         //orhi
	begin
	  reg_write <= 1'b1;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b1;
          RegDst <= 1'b0;
	  mem_to_reg <= 1'b0;
	end
	6'b010100:                         //ori
	begin 
	  reg_write <= 1'b1;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b1;
	  RegDst <= 1'b0;
	  mem_to_reg <= 1'b0;	
	end
	6'b010111:                      //ldw
	begin
	  reg_write <= 1'b1;
	  mem_write <= 1'b0;
	  mem_read <= 1'b1;
	  ALU_Src <= 1'b1;
	  RegDst <= 1'b0;
	  mem_to_reg <= 1'b1;
	end
	6'b111010:                      //add
	begin
	  reg_write <= 1'b1;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b0;
	  RegDst <= 1'b1;
	  mem_to_reg <= 1'b0;
	end
	6'b111010:                      //mul
	begin
	  reg_write <= 1'b1;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b0;
	  RegDst <= 1'b1;
	  mem_to_reg <= 1'b0;
	end
	6'b000100:                      //addi
	begin
	  reg_write <= 1'b1;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b1;
	  RegDst <= 1'b0;
	  mem_to_reg <= 1'b0;
	end
	6'b010110:                      //blt
	begin
	  reg_write <= 1'b0;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b0;
	  RegDst <= 1'b0;
	  mem_to_reg <= 1'b0;
	end
	6'b010101:                      //stw
	begin
	  reg_write <= 1'b0;
	  mem_write <= 1'b1;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b1;
	  RegDst <= 1'b0;
	  mem_to_reg <= 1'b0;
	end
        6'b000110:                      //br
	begin
	  reg_write <= 1'b0;
	  mem_write <= 1'b0;
	  mem_read <= 1'b0;
	  ALU_Src <= 1'b0;
	  RegDst <= 1'b0;
	  mem_to_reg <= 1'b0;
	end
	endcase
   end
end
endmodule
