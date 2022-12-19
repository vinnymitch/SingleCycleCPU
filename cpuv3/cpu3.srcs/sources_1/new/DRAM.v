`timescale 1ns / 1ps
module DRAM(
input [15:0] ADD, 
input [15:0] D_in, //address and data in
input MW, //MW memory write
input clk, 
output reg [15:0] D_out,
input reg [64:0] Dmem [15:0]
    );

always@(clk)
begin case(MW)
0 : D_out <= Dmem[ADD];
1 : Dmem[ADD] <= D_in;
endcase
end
endmodule
