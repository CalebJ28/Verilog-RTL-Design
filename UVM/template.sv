class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
  
  //Constructor
  function new(string name="alu_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  //Build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase", UVM_HIGH)
  endfunction: build_phase
  
  //Connect phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase", UVM_HIGH)
  endfunction: connect_phase
  
  //Run phase - a task because it can consume time and time consuming statements; functions cannot include time consuming statements
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    //Logic
    
  endtask: run_phase
  
endclass: alu_test
