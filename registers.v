`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2025 23:15:27
// Design Name: 
// Module Name: registers
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


module registers(input [4:0] read_reg1,read_reg2,write_reg,input clk,input[31:0] write_data,output [31:0] read_data1,read_data2);
reg [31:0] read_data1_reg,read_data2_reg;
reg [31:0] mem [31:0];
always@(posedge clk)
begin
read_data1_reg<=mem[read_reg1];
read_data2_reg<=mem[read_reg2];
mem[write_reg]<=write_data;
end
endmodule
