class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
  
  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;
  
  //Constructor
  function new(string name="alu_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  //Build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase", UVM_HIGH)
    
    env = alu_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  //Connect phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase", UVM_HIGH)
  endfunction: connect_phase
  
  //Run phase - a task because it can consume time and time consuming statements; functions cannot include time consuming statements
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    phase.raise_objection(this);
    
    //Logic
    
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;
    
    repeat(100) begin
    	test_seq = alu_test_sequence::type_id::create("test_seq");
    	test_seq.start(env.agnt.seqr);
    	#10;
    end
      
    
    phase.drop_objection(this);
    
  endtask: run_phase
  
endclass: alu_test
