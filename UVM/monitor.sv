class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor)

  virtual alu_interface vif;
  alu_sequence_item item;
  
  
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  

  // Constructor
  function new(string name = "alu_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "Inside Constructor", UVM_HIGH)
    
    
  endfunction: new

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Build Phase", UVM_HIGH)
    
    monitor_port = new("monitor_port", this);

    if (!(uvm_config_db#(virtual alu_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS", "Failed to get VIF from config DB!")
    end
  endfunction: build_phase

  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Connect Phase", UVM_HIGH)
  endfunction: connect_phase

  // Run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "Run Phase", UVM_HIGH)

    forever begin
      item = alu_sequence_item::type_id::create("item");

      wait (!vif.reset);

      // Sample inputs
      @(posedge vif.clock);
      item.a = vif.a;
      item.b = vif.b;
      item.op_code = vif.op_code;

      // Sample output
      @(posedge vif.clock);
      item.result = vif.result;
      
      //Send item to scoreboard
      monitor_port.write(item);

      
    end
  endtask: run_phase

endclass: alu_monitor
