`timescale 1us/1ns

module tb_counter_nbit();

	//testbench variables

	parameter CNT_WIDTH = 3;
	reg clk = 0; //mandatory initalization
	reg reset_n;
	wire [CNT_WIDTH-1:0] counter;
	
	
	//instantiate the DUT
	counter_nbit
	//param section
		#(.CNT_WIDTH(CNT_WIDTH))
		CNT_NBIT0 (
		.clk(clk),
		.reset_n(reset_n),
		.counter(counter)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		$monitor($time, "counter = %d", counter);
		#1; reset_n = 0; //apply reset to the circuit
		#1.2; reset_n = 1; //release reset
		#20 $stop; //stop the simulation
	end
endmodule
 
