module reduction_operators();

	reg [4:0] my_val1 = 5'b1_1111; //5 bit variable
	reg [8:0] my_val2 = 9'b1_0101_1110;
	reg result;
	
	//procedure to continously monitor
	initial begin
		$monitor("MON my_val1=%b, my_val2=%b, result=%b", my_val1, my_val2, result);
	end
	
	//procedure to generate stimulus
	initial begin
		result = &my_val1; //AND reduction
		#1;
		result = &my_val2;
		
		#1;
		result = ~&my_val2; //NAND reduction
		#1;
		result = ~&my_val1;
		
		#1;
		result = |my_val2; //OR reduction
		
		#1;
		result = ~|my_val2; //NOR reduction
		
		#1;
		result = ^my_val1; //XOR reduction
		
		#1;
		result = ~^my_val1; //XNOR reduction
		
	end
endmodule
		
