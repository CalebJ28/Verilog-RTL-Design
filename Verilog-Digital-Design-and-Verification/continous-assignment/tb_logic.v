`timescale 1us/1ns

module tb_logic();

	//declare nets and variables
	reg a, b;
	wire c;
	
	//instantiate the DUT
	some_logic LOGIC(
		.a(a), 
		.b(b),
		.c(c)
	
	);
	
	//toggle sel (select line)
	initial begin
		$monitor(" a = %b, b = %b, c = %b", a, b, c);
		#1;  a = 0; b = 0; 
		#1;  a = 1; b = 0; 
		#1;  a = 0; b = 1;  
		#1;  a = 1; b = 1;
		#1;
	end
endmodule
