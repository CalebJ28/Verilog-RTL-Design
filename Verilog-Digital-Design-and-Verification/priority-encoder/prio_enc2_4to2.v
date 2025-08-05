module prio_enc2_4to2(
	input [3:0] d,
	output reg [1:0] q,
	output reg v

);

	//decode the priority of the set bits
	always @(*) begin
		case(1)	//checks if a signal is set
			d[3]: begin q = 2'd3; v = 1; end
			d[3]: begin q = 2'd2; v = 1; end
			d[3]: begin q = 2'd1; v = 1; end
			d[3]: begin q = 2'd0; v = 1; end	
			default: begin q = 2'd0; v = 0; end
		endcase
			
	end
	
	//valid is asserted when any bit is set
	always @(*) begin
		if (!d)
			v = 0;
		else
			v = 1;
	end
endmodule
