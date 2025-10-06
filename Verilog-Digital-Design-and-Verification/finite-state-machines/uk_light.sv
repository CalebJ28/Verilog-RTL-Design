module uk_light(
  input clk, //need to send/recieve
  input rst_n,
  input enable,
  output reg red, //need to store
  output reg yellow,
  output reg ylwred,
  output reg green,
  output [4:0] state_out //need to see
);
  
  
  //combinational
  
  //state parameters
  parameter [4:0] OFF = 5'b00001,
                RED = 5'b00010,
                RDYLW = 5'b00100,
                GREEN = 5'b01000,
                YELLOW = 5'b10000;
  //stage logic registers
  reg [4:0] state, next_state;
  
  reg [5:0] timer;
  reg timer_clear;
  
  
  //state logic procedure always block
  always @(*) begin
    next_state = OFF; //default state
    red = 0;
    yellow = 0;
    green = 0;
    ylwred = 0;
    timer_clear = 0;
    case (state)
      
      OFF:			begin
        				if(enable) next_state = RED;
      				end
      
      RED:		begin
                      red = 1;
         			  if(timer == 6'd50) begin
                          next_state = RDYLW;
                          timer_clear = 1;
                      end else begin
                          next_state = RED;
                      end
      				end
      
      RDYLW:		begin
                      ylwred = 1;
        			  if(timer == 6'd10) begin
                          next_state = GREEN;
                          timer_clear = 1;
                      end else begin
                          next_state = RDYLW;
                      end
      				end
      
      GREEN:		begin
                      green = 1;
        			  if(timer == 6'd30) begin
                        next_state = YELLOW;
                        timer_clear = 1;
                      end else begin
                        next_state = GREEN;
                      end
      				end
      
      YELLOW:		begin
                      yellow = 1;
        			  if(timer == 6'd10) begin
                        next_state = RED;
                        timer_clear = 1;
                      end else begin
                        next_state = YELLOW;
                      end
      				end
      default: next_state = OFF;
    endcase
    
    //return to OFF if enable is unset from any state
    if(!enable) begin
      	next_state = OFF;
    end
  end
    
  				  
  //sequential
  
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      state <= OFF;
    else
      state <= next_state;
  end
  
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      timer <= 0;
    else if ((timer_clear == 1) || (!enable))
      timer <= 0;
    else if (state != OFF)
      timer <= timer + 1'b1;
  end
  
  //combinational
  
  assign state_out = state;
endmodule
  
  
  
