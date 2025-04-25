`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2025 16:36:28
// Design Name: 
// Module Name: top
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


module top(input clk,rst );
wire [3:0]alu_control;
wire [4:0] read_reg1,read_reg2,write_reg;
wire[1:0] Aluop;
wire [5:0] funct,op;
wire[31:0] operand_1, operand_2,out,addr,write_data,read_data,read_adress,instruction,write_data1,read_data1,read_data2;
wire and_out;
reg [31:0] PC;
reg [31:0] PC_next;
assign and_out  = zero & Branch;
reg [31:0] add_result;
wire [31:0] shifted_input;
wire [31:0] mux_1_result;
wire [31:0] PC_input;
wire [31:0] jump_ins;
assign sign_extension = {{16{instruction[15]}},instruction[15:0]};
assign shifted_input = sign_extension << 2;
always@(posedge clk) add_result <=PC_next+ shifted_input;
assign mux_1_result = and_out?add_result:PC_next;
assign jump_ins = {PC[31:28],instruction[25:0],2'b0};
assign PC_input = Jump?jump_ins:mux_1_result;
always@(posedge clk) PC_next<=PC+4;
always@(posedge clk) PC<=PC_input;
assign read_adress = PC;
Alu_unit a (.clk(clk),.alu_op(alu_control),.operand_1(operand_1),.operand_2(operand_2),.out(out),.zero(zero));
alu_control b(.Aluop(Aluop),.funct(funct),.Alu_control(alu_control));
control_unit c(.op(op),.Jump(Jump),.RegDst(RegDst), .AluSrc(AluSrc), .MemtoReg(MemtoReg),.RegWrite(RegWrite),.Memread(Memread), .MemWrite(MemWrite), .Branch(Branch),.AluOp(Aluop));
data_mem d(.clk(clk),.addr(addr),.write_data(write_data),.MemRead(MemRead),.MemWrite(MemWrite),.read_data(read_data));
ins_memory e(.clk(clk),.read_adress(read_adress),.instruction(instruction));
registers f(.read_reg1(read_reg1),.read_reg2(read_reg2),.write_reg(write_reg),.clk(clk),.write_data(write_data1),.read_data1(read_data1),.read_data2(read_data2));

assign write_reg=(RegDst? instruction[15:11]: instruction[20:16]);
assign operand_2=(AluSrc?{{16{instruction[15]}},instruction[15:0]}:read_data2);
assign write_data1=(MemtoReg?read_data:out);

endmodule