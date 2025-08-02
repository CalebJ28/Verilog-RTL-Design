module easy_vectors_example();
	
	reg [7:0] a = 0; //8 bit register - MSB = 7, LSB = 0
	reg [6:0] b = 0; //7 bit register
	reg [7:0] d = 0; //8 bit register
	
	wire [1:0] c; //2 bit net
	
	/* continous assignment between a net and register
	c[1] = a[3];
	c[0] = a[2];
	*/
	
	assign c[1:0] = a[3:2]; // this is called 'bit slicing'
	
	
	//procedure used to continously monitor a, b, c and d
	initial begin
		$monitor("PROC2 a=%b, b=%b, c=%b, d=%b", a, b, c, d);
	end
	
	//another procedure
	initial begin
		//changing the value of a to see effect on c
		#1 a = 1;
		#1 a = 8'b1111_0101;
		#1 a = 8'b1111_0000;
		#1 a = 8'b0000_1000;
		#1 a = 8'b0;
		
		#1 b = 7'b111_1111; //change value b
		#1 d[3:0] = a[3:0]; //change value d
		#1 d[7:4] = b[6:3];
		
		#1 a = 8'b0000_1110; //change value of a
		#1 d = {a[3:0], b[3:0]}; //concatenation
		#1 d = {b[3:0], a[7:4]}; //concatenation
	end
endmodule
