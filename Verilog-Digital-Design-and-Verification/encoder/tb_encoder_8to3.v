`timescale 1us/1ns

module tb_encoder_8to3();

	//declare nets and variables

	reg [7:0] d;
	reg enable;
	wire [2:0] y;
	
	integer i;
	
	
	//instantiate the DUT
	encoder_8to3 ENC3_8(
		.d(d),
		.enable(enable),
		.y(y)
	);
	
	//create stimulus
	initial begin
		$monitor($time, " d = %b, y = %d", d,y);
		#1;  d = 0; enable = 0;
		for (i=0; i <8; i=i+1) begin
			#1; d = (1 << i); enable =  1;
		end
		#1; d = 8'b1111_1111;
	end
endmodule
