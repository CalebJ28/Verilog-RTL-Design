`timescale 1us/1ns

module tb_comp();

	//declare nets and variables
	reg a, b;
	wire smaller, greater, equal;
	
	//instantiate the DUT
	comparator_1bit MUX1(
		.a(a), 
		.b(b),
		.smaller(smaller),
		.equal(equal),
		.greater(greater)
	
	);
	
	//toggle sel (select line)
	initial begin
		$monitor(" a = %b, b = %b, smaller = %b, equal = %b, greater = %b", a, b, smaller, equal, greater);
		#1;  a = 0; b = 0; 
		#1;  a = 1; b = 0; 
		#1;  a = 1; b = 0;  
		#1;  a = 0; b = 1;
		#1;  a = 1; b = 1; 
		#1; $stop;
	end
endmodule
