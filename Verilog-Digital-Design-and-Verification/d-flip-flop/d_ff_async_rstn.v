module d_ff_async_rstn(
	
	input d,
	input clk,
	input reset_n,
	output reg q,
	output q_not
	);
	
	//The d-flip flop has a positive edge clock
	//reset_n is synchronous with the clk signal
	//use non-blocking operator for sequential logic
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n)
			q <= 1'b0;
		else 
			q <= d;
	end
		
	assign q_not = ~q;
	
endmodule
