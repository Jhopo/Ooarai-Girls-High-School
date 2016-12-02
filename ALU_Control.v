`define R_type_ALUOp	2'b00
`define Add_ALUOp		2'b01
`define Subtract_ALUOp	2'b10

`define ADD 	6'b100000
`define MUL 	6'b011000
`define SUB 	6'b100010
`define AND 	6'b100100
`define OR 		6'b100101

`define ADD_ALUCtrl	3'b000
`define MUL_ALUCtrl 3'b001
`define SUB_ALUCtrl 3'b010
`define AND_ALUCtrl 3'b011
`define OR_ALUCtrl 	3'b100

module ALU_Control
(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);

input 	[5:0]	funct_i;
input	[1:0]	ALUOp_i;
output 	[2:0]	ALUCtrl_o;

reg 	[2:0]	ALUCtrl;

assign ALUCtrl_o = ALUCtrl;

always@(funct_i or ALUOp_i) begin
	
	if(ALUOp_i == `Add_ALUOp) begin
		ALUCtrl <= `ADD_ALUCtrl;
	end

	else if(ALUOp_i == `Subtract_ALUOp) begin
		ALUCtrl <= `SUB_ALUCtrl;
	end

	else if(ALUOp_i == R_type_ALUOp) begin
		case(funct_i)
			`ADD: 
				ALUCtrl	<= `ADD_ALUCtrl;
			`MUL: 
				ALUCtrl	<= `MUL_ALUCtrl;
			`SUB: 
				ALUCtrl	<= `SUB_ALUCtrl;
			`AND: 
				ALUCtrl	<= `AND_ALUCtrl;
			`OR: 
				ALUCtrl	<= `OR_ALUCtrl;
			default:
				ALUCtrl <= `ADD_ALUCtrl;
		endcase
	end
end

endmodule