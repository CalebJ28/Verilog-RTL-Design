module shift_left_right_load(
	input reset_n,
	input clk,
	input [7:0] i, //8bit input
	input load_enable, //0 for load and 1 for enable shifting
	input shift_left_right, //0 for left shift and 1 for right shift
	output reg [7:0] q //8bit output
);

	//async negative reset_n is used
	always @(posedge clk or negedge reset_n) begin
		if(!reset_n)
			q <= 8'b0;
		else if (load_enable == 1'b0) //load register
			q <= i;
		else begin //shift register
			if (shift_left_right == 1'b0) begin
				q <= {q[6:0], 1'b0}; //shift left
			end else begin
				q <= {1'b0, q[7:1]}; //shift right
			end
		end
	end
	
endmodule
