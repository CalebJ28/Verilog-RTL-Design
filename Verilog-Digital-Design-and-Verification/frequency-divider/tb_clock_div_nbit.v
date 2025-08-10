`timescale 1us/1ns

module tb_clock_div_nbit();

	//testbench variables

	parameter CNT_WIDTH = 4;
	reg clk = 0; //mandatory initalization
	reg reset_n;
	wire clk_div2;
	wire [CNT_WIDTH-1:0] counter;
	
	
	//instantiate the DUT
	clock_div_nbit
	//param section
		#(.CNT_WIDTH(CNT_WIDTH))
		CNT_DIV0 (
		.clk(clk),
		.reset_n(reset_n),
		.clk_div2(clk_div2),
		.counter(counter)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		#1; reset_n = 0; //apply reset to the circuit
		#1.2; reset_n = 1; //release reset
		repeat(20) @(posedge clk); $stop;
	end
endmodule
 
