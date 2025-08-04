module testbench_4bit_adder();

	//declare variables and nets for module ports on testbench
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0] sum;
	wire cout;
	
	integer i, j; //used for verification
	parameter LOOP_LIMIT = 4;
	
	//instantiate the module using the "dot reference style"
	ripple_adder_4bit_dataflow RIPPLE_ADD_4BIT(
		.a(a),
		.b(b),
		.carry_in(cin),
		.sum(sum),
		.carry_out(cout)
	
		);
	
	//generate stimulus and monitor module ports
	initial begin
		$monitor("a=%b, b=%b, carry_in=%0b, sum=%0d, carry_out=%b", a, b, cin, sum, cout);
	end
	
	initial begin
		for (i=0; i<LOOP_LIMIT; i=i+1) begin
			for (j=0; j<LOOP_LIMIT; j=j+1) begin
				#1 a = i; b = j; cin = i%2;
			end
		end

		
	end
endmodule
		
		
