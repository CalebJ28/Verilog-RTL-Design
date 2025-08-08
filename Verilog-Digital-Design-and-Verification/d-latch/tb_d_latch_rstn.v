`timescale 1us/1ns

module tb_d_latch_rstn();

	//testbench variables
	reg d;
	reg enable;
	reg reset_n;
	wire q;
	wire q_not;
	
	
	//instantiate the DUT
	d_latch_rstn DL0(
		.d(d),
		.enable(enable),
		.reset_n(reset_n),
		.q(q),
		.q_not(q_not)
	);
	
	//create stimulus
	initial begin
		enable = 0; reset_n = 0;
		#0.2; d = 0;
		#0.5; d = 1; reset_n = 1;
		#1.5; enable = 1;
		#0.1; d = 1;
		#0.2; d = 0;
		#0.3; d = 1;
		#1; enable = 0; d = 0;
		#1; d = 1; reset_n = 1;
		#2; enable = 1; d = 0;
	end
	
	//stop simulator when time expires
	initial begin	
		#20 $finish;
	end
endmodule
 
