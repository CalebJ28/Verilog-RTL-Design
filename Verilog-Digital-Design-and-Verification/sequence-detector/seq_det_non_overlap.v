
module seq_det_non_overlap(
	input clk,
	input rst_n,
	input seq_in,
	output reg detected,
	output [1:0] state_out //used for debug
	);
	
	//declare a bidimentional array for the RAM
	parameter [1:0] S1 = 2'd0,
					S10 = 2'd1,
					S101 = 2'd2;
	
	//declare the logic for the state machine
	reg [3:0] state;
	reg [3:0] next_state;
	
	//next state logic
	always @(*) begin
		detected = 1'b0;
		case (state)
			S1: begin // wait for first 1
				if (seq_in == 1) next_state = S10;
				else             next_state = S1;
			end

			S10: begin // wait for 0
				if (seq_in == 0) next_state = S101;
				else             next_state = S10;
			end

			S101: begin // wait for final 1
				if (seq_in == 1) begin
					next_state = S10;
					detected   = 1'b1;
				end
				else begin
					next_state = S1;
				end
			end

			default: next_state = S1; // best practice
		endcase
	end
	
	//state sequencer logic
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			state <= S1;
		else
			state <= next_state;
	end
	
	assign state_out = state;
endmodule
