`timescale 1ns / 1ps
module muxd(
input [15:0] i0,
input [15:0] i1,
input MD,
input clk,
output reg [15:0] out
);


always@(clk or MD or i0 or i1)
begin case(MD)
0 : out <= i0;
1 : out <= i1;
endcase end
endmodule