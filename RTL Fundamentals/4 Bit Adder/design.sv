module full_adder(
  input a, b, c_in,
  output s, c_out
);
  
wire net1, net2, net3;
  
assign net1 = a ^ b;

assign net2 = net1 & c_in;
  
assign net3 = a & b;
  
assign c_out = net2 | net3;
  
assign s = net1 ^ c_in;
  
endmodule

module full_adder4(
  input [3:0] a, b,
  input c_in,
  output [3:0] s,
  output c_out
);

  wire [2:0] carry;
  
    full_adder fa0 (
    .a    (a[0]),
    .b    (b[0]),
    .c_in (c_in),      
    .s    (s[0]),
    .c_out(carry[0])
  );
  
  full_adder fa1 (
    .a    (a[1]),
    .b    (b[1]),
    .c_in (carry[0]),
    .s    (s[1]),
    .c_out(carry[1])
  );
  
  full_adder fa2 (
    .a    (a[2]),
    .b    (b[2]),
    .c_in (carry[1]),
    .s    (s[2]),
    .c_out(carry[2])
  );
  
  full_adder fa3 (
    .a    (a[3]),
    .b    (b[3]),
    .c_in (carry[2]),
    .s    (s[3]),
    .c_out(c_out)
  );
  
endmodule
  
  
  

 
