# What is the difference between module A and module B

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

# How to simplify this code ?

```
module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

   integer 	   x,y;
   
   


   always@(posedge clk) begin
      
      if(load) begin  ;
	 q <= data;	 
      end
      else begin
	 for (x=0; x<=15; x=x+1) begin 
            for (y=0; y<=15; y=y+1) begin 
	       q[(x + y*16)] <= q[(x==0 ? 15 : x-1) + (y==0 ? 15 : y-1)*16]+
		   q[(x==0 ? 15 : x-1) + y                *16]+
		   q[(x==0 ? 15 : x-1) + (y==15 ? 0 : y+1)*16]+
		   q[x                 + (y==0 ? 15 : y-1)*16]+
		   q[x                 + (y==15 ? 0 : y+1)*16]+
		   q[(x==15 ? 0 : x+1) + (y==0 ? 15 : y-1)*16]+
		   q[(x==15 ? 0 : x+1) + y                *16]+
		   q[(x==15 ? 0 : x+1) + (y==15 ? 0 : y+1)*16] == 3 ? 1: 
		   q[(x==0 ? 15 : x-1) + (y==0 ? 15 : y-1)*16]+
		   q[(x==0 ? 15 : x-1) + y                *16]+
		   q[(x==0 ? 15 : x-1) + (y==15 ? 0 : y+1)*16]+
		   q[x                 + (y==0 ? 15 : y-1)*16]+
		   q[x                 + (y==15 ? 0 : y+1)*16]+
		   q[(x==15 ? 0 : x+1) + (y==0 ? 15 : y-1)*16]+
		   q[(x==15 ? 0 : x+1) + y                *16]+
		   q[(x==15 ? 0 : x+1) + (y==15 ? 0 : y+1)*16] != 2 ? 0: q[(x + y*16)];	       
            end // block: gen_y	    
         end // block: gen_x
      end // else: !if(load)
      
   end // always@ (posedge clk)
   
   
endmodule // top_module

```