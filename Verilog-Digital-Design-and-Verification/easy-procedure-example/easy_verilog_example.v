module easy_verilog_example();
	reg x = 1'b0; // 1 bit variable with the binary value 0
	reg y = 1'b1; // 1 bit variable with the binary value 1
	reg z; // 1 bit variable used to store the result of operations between x and y
	
	// procedure example
	always @(z) begin
		$display("x=%b, y=%b, z=%b", x, y, z);
	end
	
	// another procedure example 
	initial begin
		#2; // wait 2 time units
		z = x ^ y; //bit-wise XOR between the variables x and y
		#10; // wait 10time units
		y = 0; // update varialbe y
		z = x | y; // bit-wise OR between variabes x and y
		#10; // wait 10 time units
		z = ~z; //bit-wise NOT variable z
		#10; // wait 2 time units
	end
endmodule
