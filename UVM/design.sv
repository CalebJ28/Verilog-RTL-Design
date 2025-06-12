// Code your design here
module alu(
  input clock,
  input reset,
  input [7:0] A,B,  // ALU 8-bit Inputs                 
  input [3:0] ALU_Sel,// ALU Selection
  output reg [7:0] ALU_Out, // ALU 8-bit Output
  output bit CarryOut // Carry Out Flag
);
endmodule

