`define ADD	3'b000
`define MUL 3'b001
`define SUB 3'b010
`define AND 3'b011
`define OR 	3'b100

module ALU
(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o,
    Zero_o
);

input 	[31:0]	data1_i, data2_i;
output 	[2:0] 	ALUCtrl_i;
output 	[31:0]	data_o;
output 			Zero_o;

reg 	[63:0]	temp;
reg 	[31:0]	temp_sub;

assign data_o = temp[31:0];
assign Zero_o = (temp_sub == 32'b0) ?1'b1 :1'b0;

always@(data1_i or data2_i or ALUCtrl_i) begin

	case(ALUCtrl_i)
		`ADD: 
			temp <= data1_i + data2_i;
		`MUL: 
			temp <= data1_i * data2_i;
		`SUB: 
			temp <= data1_i - data2_i;
		`AND: 
			temp <= data1_i & data2_i;
		`OR: 
			temp <= data1_i | data2_i;
		default:
			temp <= 64'b0;
	endcase

	begin
	temp_sub <= data1_i - data2_i;
	end

end

endmodule