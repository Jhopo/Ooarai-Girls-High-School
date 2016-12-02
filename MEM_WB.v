module MEM_WB
(
    clk_i,

    RegWrite_i, 
    MemtoReg_i, 
    ExtOp_i,
    RegWrite_o,
    MemtoReg_o,
    ExtOp_o,

    Read_data_i,
    Read_data_o,

    ALUdata_i,  
    ALUdata_o, 

    instr_i,
    instr_o,
);

input           clk_i;
input           RegWrite_i, MemtoReg_i, ExtOp_i;
output          RegWrite_o, MemtoReg_o, ExtOp_o;
input   [31:0]  Read_data_i;
output  [31:0]  Read_data_o;
input   [31:0]  ALUdata_i;
output  [31:0]  ALUdata_o;
input   [4:0]   instr_i;
output  [4:0]   instr_o;

reg             RegWrite_in, MemtoReg_in, ExtOp_in;
reg             RegWrite_out, MemtoReg_out, ExtOp_out;
reg     [31:0]  Read_data_i;
reg     [31:0]  Read_data_o;
reg     [31:0]  ALUdata_i;
reg     [31:0]  ALUdata_o;
reg     [4:0]   instr_in;
reg     [4:0]   instr_out;

assign RegWrite_o = RegWrite_out;
assign MemtoReg_o = MemtoReg_out;
assign ExtOp_o = ExtOp_out;
assign Read_data_o = Read_data_out;
assign ALUdata_o = ALUdata_out;
assign instr_o = instr_out;

always@(posedge clk_i) begin
    RegWrite_out <= RegWrite_in;
    MemtoReg_out <= MemtoReg_in;
    ExtOp_out <= ExtOp_in;
    Read_data_out <= Read_data_in;
    ALUdata_out <= ALUdata_in;
    instr_out <= instr_in;
end

always@(posedge clk_i) begin
    RegWrite_in <= RegWrite_i;
    MemtoReg_in <= MemtoReg_i;
    ExtOp_in <= ExtOp_i;
    Read_data_in <= Read_data_i;
    ALUdata_in <= ALUdata_i;
    instr_in <= instr_i;
end

endmodule