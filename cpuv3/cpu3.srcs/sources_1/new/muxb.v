`timescale 1ns / 1ps
module muxb(
input [15:0] i0,
input [15:0] i1,
input MB,
input clk,
output reg [15:0] out
);


always@(clk or MB or i0 or i1)
begin case(MB)
0 : out <= i0;
1 : out <= i1;
endcase end
endmodule