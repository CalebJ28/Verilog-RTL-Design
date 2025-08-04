`timescale 1us/1ns

module tb_mux();

	//declare nets and variables
	reg a;
	reg b;
	reg x;
	wire y;
	
	//instantiate the DUT
	mux_1bit MUX1(
		.a(a), 
		.b(b), 
		.x(x),
		.y(y)
	
	
	);
	
	//generate stimulus
	initial begin
		#1; a = 1; b = 0; x = 1; 
		#1; a = 0; b = 1; x = 0; 
		#1; a = 0; b = 1; x = 1; 
		#1; a = 0; b = 0; x = 1; 
		#1; a = 1; b = 1; x = 1; 
		#1; a = 0; b = 1; x = 0; 
		#5; $stop;
	end
endmodule
