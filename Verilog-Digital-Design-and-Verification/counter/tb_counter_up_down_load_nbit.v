`timescale 1us/1ns

module tb_counter_nbit();

	//testbench variables

	parameter CNT_WIDTH = 3;
	reg clk = 0; //mandatory initalization
	reg reset_n;
	reg load_en;
	reg [CNT_WIDTH-1:0] counter_in;
	reg up_down;
	wire [CNT_WIDTH-1:0] counter_out;
	
	
	//instantiate the DUT
	counter_up_down_load_nbit
	//param section
		#(.CNT_WIDTH(CNT_WIDTH))
		CNT_NBIT0 (
		.clk(clk),
		.reset_n(reset_n),
		.load_en(load_en),
		.up_down(up_down),
		.counter_in(counter_in),
		.counter_out(counter_out)
	);
	
	//create the clk signal
	always begin
		#0.5 clk = ~clk;
	end
	
	//create stimulus
	initial begin
		$monitor($time, "load_en = %b, up_down = %b, counter_in = %d, counter_out = %d", load_en, up_down, counter_in, counter_out);
		#1; reset_n = 0; load_en = 0; counter_in = 0; up_down = 0; //apply reset to the circuit
		#1.2; reset_n = 1; //release reset
		@(posedge clk);//
		repeat(2) @(posedge clk); counter_in = 3; load_en = 1;
		@(posedge clk); load_en = 0; up_down = 1;
		
		wait (counter_out == 0) up_down = 0;
	end
	
	initial begin	#20 $stop; end //stop the simulation
endmodule
 
