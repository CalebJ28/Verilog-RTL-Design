module full_adder_structural(
	input a,
	input b,
	input carry_in,
	output sum,
	output carry_out
);
	
	//declare nets to connect the half adders - RECAP (Nets represent physical connection between objects and structures)
	wire sum1;
	wire carry1;
	wire carry2;
	
	//Instantiate two half_adder_strctural modules
	half_adder_structural HA1(
		.a(a),
		.b(b),
		.sum(sum1),
		.carry(carry1)
	);
	
	half_adder_structural HA2(
		.a(sum1),
		.b(carry_in),
		.sum(sum2),
		.carry(carry2)
	);
	
	//Use verilog primitive
	//These are fundamental components provided by the Verilog language itself, such as and, nand, or, nor, and not gates. 
	or (carry_out, carry1, carry2);
endmodule
	
