`timescale 1ns / 1ps
module cpu(
input [15:0]AA,
input [15:0]BA,
input [15:0]DA, 
input RW,         //Register Write
input MW,         //DRAM Select
input MD,         //Mux D Select
input MB,         //Mux B Select
input [1:0] FS,   //ALU Function Selection
input [15:0] ADD, //DRAM ADDRESS
input reset,
input clk,
input [15:0] const_in,
output reg [64:0] regmem [15:0],
output reg [64:0] Dmem [15:0]
);
wire [15:0] muxd_out;
wire [15:0] muxb_out;
wire [15:0] DRAM_out;
wire [15:0] A;
wire [15:0] B;
wire [15:0] alu_out;

regfile r1(
.AA(AA),
.BA(BA),
.DA(DA),
.RW(RW),
.regmem(regmem),
.clk(clk),
.reset(reset),
.D(muxd_out),
.A(A),
.B(B)
);

muxb mb(
.MB(MB),
.i0(B),
.i1(const_in),
.clk(clk),
.out(muxb_out)
);

alu a1(
.A(A),
.B(muxb_out),
.FS(FS),
.F(alu_out)
);

DRAM d1(
.D_in(muxb_out),
.ADD(ADD),
.MW(MW),
.clk(clk),
.D_out(DRAM_out)
);

muxd md(
.MD(MD),
.i0(alu_out),
.i1(DRAM_out),
.clk(clk),
.out(muxd_out)
);

endmodule