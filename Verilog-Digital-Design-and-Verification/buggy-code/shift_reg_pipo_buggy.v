module shift_reg_pipo_buggy(
	input reset_n,
	input clk,
	input [7:0] d,
	output reg [7:0] q

);

	//we will intentionallyu inser an error in this cirucit 
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n)
			q <= 0;
		else
			q[7:0] <= d[6:0]; //size mismatch
			//q[7:0] <= d[7:0];
	end
endmodule
	
