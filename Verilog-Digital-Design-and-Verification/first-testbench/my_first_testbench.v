module my_first_testbench(
	//has no inputs on testbench
	);
	
	reg [7:0] a = 0; //reg type is used for inputs
	reg [7:0] b = 0;
	
	wire [8:0] sum; //wire type is used for outputs
	
	//Instantiate the DUT
	//Syntax: <module_name> <instance_name>
	adder8bit ADDER1(
		.a(a), //first a is the port name; second a is the variable
		.b(b),
		.sum(sum)

	);
	
	//monitor the outputs and inputs
	initial begin
		$monitor("a=%d, b=%d, sum=%d", a, b, sum);
	end
	
	//generate stimulus
	initial begin
		#1;
		a = 1;
		#1;
		b = 10;
		#1;
		a = 3; b = 99;
		#1;
		a = 101; b = 66;
		#1;
		a = 255; b = 255;
	end
endmodule
