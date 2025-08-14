`timescale 1us/1ns
module func_ex3();

	//recursive function example
	  
	function automatic integer factorial (input integer N);
		//internal variables for intermediary results
		//have to be declared before begin/end
		integer result = 0;
		begin
			if (N==0)
				result = 1;
			else
				result = N * factorial(N-1);
				
			factorial = result;
		end
	endfunction
	
	initial begin
		$display($time, " factorial(2) = %d", factorial(2));
		$display($time, " factorial(5) = %d", factorial(5));
		$display($time, " factorial(10) = %d", factorial(10));
	end
endmodule
