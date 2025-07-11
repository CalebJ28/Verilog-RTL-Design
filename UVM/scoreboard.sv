class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard)
  
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];
  
  
  //Constructor
  function new(string name="alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCD_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  //Build phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCD_CLASS", "Build Phase", UVM_HIGH)
    
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  //Connect phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCD_CLASS", "Connect Phase", UVM_HIGH)
  endfunction: connect_phase
  
  //Write Method
  
  function void write(alu_sequence_item item);
    transactions.push_back(item);
    
  endfunction: write
  
  //Run phase - a task because it can consume time and time consuming statements; functions cannot include time consuming statements
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCD_CLASS", "Run Phase", UVM_HIGH)

    forever begin
      //Get Packet
      
      //Generate Expected Value
      
      //Compare
      
      //Score
      
      
      alu_sequence_item curr_trans;
      wait((transactions.size() != 0));
      
      curr_trans = transactions.pop_front();
      
      compare(curr_trans);
      
      
      
      
      
      
      
    end
    
  endtask: run_phase
  
  
  task compare(alu_sequence_item curr_trans);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.op_code)
      0: begin //A+B
        expected = curr_trans.a + curr_trans.b;
      end
      1: begin //A-B
        expected = curr_trans.a - curr_trans.b;
      end
      2: begin //A*B
        expected = curr_trans.a * curr_trans.b;
      end
      3: begin //A/B
        expected = curr_trans.a / curr_trans.b;
      end
    endcase
    
    actual = curr_trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed; ACT=%d, EXP=%d", actual, expected))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed; ACT=%d, EXP=%d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
  
endclass: alu_scoreboard
