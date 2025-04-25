`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 16:02:28
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
input[5:0] op,
output reg RegDst, AluSrc, MemtoReg,RegWrite,Memread, MemWrite, Branch,
output reg[1:0] AluOp 
);
    
always@* begin
case(op)
6'd0: {RegDst, AluSrc, MemtoReg,RegWrite,Memread, MemWrite, Branch,AluOp}= 9'b100100010;
6'd35:{RegDst, AluSrc, MemtoReg,RegWrite,Memread, MemWrite, Branch,AluOp}= 9'b011110000;
6'd43:{RegDst, AluSrc, MemtoReg,RegWrite,Memread, MemWrite, Branch,AluOp}= 9'bx1x001000;
6'd4:{RegDst, AluSrc, MemtoReg,RegWrite,Memread, MemWrite, Branch,AluOp}= 9'bx0x000101;
default:{RegDst, AluSrc, MemtoReg,RegWrite,Memread, MemWrite, Branch,AluOp} = 9'd0;
endcase
end       
    
    
endmodule
