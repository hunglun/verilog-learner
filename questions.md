What is the difference between module A and module B

```
module module_A (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

   reg [7:0] Q;
   
   always@(posedge clk) begin
      if (enable) Q = { Q[6:0], S} ;
   end
   assign Z = Q[{A,B,C}];

endmodule
```

```
module module_B (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

   reg [7:0] Q;
   
   always@(posedge clk) begin
      if (enable) Q = { Q[6:0], S} ;
      Z = Q[{A,B,C}];
   end

endmodule
```

