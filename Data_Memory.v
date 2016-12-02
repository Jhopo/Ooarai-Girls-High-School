module Data_Memory
(
    clk_i,
    addr_i,
    MemWrite_i,
    MemRead_i,
    data_i,
    data_o
);

// Interface
input               clk_i;
input   [31:0]      addr_i;
input         		MemWrite_i;
input 				MemRead_i;
intput	[31:0]		data_i;
output  [31:0]      data_o;

// Data memory
reg     [31:0]		memory 	[0:32];

// Read Data
assign  data_o = (MemRead_i == 1'b1) ?memory[addr_i>>2] :32'b0;

// Write Data   
always@(negedge clk_i) begin
    if(MemWrite_i)
        memory[addr_i>>2] <= data_i;
end

endmodule