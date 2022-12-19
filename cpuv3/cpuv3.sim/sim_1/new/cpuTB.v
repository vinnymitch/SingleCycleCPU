`timescale 1ns / 1ps
module cpuTB();
reg [15:0] AA; 
reg [15:0] BA; 
reg [15:0] DA;
reg [15:0] const_in;
reg [1:0]FS;
reg MB, MD, RW, MW;
reg clk;
reg reset;
reg [15:0]ADD;
reg [64:0] regmem [15:0];
reg [64:0] Dmem [15:0];

cpu c1(
.regmem(regmem),
.Dmem(Dmem),
.AA(AA),
.BA(BA),
.DA(DA),
.ADD(ADD),
.const_in(const_in),
.FS(FS),
.MB(MB),
.MD(MD),
.RW(RW),
.MW(MW),
.clk(clk),
.reset(reset)
);

initial clk = 0;
always #100 clk=~clk;

initial begin
reset = 1; AA=0; BA=0; DA=0; ADD=0; const_in=0; FS = 2'b00; MB = 0; MD = 0; RW = 0; MW = 0; regmem[AA] = 0; Dmem[ADD]=0;
#100 reset = 0; AA=1; BA=2; DA=3; ADD=0; const_in=0; FS = 2'b00; MB = 0; MD = 0; RW = 1; MW = 0; regmem[AA] = 2; regmem[BA]=3; //Load R[1] and R[2] A=2 B=3
#100 reset = 0; AA=1; BA=2; DA=3; ADD=0; const_in=0; FS = 2'b10; MB = 0; MD = 0; RW = 1; MW = 0; //Perform ALU Multiplication then store in Reg[0]
#100 reset = 0; AA=4; BA=5; DA=6; ADD=0; const_in=0; FS = 2'b00; MB = 0; MD = 0; RW = 1; MW = 0; regmem[AA] = 4; regmem[BA]=5; //Load R[4] and R[5] A=4 B=5
#100 reset = 0; AA=4; BA=5; DA=6; ADD=0; const_in=0; FS = 2'b10; MB = 0; MD = 0; RW = 1; MW = 0; //Perform ALU Multiplication then store in Reg[6]
#100 reset = 0; AA=6; BA=3; DA=7; ADD=0; const_in=0; FS = 2'b01; MB = 0; MD = 0; RW = 1; MW = 0; //Load Reg[6] and Reg[3] then perform ALU Addition and store in Reg[7}

end
endmodule
