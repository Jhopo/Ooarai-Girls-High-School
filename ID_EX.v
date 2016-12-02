module ID_EX
(
    clk_i,

    RegDst_i, 
    ALUOp_i,
    ALUSrc_i, 
    RegWrite_i, 
    MemtoReg_i, 
    MemWrite_i,  
    ExtOp_i,
    RegDst_o,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o,
    MemtoReg_o,
    MemWrite_o,
    ExtOp_o,

    pc_i,
    pc_o,

    RSdata_i, 
    RTdata_i,
    RSdata_o, 
    RTdata_o,

    Sign_Extend_data_i,
    Sign_Extend_data_o,

    instr_25_21_i,
    instr_20_16a_i,
    instr_20_16b_i,
    instr_15_11_i,
    instr_25_21_o,
    instr_20_16a_o,
    instr_20_16b_o,
    instr_15_11_o,
);

input           clk_i;
input			RegDst_i, ALUSrc_i, RegWrite_i, MemtoReg_i, MemWrite_i, ExtOp_i;
output			RegDst_o, ALUSrc_o, RegWrite_o, MemtoReg_o, MemWrite_o, ExtOp_o;
input 	[1:0] 	ALUOp_i;
output 	[1:0] 	ALUOp_o;
input 	[31:0]	pc_i;
output 	[31:0]	pc_o;
input 	[31:0] 	RSdata_i; 
input   [31:0]	RTdata_i;
output  [31:0]	RSdata_o;
output  [31:0]	RTdata_o;
input   [31:0]	Sign_Extend_data_i;
output  [31:0]	Sign_Extend_data_o;
input   [4:0]	instr_25_21_i;
input   [4:0]	instr_20_16a_i;
input   [4:0]	instr_20_16b_i;
input   [4:0]	instr_15_11_i;
output  [4:0]	instr_25_21_o;
output  [4:0]	instr_20_16a_o;
output  [4:0]	instr_20_16b_o;
output  [4:0]	instr_15_11_o;

reg				RegDst_in, ALUSrc_in, RegWrite_in, MemtoReg_in, MemWrite_in, ExtOp_in;
reg				RegDst_out, ALUSrc_out, RegWrite_out, MemtoReg_out, MemWrite_out, ExtOp_out;
reg 	[1:0] 	ALUOp_in;
reg 	[1:0] 	ALUOp_out;
reg 	[31:0]	pc_in;
reg 	[31:0]	pc_out;
reg 	[31:0] 	RSdata_in; 
reg   	[31:0]	RTdata_in;
reg  	[31:0]	RSdata_out;
reg 	[31:0]	RTdata_out;
reg   	[31:0]	Sign_Extend_data_in;
reg  	[31:0]	Sign_Extend_data_out;
reg   	[5:0]	instr_25_21_in;
reg   	[5:0]	instr_20_16a_in;
reg  	[5:0]	instr_20_16b_in;
reg  	[5:0]	instr_15_11_in;
reg  	[5:0]	instr_25_21_out;
reg  	[5:0]	instr_20_16a_out;
reg  	[5:0]	instr_20_16b_out;
reg  	[5:0]	instr_15_11_out;

assign RegDst_o = RegDst_out;
assign ALUSrc_o = ALUSrc_out;
assign RegWrite_o = RegWrite_out;
assign MemtoReg_o = MemtoReg_out;
assign MemWrite_o = MemWrite_out;
assign ExtOp_o = ExtOp_out;
assign ALUOp_o = ALUOp_out;
assign pc_o = pc_out;
assign RSdata_o = RSdata_out;
assign RTdata_o = RTdata_out;
assign Sign_Extend_data_o = Sign_Extend_data_out;
assign instr_25_21_o = instr_25_21_out;
assign instr_20_16a_o = instr_20_16a_out;
assign instr_20_16b_o = instr_20_16b_out;
assign instr_15_11_o = instr_15_11_out;

always@(posedge clk_i) begin
	RegDst_out <= RegDst_in;
	ALUSrc_out <= ALUSrc_in;
	RegWrite_out <= RegWrite_in;
	MemtoReg_out <= MemtoReg_in;
	MemWrite_out <= MemWrite_in;
	ExtOp_out <= ExtOp_in;
	ALUOp_out <= ALUOp_in;
	pc_out <= pc_in;
	RSdata_out <= RSdata_in;
	RTdata_out <= RTdata_in;
	Sign_Extend_data_out <= Sign_Extend_data_in;
	instr_25_21_out <= instr_25_21_in;
	instr_20_16a_out <= instr_20_16a_in;
	instr_20_16b_out <= instr_20_16b_in;
	instr_15_11_out <= instr_15_11_in;
end

always@(negedge clk_i) begin
	RegDst_in <= RegDst_i;
	ALUSrc_in <= ALUSrc_i;
	RegWrite_in <= RegWrite_i;
	MemtoReg_in <= MemtoReg_i;
	MemWrite_in <= MemWrite_i;
	ExtOp_in <= ExtOp_i;
	ALUOp_in <= ALUOp_i;
	pc_in <= pc_i;
	RSdata_in <= RSdata_i;
	RTdata_in <= RTdata_i;
	Sign_Extend_data_in <= Sign_Extend_data_i;
	instr_25_21_in <= instr_25_21_i;
	instr_20_16a_in <= instr_20_16a_i;
	instr_20_16b_in <= instr_20_16b_i;
	instr_15_11_in <= instr_15_11_i;
end

endmodule