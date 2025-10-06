// Code your testbench here
// or browse Examples
`timescale 1us/1ns

module tb_uk_light();
  
  reg clk = 0; //need to program; so we are sending actual values to our DUT
  reg rst_n;
  reg enable;
  wire red;
  wire ylwred;
  wire green;
  wire yellow;
  wire [4:0] state_out;
  
  
  //state parameters
  parameter [4:0] OFF = 5'b00001,
                RED = 5'b00010,
                RDYLW = 5'b00100,
                GREEN = 5'b01000,
                YELLOW = 5'b10000;
  
  //instantiation of our DUT
  
  uk_light UK1(
    .clk(clk),
    .enable(enable),
    .rst_n(rst_n),
    .red(red),
    .ylwred(ylwred),
    .green(green),
    .yellow(yellow),
    .state_out(state_out)
  );
  
  //make a clock
  
  initial begin
    forever begin
      #1 clk = ~clk;
    end
  end
  
  initial begin
        $dumpfile("dump.vcd");
    $dumpvars(0, tb_uk_light);
    
    $monitor($time, "enable = %b, red = %b, ylwred = %b, yellow = %b, green = %b", enable, red, ylwred, yellow, green);
		
		rst_n = 0; #2.5; rst_n = 1; //the reset sequence
		enable = 0;
		repeat(10)@(posedge clk); //wait some time
		enable = 1;
		
		//let the semaphore cycle 2 timescale
		repeat(2) begin
			wait(state_out === GREEN);
			@(state_out); //wait for GREEN to be over
		end
		
		//disable the semaphore during Yellow state_out
		wait(state_out === YELLOW);
		@(posedge clk); enable = 0;
		
		//enable the semaphore again
		repeat(10) @(posedge clk);
		@(posedge clk); enable = 1;
		
		#40 $stop;
	
	end
endmodule
    

