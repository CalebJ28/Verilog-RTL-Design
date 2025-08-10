`timescale 1us/1ns

module tb_clock_div3();

	//testbench variables

	reg clk = 0; //mandatory initalization
	reg reset_n;
	wire clock_out;
	
	//instantiate the DUT
	clock_div3 CLK_DIV0 (
		.clock_in(clk),
		.reset_n(reset_n),
		.clock_out(clock_out)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		#1; reset_n = 0; //apply reset to the circuit
		@(posedge clk) reset_n = 1; //release reset
		repeat(20) @(posedge clk); $stop;
	end
endmodule
 
