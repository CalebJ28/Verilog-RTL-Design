`timescale 1us/1ns

module tb_fsm1();

	//declare nets and variables
	reg clk = 0;
	reg rst_n;
	reg validate_code;
	reg [3:0] access_code;
	wire open_access_door;
	wire [1:0] state_out;
	
	//instantiate the parameterized DUT
	fsm1 FSM0(
		.clk(clk),
		.rst_n(rst_ns),
		.validate_code(validate_code),
		.access_code(access_code),
		.open_access_door(open_access_door),
		.state_out(state_out)
	);
	
	initial begin //clock
		forever begin
			#1 clk = ~clk;
		end
	end
	
	initial begin
		$monitor($time, "access_code = %4b, state_out %2b, open_access_door = %b", access_code, state_out, open_access_door);
		
		rst_n = 0; #2.5; rst_n = 1; //the reset sequence
		
		validate_code = 0; access_code = 0;
		@(posedge clk); //invalid code
		validate_code = 1; access_code = 0; 
		@(posedge clk); //invalid code
		validate_code = 1; access_code = 0;
		@(posedge clk); //valid code
		validate_code = 1; access_code = 9;
		@(posedge clk); //disable validate_code
		validate_code = 0; access_code = 9;
		#40 $stop;
	end
endmodule
