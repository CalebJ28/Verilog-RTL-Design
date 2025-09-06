//Single port RAM with asynchronous read
//The size of the RAM is 16x8bit words
module ram_sp_sync_read(
	input clk,
	input [7:0] data_in,
	input [3:0] address,
	input write_en,
	output [7:0] data_out
	);
	
	//declare a bidimentional array for the RAM
	reg [7:0] ram [0:15];
	reg [3:0] addr_buff;
	
	/* RAM doesnt have a reset; so the default value from each location is X.
	The write is synchronous */
	always @(posedge clk) begin
		if (write_en) begin
			ram[address] <= data_in;
		end
		addr_buff <= address;
		
	end
	
	//the read is synchronous
	assign data_out = ram[addr_buff];
endmodule
