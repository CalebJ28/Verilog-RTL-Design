`timescale 1us/1ns

module tb_rom();

	//declare nets and variables
	localparam WIDTH = 8;
	localparam DEPTH = 16;
	localparam DEPTH_LOG = $clog2(DEPTH);
	
	reg clk = 0;
	reg [DEPTH_LOG-1:0] addr_rd;
	wire [WIDTH-1:0] data_rd;
	
	integer i;
	
	//instantiate the module
	rom #(.WIDTH(WIDTH),
		.DEPTH(DEPTH)
		) ROM0
		(.clk (clk),
		.addr_rd(addr_rd),
		.data_out(data_rd)
	);
	
	//create the clock signal
	always begin #0.5 clk = ~clk; end
	
	initial begin
		#1;
		$display($time, "ROM content : ");
		for (i=0; i<DEPTH; i=i+1) begin
			read_data(i);
		end
		#40 $stop;
	end
	
	//Read the data async.
	task read_data(input[DEPTH_LOG-1:0] address_in);
		begin 
			@(posedge clk);
			addr_rd = address_in;
			@(posedge clk);
			#0.1;
			$display($time, "address = %2d, data_rd = %x", addr_rd, data_rd);
		end
	endtask
endmodule
