// ALU Verification and Training
// Caleb Joseph

`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"


//Include Files
//Order of the include is very important

`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top;
  
  //Instantiation
  
  logic clock;
  
  alu_interface intf(.clock(clock));
  
  alu dut(
    .clock(intf.clock),
    .reset(intf.reset),
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.op_code),
    .ALU_Out(intf.result),
    .CarryOut(intf.carry_out)
  );
  
  initial begin
    run_test();
  end
  
  
  //Interface Setting
  
  initial begin
    uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf);
  end
  
  //Start the test
  initial begin
    run_test("alu_test");
  end
  
  //Clock generation
  
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end
  
  //5000 Clock cycles before end
  initial begin
    #5000;
    $display("Ran oujt of clock cycles");
    $finish();
  end
  
  //Waveform variable dump
  initial begin
    $dumpfile("d.vcd");
    $finish();
  end
    
  
endmodule: top
