// Code your testbench here
// or browse Examples
module round_robin_Arbiter_fixed_time_slices_test;
  reg clk;
  reg reset_n;
  reg [3:0] REQ;
  wire [3:0] GNT;

  // Instantiate Design Under Test
   round_robin_arbiter_fixed_time_slices DUT(.clk(clk), .reset_n(reset_n), .REQ(REQ), .GNT(GNT));

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    // Initialize signals
    clk = 0;
    reset_n = 0;
    REQ = 4'b0;

    // Assert reset
    #5 reset_n = 1;

    // Stimulus
    @(negedge clk) REQ = 4'b1000;
    @(negedge clk) REQ = 4'b1010;
    @(negedge clk) REQ = 4'b0010;
    @(negedge clk) REQ = 4'b1111;
    @(negedge clk) REQ = 4'b1110;
    @(negedge clk) REQ = 4'b0100;
    @(negedge clk) REQ = 4'b0010;

    // Deassert reset
    #5 reset_n = 0;

    #100 $finish;
  end
  
  initial begin
   // VCD Dump Initialization
    $dumpfile("dump.vcd"); // Specifies the VCD file name
    $dumpvars(); // Dumps all variables in this module and submodules
  end
endmodule
