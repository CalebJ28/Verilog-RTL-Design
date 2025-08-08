`timescale 1us/1ns

module tb_d_latch();

	//testbench variables
	reg d;
	reg enable;
	wire q;
	wire q_not;
	
	
	//instantiate the DUT
	d_latch DL0(
		.d(d),
		.enable(enable),
		.q(q),
		.q_not(q_not)
	);
	
	//create stimulus
	initial begin
		$monitor($time, " enable=%b, d = %b, q = %b, q_not = %b", enable, d, q, q_not);
		enable = 0;
		#1; d = 0;
		#1; d = 1;
		#1.5; enable = 1;
		#0.2; d = 0;
		#0.3; d = 1;
		#1; enable = 0; d = 0;
		#1; enable = 1; d = 1;
		#2; d = 0;
		#1; enable = 0;
		#1; d = 1;
	end
	
	//stop simulator when time expires
	initial begin	
		#20 $finish;
	end
endmodule
 
