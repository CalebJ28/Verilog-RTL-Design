`timescale 1us/1ns

module tb_ram_sp_async_read();

	//declare nets and variables
	reg clk = 0;
	reg [7:0] data_in;
	reg [3:0] address;
	reg write_en;
	wire [7:0] data_out;
	reg [1:0] delay;
	reg [7:0] wr_data;
	integer success_count, error_count, test_count;
	integer i;
	
	//instantiate the parameterized DUT
	ram_sp_sync_read RAM0(
		.clk(clk),
		.data_in(data_in),
		.address(address),
		.write_en(write_en),
		.data_out(data_out)
	);
	
	//we will use no outputs as we will use the global variables
	//connected to the modules ports
	
	task write_data (input [3:0] address_in, input [7:0] d_in);
		begin 
			@(posedge clk);
			write_en = 1;
			address = address_in;
			data_in = d_in;
		end
	endtask
	
	task read_data(input [3:0] address_in);
		begin
			@(posedge clk);
			write_en = 0;
			address = address_in;
		end
	endtask
	
	task compare_data(input [3:0] address, input [7:0] expected_data, input [7:0] observed_data);
		begin
			if (expected_data ===  observed_data) begin
				$display($time, " SUCCESS address = %0d, expected_data = %2x, observed_data = %2x", address, expected_data, observed_data);
				success_count = success_count + 1;
			end else begin
				$display($time, " ERROR address = %0d, expected_data = %2x, observed_data = %2x", address, expected_data, observed_data);
				error_count = error_count + 1;
			end
			test_count = test_count + 1;
		end
	endtask
	
	always begin #0.5 clk = ~clk; end
	
	//create stimulus
	
	initial begin
		#1;
		
		success_count = 0; error_count = 0; test_count = 0;
		
		#1.3;
		for(i=0;  i<17; i=i+1) begin
			wr_data = $random;
			write_data(i, wr_data);
			read_data(i);
			#0.1;
			compare_data(i, wr_data, data_out);
			delay = $random;
			#(delay);
		end
		
		read_data(7);
		read_data(8);
		
		$display($time, "TEST RESULTS success_count = %0d, error_count = %0d, test_count = %0d", success_count, error_count, test_count);
		#40 $stop;
	end
endmodule
