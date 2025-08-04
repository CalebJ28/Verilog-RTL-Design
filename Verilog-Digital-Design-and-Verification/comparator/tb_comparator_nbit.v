`timescale 1us/1ns

module tb_comparator_nbit();

	//declare nets and variables
	parameter CMP_WIDTH = 12;
	reg [CMP_WIDTH-1:0] a;
	reg [CMP_WIDTH-1:0] b;
	wire smaller, equal, greater;
	
	//instantiate the parameterized DUT
	comparator_nbit 
	#(.N(CMP_WIDTH))
	CMP1(
		.a(a), 
		.b(b),
		.smaller(smaller),
		.equal(equal),
		.greater(greater)
	
	);
	
	//toggle sel (select line)
	initial begin
		$monitor(" a = %b, b = %b, smaller = %d, equal = %d, greater = %d", a, b, smaller, equal, greater);
		#1;  a = 0; b = 0; 
		#2;  a = 5; b = 99;
		#1;  a = 66; b = 66; 
		#1;  a = 100; b = 47; 
		#1; $stop;
	end
endmodule
