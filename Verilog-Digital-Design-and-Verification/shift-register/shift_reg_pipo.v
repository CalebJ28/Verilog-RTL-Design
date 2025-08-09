module shift_reg_pipo(
	input reset_n,
	input clk,
	input [3:0] d,
	output reg [3:0] q

);

	//async negative reset_n is used
	//the input data is the same as the output data
	//this can be used as a "pipeline register"
	
	always @(posedge clk or negedge reset_n) begin
		if(!reset_n)
			q <= 4'b0;
		else
			q[3:0] <= d[3:0];
	end
endmodule
