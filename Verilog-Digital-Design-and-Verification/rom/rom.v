
module rom
	#(parameter WIDTH = 8,
	  parameter DEPTH = 16,
	  parameter DEPTH_LOG = $clog2(DEPTH))
	(
	input clk,
	input [DEPTH_LOG-1:0] addr_rd,
	output reg [WIDTH-1:0] data_out
	);
	
	//declare the RAM array
	reg [WIDTH-1:0] rom [0:DEPTH-1];
	
	/*load the ROM with data from rom_init.hex
	relative location depends on the Modelsim project location*/
	initial begin
		$readmemh("../rom_init.hex", rom, 0, DEPTH-1);
	end
	
	//the read is asynchronous
	always @(posedge clk) begin
		data_out <= rom[addr_rd];
	end

endmodule
