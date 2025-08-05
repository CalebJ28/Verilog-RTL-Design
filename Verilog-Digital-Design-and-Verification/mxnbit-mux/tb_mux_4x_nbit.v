`timescale 1us/1ns

module tb_mux_4x_nbit();

	//declare nets and variables
	
	parameter BUS_WIDTH = 8;
	reg [BUS_WIDTH-1:0] a;
	reg [BUS_WIDTH-1:0] b;
	reg [BUS_WIDTH-1:0] c;
	reg [BUS_WIDTH-1:0] d;
	reg [1:0] sel;
	wire [BUS_WIDTH-1:0] y;
	
	integer i; //testbench variable
	
	
	//instantiate the DUT
	mux_4x_nbit
	#(.BUS_WIDTH(BUS_WIDTH)) MUX0
	(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.sel(sel),
		.y(y)
	);
	
	//create stimulus
	initial begin
		$monitor($time, " a = %d, b = %d, c = %d, d = %d, sel = %d, y = %d", a, b, c, d, sel, y);
		#1; sel = 0; a = 0; b = 0; c = 0; d = 0;
		for (i=0; i <8; i=i+1) begin
			#1; sel = $urandom()%4; a = $urandom(); b = $urandom(); c = $urandom(); d = $urandom();
		end
		
	end
endmodule
 
