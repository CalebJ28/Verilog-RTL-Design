`timescale 1us/1ns
module task_meters_to_feet();

	//testbench variables
	real meters, feet;
	reg clk = 0;
	  
	//inputs and outputs can be real numbers
	task meters_to_feet (input real meters, output real feet);
		begin
			feet = meters * 3.2808;
			$display($time, "meters = %0.4f, feet = %0.4f", meters, feet);
		end
	endtask
	
	//create a clock signal
	always begin #1 clk = ~clk; end
	
	//call the task
	
	initial begin
		@(posedge clk) meters = 1; meters_to_feet(meters, feet);
		@(posedge clk) meters = 3; meters_to_feet(meters, feet);
		@(posedge clk) meters = 10; meters_to_feet(meters, feet);
		repeat(10) @(posedge clk); $stop;
	end
endmodule
