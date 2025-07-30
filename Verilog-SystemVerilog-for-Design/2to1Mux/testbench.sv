module mux2to1_tb ();
  
  reg a;
  reg b;
  reg sel;
  wire y;
  
  mux2to1 MUX (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  ); 
  
  integer i;
  
  initial begin
    a = 1'b0;
    b = 1'b0;
    sel = 1'b0;
    #5;
    for (i=0; i<20; i++) begin
      a = ~a;
      b = 1'b0;
      sel = ~sel;
      #5;
    end
  end
  
  initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, mux2to1_tb);
  end
  
endmodule
