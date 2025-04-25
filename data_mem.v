`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2025 23:15:27
// Design Name: 
// Module Name: data_mem
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


module data_mem(
   input clk,
   input [31:0] addr,
   input [31:0] write_data,
   output [31:0] read_data,
   input MemRead, MemWrite
    );
    
  reg [31:0] mem [255:0];
  reg [31:0]read_d;
  always@(posedge clk)begin
  if(MemRead) read_d<=mem[addr[31:2]];
  if(MemWrite) mem[addr[31:2]]<=write_data;
  end
  
  assign read_data=read_d;
endmodule
