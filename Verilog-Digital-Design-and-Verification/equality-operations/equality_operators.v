module equality_operators();

	reg result;
	
	initial begin
		#1; result =  (1'b1 == 1'b0);
			$display("result = %b", result);
		#1; result =  (1'b1 == 1'b1);
			$display("result = %b", result);
		#1; result =  (1'b1 == 1'bX);
			$display("result = %b", result);
		#1; result =  (3'b101 == 3'b100);
			$display("result = %b", result);
		#1; result =  (3'b101 != 3'b100);
			$display("result = %b", result);
			
		#1; result =  (3'b10Z == 3'b10Z);
			$display("result = %b", result);
		#1; result =  (3'b10Z === 3'b10Z);
			$display("result = %b", result);
		#1; result =  (3'b1XZ == 3'b10Z);
			$display("result = %b", result);
		#1; result =  (3'b1XZ == 3'b1XZ);
			$display("result = %b", result);
		#1; result =  (2'bXX !== 2'bXX);
			$display("result = %b", result);
	end
endmodule	
			
