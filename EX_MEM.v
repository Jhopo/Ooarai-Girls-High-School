module EX_MEM
(
    clk_i,

    RegWrite_i, 
    MemtoReg_i, 
    MemWrite_i,  
    ExtOp_i,
    RegWrite_o,
    MemtoReg_o,
    MemWrite_o,
    ExtOp_o,

    ALUdata_i,  
    ALUdata_o,

    Write_data_i,
    Write_data_o,

    instr_i,
    instr_o,
);

input           clk_i;
input           RegWrite_i, MemtoReg_i, MemWrite_i, ExtOp_i;
output          RegWrite_o, MemtoReg_o, MemWrite_o, ExtOp_o;
input   [31:0]  ALUdata_i;
output  [31:0]  ALUdata_o;
input   [31:0]  Write_data_i;
output  [31:0]  Write_data_o;
input   [4:0]   instr_i;
output  [4:0]   instr_o;

reg             RegWrite_in, MemtoReg_in, MemWrite_in, ExtOp_in;
reg             RegWrite_out, MemtoReg_out, MemWrite_out, ExtOp_out;
reg     [31:0]  ALUdata_in;
reg     [31:0]  ALUdata_out;
reg     [31:0]  Write_data_in;
reg     [31:0]  Write_data_out;
reg     [4:0]   instr_in;
reg     [4:0]   instr_out;

assign RegWrite_o = RegWrite_out;
assign MemtoReg_o = MemtoReg_out;
assign MemWrite_o = MemWrite_out;
assign ExtOp_o = ExtOp_out;
assign ALUdata_o = ALUdata_out;
assign Write_data_o = Write_data_out;
assign instr_o = instr_out;

always@(posedge clk_i) begin
    RegWrite_out <= RegWrite_in;
    MemtoReg_out <= MemtoReg_in;
    MemWrite_out <= MemWrite_in;
    ExtOp_out <= ExtOp_in;
    ALUdata_out <= ALUdata_in;
    Write_data_out <= Write_data_in;
    instr_out <= instr_in;
end

always@(posedge clk_i) begin
    RegWrite_in <= RegWrite_i;
    MemtoReg_in <= MemtoReg_i;
    MemWrite_in <= MemWrite_i;
    ExtOp_in <= ExtOp_i;
    ALUdata_in <= ALUdata_i;
    Write_data_in <= Write_data_i;
    instr_in <= instr_i;
end

endmodule