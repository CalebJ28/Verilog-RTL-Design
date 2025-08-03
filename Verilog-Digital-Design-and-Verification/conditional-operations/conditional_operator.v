module conditional_operator();

	integer result;
	integer a = 9;
	integer b = 31;
	reg c = 0;
	
	initial begin
		#1; result = (a == 9)? 1 : 0;
		$display("result = %0d", result);
		
		#1; result = ((a+b) == 40)? 1 : 0;
		$display("result = %0d", result);
		
		#1; result = (b == 30)? 678 : -99;
		$display("result = %0d", result);
		
		#1; c = (b == 31)? 1'bZ : 1'b0;
		$display("c = %b", c);
	end
endmodule
		
		
