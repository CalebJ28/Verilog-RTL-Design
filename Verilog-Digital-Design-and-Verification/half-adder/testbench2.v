module testbench();

	//declare variables and nets for module ports on testbench
	reg a;
	reg b;
	wire sum;
	wire carry;
	
	//instantiate the module using the "dot reference style"
	half_adder_dataflow HALF_ADD(
		.a(a),
		.b(b),
		.sum(sum),
		.carry(carry)
	
		);
	
	//generate stimulus and monitor module ports
	initial begin
		$monitor("a=%b, b=%b, sum=%b, carry=%b", a, b, sum, carry);
	end
	
	initial begin
		#1; a = 0; b = 0;
		#1; a = 0; b = 1;
		#1; a = 1; b = 0;
		#1; a = 1; b = 1;
		#1; a = 0; b = 0;
	end
endmodule
		
		
