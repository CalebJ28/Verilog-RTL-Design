// Round robin arbiter
// Caleb Joseph | 2024-12-09
// Code your design here

module round_robin_arbiter_fixed_time_slices(
  input clk,
  input reset_n,
  input [3:0] REQ,
  output reg [3:0] GNT
);
  
  reg [2:0] present_state;
  reg [2:0] next_state;
  
  parameter [2:0] S_ideal = 3'b000;
  parameter [2:0] S_0 = 3'b001;
  parameter [2:0] S_1 = 3'b010;
  parameter [2:0] S_2 = 3'b011;
  parameter [2:0] S_3 = 3'b100;
  
  
  //State register
  always @(posedge clk or negedge reset_n) //Active low or synched to the clk
    //One hot encoding
    begin
      if(!reset_n)
        present_state <= S_ideal;
      else
        present_state <= next_state;
    end
  
  //Next state logic, combinational always block 
  always @(*)
    begin
      case(present_state)
        S_ideal: begin
          if(REQ[0])
            next_state = S_0;
          else if(REQ[1])
            next_state = S_1;
          else if(REQ[2])
            next_state = S_2;
          else if(REQ[3])
            next_state = S_3;
          else
            next_state = S_ideal;
        end
        
        S_0: begin
          if(REQ[1])
            next_state = S_1;
          else if(REQ[2])
            next_state = S_2;
          else if(REQ[3])
            next_state = S_3;
          else if(REQ[0])
            next_state = S_0;
          else
            next_state = S_ideal;
        end
        
        S_1: begin
          if(REQ[2])
            next_state = S_2;
          else if(REQ[3])
            next_state = S_3;
          else if(REQ[0])
            next_state = S_0;
          else if(REQ[1])
            next_state = S_1;
          else
            next_state = S_ideal;
        end
        
        S_2: begin
          if(REQ[3])
            next_state = S_3;
          else if(REQ[0])
            next_state = S_0;
          else if(REQ[1])
            next_state = S_1;
          else if(REQ[2])
            next_state = S_2;
          else
            next_state = S_ideal;
        end
            
        default: begin
          if(REQ[0])
            next_state = S_0;
          else if(REQ[1])
            next_state = S_1;
          else if(REQ[2])
            next_state = S_2;
          else if(REQ[3])
            next_state = S_3;
          else
            next_state = S_ideal;
        end
    endcase
    end
  
  //Output logic
  always @(*)
    begin
      case(present_state)
        S_0: begin GNT = 4'b0001; end
        S_1: begin GNT = 4'b0010; end
        S_2: begin GNT = 4'b0100; end
        S_3: begin GNT = 4'b1000; end
        default : begin GNT = 4'b0000; end
      endcase
    end
      
        
endmodule

      
      
