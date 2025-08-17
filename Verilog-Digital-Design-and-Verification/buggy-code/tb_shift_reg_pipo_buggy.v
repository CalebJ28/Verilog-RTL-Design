`timescale 1us/1ns

module tb_shift_reg_pipo_buggy();

	//declare nets and variables
	reg [7:0] d;
	reg clk = 0;
	reg reset_n;
	wire [7:0] q;
	reg [1:0] delay;
	integer success_count, error_count, test_count;
	integer i;
	
	//instantiate the DUT
	shift_reg_pipo_buggy PIPO0(
		.reset_n(reset_n), 
		.clk(clk),
		.d(d),
		.q(q)
	
	);
	
	//we will use no inputs as we will use the global variables connected to the modules ports
	task load_check_pipo_reg();
		begin
			@(posedge clk);
			d = $random;
			@(posedge clk);
			#0.1;
			compare_data(d,q);
		end
	endtask
	
	task compare_data (input [7:0] expected_data, input [7:0] observed_data);
		begin
			if (expected_data === observed_data) begin //use case equality
				$display($time, "SUCCESS expected_data = %8b, observed_data = %8b", expected_data, observed_data);
				success_count = success_count + 1;
			end else begin
				$display($time, "ERROR expected_data = %8b, observed_data = %8b", expected_data, observed_data);
				error_count = error_count + 1;
			end
			test_count = test_count + 1;
		end
	endtask
	
	always begin #0.5 clk = ~clk; end
	
	initial begin
		#1;
		//clear the statistics counters
		success_count = 0; error_count = 0; test_count = 0;
		reset_n = 0; d = 0; //apply reset to circuit
		
		#1.3; //release the reset
		reset_n = 1;
		
		for (i=0;i<10;i=i+1) begin
			load_check_pipo_reg();
			delay = $random;
			#(delay) d = $random; //wait between tests
		end
		
		//print stats
		$display($time, "TEST RESULTS success_count = %0d, error_count = %0d, test_count = %0d", success_count, error_count, test_count);
		#40 $stop;
	end
	
endmodule
