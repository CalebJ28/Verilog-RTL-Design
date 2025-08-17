`timescale 1us/1ns
module task_control_shift_reg();

	//testbench variables
	parameter REG_WIDTH = 8;
	reg load, shift_left_right;
	reg [REG_WIDTH-1:0] data_in;
	reg clk = 0;
	  
	/* this task is used to control a "shift left/right register with load"
	the operations below are happening on "posedgeclk"
	if load = 1 then the register is loaded with the value of data in
	if load = 0 and shift_left_right = 1 then the register should shift left its content
	if load = 0 and shift_left_right = 0 then the register should shift right its content
	the task will change the value of some global "reg variables" which can be connected to a DUT
	no DUT is present here */
	
	task control_shift_reg (input i_load, input i_shift_left_right, input [REG_WIDTH-1:0] i_data_in);
		begin
			@(posedge clk); //control are applied on posedge
			load = i_load; //global variables from LHS are updated with local values from RHS
			shift_left_right = i_shift_left_right;
			data_in = i_data_in;
		end
	endtask
	
	//create a clock signal
	always begin #1 clk = ~clk; end
	
	//variables used for stimulus
	
	initial begin
		$monitor($time, "load = %0b, shift_left_right = %0b, data_in = %8b", load, shift_left_right, data_in);
		//call the task using the 'position' call for its input parameters
		control_shift_reg(1,0,8'd1); 
		control_shift_reg(1,1,8'b1010_0101); 
		control_shift_reg(1,1,$random); 
		
		control_shift_reg(0,1,0); 
		control_shift_reg(1,0,$random); 
		control_shift_reg(0,0,$random); 
		repeat(5) @(posedge clk);
		$finish();
	end
endmodule
