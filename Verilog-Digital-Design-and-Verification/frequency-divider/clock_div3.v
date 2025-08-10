module clock_div3
	//ports section
	(
	input clock_in,
	input reset_n,
	output clock_out
	);
	
	//internal variables for the Flip flops
	reg qa, qb, qc;
	
	

	//use non-blocking assignment for sequential logic
	//flip flop A - positive clock edge
	always @(posedge clock_in or negedge reset_n) begin
		if(!reset_n)
			qa <= 1'b0;
		else
			qa  <= (~qa) & (~qb); //fedback loop
	end
	
	//flip flop B - positive clock edge
	always @(posedge clock_in or negedge reset_n) begin
		if(!reset_n)
			qb <= 1'b0;
		else
			qb  <= qa; //fedback loop
	end
	
	//flip flop C - negative clock edge
	always @(negedge clock_in or negedge reset_n) begin
		if(!reset_n)
			qc <= 1'b0;
		else
			qc  <= qb; //fedback loop
	end
	
	assign clock_out = qb | qc;
		
endmodule
