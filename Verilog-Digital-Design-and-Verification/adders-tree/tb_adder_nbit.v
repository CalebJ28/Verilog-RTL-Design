`timescale 1us/1ns

module tb_adder_nbit();

	//declare nets and variables
	parameter ADDER_WIDTH = 10;
	reg [ADDER_WIDTH-1:0] a;
	reg [ADDER_WIDTH-1:0] b;
	wire [ADDER_WIDTH:0] sum;
	
	//instantiate the parameterized DUT
	adder_nbit 
	#(.N(ADDER_WIDTH))
	ADDER1(
		.a(a), 
		.b(b),
		.sum(sum)
	
	);
	
	//toggle sel (select line)
	initial begin
		$monitor(" a = %b, b = %b, sum = %d", a, b, sum);
		#1;  a = 0; b = 0; 
		#1;  a = 1; b = 99;
		#1;  a = 33; b = 66; 
		#1;  a = 100; b = 47; 
		#1; $stop;
	end
endmodule
