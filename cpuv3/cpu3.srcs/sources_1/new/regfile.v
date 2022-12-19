`timescale 1ns / 1ps
module regfile(
input [15:0] AA, //A ADDR
input [15:0] BA, //B ADDR
input [15:0] DA, //D ADDR
input [15:0] D, //DATA from ALU or from RAM
input RW, //Register Write; When RW = 1 Write. 
input clk, reset,
output reg [15:0] A, //Register A output
output reg [15:0] B, //Register B output
input reg [64:0] regmem [15:0]
); //15 memory registers each 64 bits wide. 
integer i;

always@(*)
begin if(reset ==1)
for (i=0; i<16; i=i+1) begin
regmem[i]=0;
end
else if(reset == 0) begin
if(RW == 1)
regmem[DA] <= D;
A <= regmem[AA];
B <= regmem[BA]; 
end
end
endmodule