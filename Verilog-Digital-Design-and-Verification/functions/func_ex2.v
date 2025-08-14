`timescale 1us/1ns
module func_ex2();
	  
	  function compare (input integer a, input integer b);
		begin
			compare = (a == b);
		end
	endfunction
	
	//Variables used for stimulus
	
	reg [7:0] a, b;
	
	initial begin
		$monitor ($time, "a = %d, b = %d, sum = %d", a, b, compare(a,b));
		#1 a = 1; b = 9;
		#1 a = 13; b = 66;
		#1 a = 400; b = 101;
		#1 a = -134; b = -134;  
	end
endmodule
