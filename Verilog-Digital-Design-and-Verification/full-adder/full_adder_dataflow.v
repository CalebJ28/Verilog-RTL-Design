module full_adder_dataflow(
	input a,
	input b,
	input carry_in,
	output sum,
	output carry_out
);
	
	//declare nets to connect the half adders - RECAP (Nets represent physical connection between objects and structures)
	wire sum1;
	wire and1;
	wire and2;
	
	//implement circuit dataflow style
	
	assign sum1 = a^b;
	assign and1 = sum1 & carry_in;
	assign and2 = b & a;
	
	assign sum = sum1 ^ carry_in;
	assign carry_out = and1 | and2;
endmodule
	
