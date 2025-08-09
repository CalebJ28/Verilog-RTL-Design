`timescale 1us/1ns

module tb_shift_reg_pipo();

	//testbench variables
	reg [3:0] d;
	reg clk = 0;
	reg reset_n;
	wire [3:0] q;
	integer i;
	
	
	//instantiate the DUT
	shift_reg_pipo PIPO0(
		.d(d),
		.clk(clk),
		.reset_n(reset_n),
		.q(q)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		#1; //apply reset to the circuit
		reset_n = 0; d = 0;
		#1.3; //release the reset
		reset_n = 1;
		
		//wait for the positive edge of clk
		//and change the data input data
		for (i=0; i <5; i=i+1) begin
			@(posedge clk); d = $random;
		end
	end
		
	
	//stop simulator when time expires
	initial begin	
		#20 $finish; //stop the stimulus 
	end
endmodule
 
