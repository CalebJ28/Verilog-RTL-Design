`timescale 1us/1ns

module tb_adders_tree();

	//declare nets and variables
	reg [3:0] a, b;
	reg [7:0] c, d;
	wire [4:0] sum1;
	wire [8:0] sum2;
	wire [9:0] sum3;
	
	//instantiate the DUT
	adders_tree ADD(
		.a(a), 
		.b(b),
		.c(c),
		.d(d),
		.sum1(sum1),
		.sum2(sum2),
		.sum3(sum3)
	
	);
	
	//toggle sel (select line)
	initial begin
		$monitor(" a = %b, b = %b, c = %b, d = %d, sum1 = %d, sum2 = %d, sum3 = %d", a, b, c, d, sum1, sum2, sum3);
		#1;  a = 4'd0; b = 04'd3; c = 8'd1; d = 8'd255; 
		#1;  a = 4'd10; b = 04'd13; c = 8'd9; d = 8'd10; 
		#1;  a = 4'd15; b = 04'd15; c = 8'd109; d = 8'd37; 
		#1;  a = 4'd0; b = 04'd9; c = 8'd45; d = 8'd45; 
		#1;
	end
endmodule
