`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2025 23:15:27
// Design Name: 
// Module Name: ins_memory
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


module ins_memory(input[31:0]read_adress,input clk,output[31:0]instruction);
reg [31:0] mem [255:0];
reg [31:0] ins;
always@(posedge clk) ins <=mem[read_adress[31:2]];
assign instruction =ins ;
endmodule
