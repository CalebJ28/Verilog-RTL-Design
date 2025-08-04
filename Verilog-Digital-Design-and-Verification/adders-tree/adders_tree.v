module adders_tree(
	input [3:0] a,
	input [3:0] b,
	input [7:0] c,
	input [7:0] d,
	output [4:0] sum1,
	output [8:0] sum2,
	output [9:0] sum3

);

	//the orderr of the assignments is not important
	assign sum1 = a + b;
	assign sum2 = c + d;
	assign sum3 = sum1 + sum2;
endmodule
