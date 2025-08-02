module sum_product();

	//Declaring variables
	integer a,b;
	integer sum_int; //Integer variable allows us to pass 32 bits
	
	real x, y;
	real prod_real; //Real variable allows us to pass 64bit

	initial begin
		a = 3;
		b = 9;
		sum_int = a+b;
		$display("\n\t a = %0d, b = %0d, sum = %0d", a, b, sum_int);
		
		x = 99.67;
		y = -33.41;
		prod_real = x*y;
		$display("\n\t x = %0.2f, y =%0.2f, prod_real = %0.2f", x, y, prod_real);
	end
endmodule
