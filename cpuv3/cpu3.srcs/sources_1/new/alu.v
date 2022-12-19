`timescale 1ns / 1ps
module alu(
    input [15:0] A,
    input [15:0] B,
    input [1:0]  FS,
    output reg [15:0]F
);

always@(*) 
begin case(FS)
    2'b00 : F = F;
    2'b01 : F = A + B;
    2'b10 : F = A*B;
    endcase
end
endmodule