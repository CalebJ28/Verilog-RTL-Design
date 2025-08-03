module half_adder_behavioural(
	input a,
	input b,
	output reg sum,
	output reg carry
);
	//dataflow uses continous assignments
	always @(a or b) begin
		sum = a ^ b;
		carry = a & b;
	end
	
endmodule
