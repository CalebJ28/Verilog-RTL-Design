`timescale 1us/1ns

module tb_d_ff_async_rstn();

	//testbench variables
	reg d;
	reg clk = 0;
	reg reset_n;
	wire q;
	wire q_not;
	reg [1:0] delay;
	integer i;
	
	
	//instantiate the DUT
	d_ff_async_rstn DFF0(
		.d(d),
		.clk(clk),
		.reset_n(reset_n),
		.q(q),
		.q_not(q_not)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		reset_n = 0; d = 0;
		for (i=0; i<4; i=i+1) begin
			delay = $urandom_range(1,3);
			#(delay) d = ~d;
		end
		
		reset_n = 1;
		for (i=0; i<4; i=i+1) begin
			delay = $urandom_range(1,3);
			#(delay) d = ~d; //toggle the FF at random times
		end
		
		d = 1'b1; // make sure D is set
		#(0.2); reset_n = 0; // reset the FF again
	end
		
	
	//stop simulator when time expires
	initial begin	
		#20 $finish; //stop the stimulus 
	end
endmodule
 
