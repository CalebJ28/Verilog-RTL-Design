module adder_nbit
//parameters section
#(parameter N = 3)
//port section
(input [N-1:0] a,
input [N-1:0] b,
output reg [N:0] sum);

	//wildcard operator is best for the procedures
	//sensitibity list aka control list
	always @(*) begin
		sum [N:0] = a[N-1:0] + b[N-1:0];
		//sum = a+b;
	end
endmodule
