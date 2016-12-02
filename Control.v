`define R_type_Op	6'b000000
`define Addi_Op		6'b001000
`define Lw_Op		6'b100011
`define Sw_Op		6'b101011
`define Beq_Op		6'b000100
`define Jump_Op		6'b000010

`define R_type_ALUOp	2'b00
`define Add_ALUOp		2'b01
`define Subtract_ALUOp	2'b10

module Control
(
    Op_i,
    RegDst_o,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o,
    MemtoReg_o,
    MemWrite_o,
    Branch_o,
    Jump_o,
    ExtOp_o
);

input 	[5:0] 	Op_i;
output			RegDst_o, ALUSrc_o, RegWrite_o, MemtoReg_o, MemWrite_o, Branch_o, Jump_o, ExtOp_o;
output 	[1:0] 	ALUOp_o;

reg 			RegDst, ALUSrc, RegWrite, MemtoReg, MemWrite, Branch, Jump, ExtOp;
reg 	[1:0] 	ALUOp;

assign RegDst_o = RegDst;
assign ALUSrc_o = ALUSrc;
assign RegWrite_o = RegWrite
assign MemtoReg_o = MemtoReg;
assign MemWrite_o = MemWrite;
assign Branch_o = Branch;
assign Jump_o = Jump;
assign ExtOp_o = ExtOp;
assign ALUOp_o = ALUOp;

always@(Op_i) begin
	
	case(Op_i)
		`R_type_Op: begin
				RegDst 	<= 1'b1;			
				ALUSrc	<= 1'b0;
				MemtoReg 	<= 1'b0;
				RegWrite	<= 1'b1;	
				MemWrite 	<= 1'b0;
				Branch 	<= 1'b0;
				Jump 	<= 1'b0;
				ALUOp 	<= `R_type_ALUOp;
			end
		`Addi_Op: begin
				RegDst	<= 1'b0;			
				ALUSrc	<= 1'b1;
				MemtoReg 	<= 1'b0;
				RegWrite	<= 1'b1;				
				MemWrite 	<= 1'b0;
				Branch 	<= 1'b0;
				Jump 	<= 1'b0;
				ExtOp 	<= 1'b0;
				ALUOp	<= `Add_ALUOp;
			end
		`Lw_Op: begin
				RegDst	<= 1'b0;
				ALUSrc	<= 1'b1;
				MemtoReg 	<= 1'b1;
				RegWrite	<= 1'b1;
				MemWrite 	<= 1'b0;
				Branch 	<= 1'b0;
				Jump 	<= 1'b0;
				ExtOp 	<= 1'b1;
				ALUOp	<= `Add_ALUOp;
			end
		`Sw_Op: begin
				ALUSrc	<= 1'b1;
				RegWrite	<= 1'b0;
				MemWrite 	<= 1'b1;
				Branch 	<= 1'b0;
				Jump 	<= 1'b0;
				ExtOp 	<= 1'b1;
				ALUOp	<= `Add_ALUOp;
			end
		`Beq_Op: begin
				ALUSrc	<= 1'b0;
				RegWrite	<= 1'b0;
				MemWrite 	<= 1'b0;
				Branch 	<= 1'b1;
				Jump 	<= 1'b0;
				ALUOp	<= `Subtract_ALUOp;
			end
		`Jump_Op: begin
				RegWrite	<= 1'b0;
				MemWrite 	<= 1'b0;
				Branch 	<= 1'b0;
				Jump 	<= 1'b1;
			end
		default: begin
				RegDst	<= 1'b0;			
				ALUSrc	<= 1'b0;
				MemtoReg 	<= 1'b0;
				RegWrite	<= 1'b0;				
				MemWrite 	<= 1'b0;
				Branch 	<= 1'b0;
				Jump 	<= 1'b0;
				ExtOp 	<= 1'b0;
				ALUOp	<= `Add_ALUOp;
			end
	endcase
end

endmodule