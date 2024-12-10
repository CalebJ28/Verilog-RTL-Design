// Fixed priority arbiter
// Caleb Joseph | 2024-12-09
// Assuming the priority order is REQ[3] > REQ[2] > REQ[1] > REQ[0]
// Code your design here

module fixed_priority_arbiter(
  input clk,
  input reset_n,
  input [3:0] REQ,
  output reg [3:0] GNT
);
  
  always @(posedge clk or negedge reset_n) //Active low or synched to the clk
    //One hot encoding
    begin
      if(!reset_n)
        GNT <= 4'b0000;
      else if(REQ[3])
        GNT <= 4'b1000;
      else if(REQ[2])
        GNT <= 4'b0100;
      else if(REQ[1])
        GNT <= 4'b0010;
      else if(REQ[0])
        GNT <= 4'b0001;
      else
        GNT <= 4'b0000;
    end
endmodule

      
      
