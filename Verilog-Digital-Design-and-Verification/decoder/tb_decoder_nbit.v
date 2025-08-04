`timescale 1us/1ns

module tb_decoder_nbit();

	//declare nets and variables
	parameter DEC_WIDTH = 3;
	reg [DEC_WIDTH-1:0] a;
	reg enable;
	wire [2**DEC_WIDTH-1:0] y;
	
	integer i; //used in the for loop
	
	//instantiate the parameterized DUT
	decoder_nbit 
	#(.N(DEC_WIDTH))
	DEC1(
		.a(a),
		.enable(enable),
		.y(y)
	
	);
	
	//create stimulus
	initial begin
		$monitor($time, " a = %d, enable = %d, y = %d", a, enable, y);
		#1;  a = 0; enable = 0; 
		for (i=0; i <2**DEC_WIDTH; i=i+1) begin
			#1; a = i; enable = 1;
		end
	end
endmodule
