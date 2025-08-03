module half_adder_dataflow(
	input a,
	input b,
	output sum,
	output carry
);
	//dataflow uses continous assignments
	assign sum = a^b;
	assign carry = a&b;
endmodule
