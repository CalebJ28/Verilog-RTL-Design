`timescale 1us/1ns

module tb_shift_reg_siso();

	//testbench variables
	reg sdi;
	reg clk = 0;
	reg reset_n;
	wire sdo;
	
	
	//instantiate the DUT
	shift_reg_siso SISO0(
		.sdi(sdi),
		.clk(clk),
		.reset_n(reset_n),
		.sdo(sdo)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		#1; //apply reset to the circuit
		reset_n = 0; sdi = 0;
		
		#1.3; //release the reset
		reset_n = 1;
		
		
		//set sdi for 1 clock
		@(posedge clk); sdi = 1'b1; @(posedge clk); sdi = 1'd0;
		
		//wait for bit to shift
		repeat (5) @(posedge clk);
		@(posedge clk); sdi = 1'b1;
		@(posedge clk);
		@(posedge clk); sdi = 1'b0;
	end
		
	
	//stop simulator when time expires
	initial begin	
		#40 $finish; //stop the stimulus 
	end
endmodule
 
