module counter_nbit 
	//parameters section
	#(parameter CNT_WIDTH = 4)
	//ports section
	(
	input clk,
	input reset_n,
	output reg [CNT_WIDTH-1:0] counter
	
	
	);
	//use non-blocking assignment for sequential logic
	always @(posedge clk or negedge reset_n) begin
		if(!reset_n)
			counter <= 0;
		else
			counter <= counter + 1'b1;
	end
endmodule
