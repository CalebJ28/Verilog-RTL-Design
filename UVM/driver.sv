class alu_driver extends uvm_driver#(alu_sequence_item);
  `uvm_component_utils(alu_driver)

  virtual alu_interface vif;
  alu_sequence_item item;

  // Constructor
  function new(string name = "alu_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "Build Phase", UVM_HIGH)

    if (!uvm_config_db#(virtual alu_interface)::get(this, "*", "vif", vif)) begin
      `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
    end
  endfunction: build_phase

  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

  // Run phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "RUN Phase", UVM_HIGH)

    forever begin
      item = alu_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  endtask: run_phase

  // Drive task
  task drive(alu_sequence_item item);
    @(posedge vif.clock);
    vif.reset   <= item.reset;
    vif.a       <= item.a;
    vif.b       <= item.b;
    vif.op_code <= item.op_code;
  endtask: drive

endclass: alu_driver
