module d_latch_rstn(
	
	input d,
	input enable,
	input reset_n,
	output q,
	output q_not
	);
	
	
	reg dlatch;
	
	//the d latch is level sensitive
	always @(enable or d or reset_n) begin
		if (!reset_n)
			dlatch <= 1'b0; //active low reset
		else if(enable)
			dlatch <= d;
	end
		
	assign q = dlatch;
	assign q_not = ~q;
	
endmodule
