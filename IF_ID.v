module IF_ID
(
    clk_i,
    instr_i,    
    pc_i,   
    flush_i, 
    hazard_i, //not finished yet
    instr_o,
    pc_o
);

input               clk_i;
input 	[31:0]		instr_i;
input 	[31:0] 		pc_i;
input 				flush_i;
input 				hazard_i;
output 	[31:0]		instr_o;
output 	[31:0] 		pc_o;

reg 	[31:0] 		instr_in;
reg 	[31:0] 		pc_in;
reg 	[31:0] 		instr_out;
reg 	[31:0] 		pc_out;

assign	instr_o = instr_out;
assign	pc_o = pc_out;

always@(posedge clk_i) begin
	instr_out <= instr_in;
	pc_out <= pc_in;
end

always@(negedge clk_i) begin
	if(flush_i == 1'b0) begin
		instr_in <= instr_i;
		pc_in <= pc_i;
	end
	else begin
		instr_in <= 32'b11111111111111111111111111111111;
		pc_in <= 32'b0;
	end

end


endmodule