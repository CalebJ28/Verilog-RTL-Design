module clock_div_nbit
	//parameters section
	#(parameter CNT_WIDTH = 4)
	//ports section
	(
	input clk,
	input reset_n,
	output reg clk_div2,
	output [CNT_WIDTH-1:0] counter
	
	
	);
	//use non-blocking assignment for sequential logic
	always @(posedge clk or negedge reset_n) begin
		if(!reset_n)
			clk_div2 <= 0;
		else
			clk_div2 <= ~clk_div2; //fedback loop
	end
	
	//instantiate a parameterizable module
	//with a new parameter value
	counter_nbit
		#(.CNT_WIDTH(CNT_WIDTH))
			CNT_NBIT0
		(.clk(clk),
		.reset_n(reset_n),
		.counter(counter)
		);
		
endmodule
