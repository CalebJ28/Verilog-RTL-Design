module full_adder_behavioural(
	input a,
	input b,
	input carry_in,
	
	//defined as reg because it is used in a alywars procedure
	output reg sum,
	output reg carry_out
);
	
	always @(a or b or carry_in) begin
		sum = a ^ b ^ carry_in;
		carry_out = (a & b) | (carry_in & (a ^ b));
	end
	
	/*Alternate way
	
	always @(*) begin
		{carry_out, sum} = a + b +carry_in;
	*/
endmodule
	
