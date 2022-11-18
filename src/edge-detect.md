# Solve edge detection circuit!

```
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
   sub_module  instances [7:0] ({8{clk}}, in, pedge); 
endmodule

module sub_module (
    input clk,
    input  in,
    output  pedge
);
   reg  	 edgedetected    ;

   always @(posedge clk) 
     begin
	if (pedge) pedge = 0;
	else begin
	   if (in) // positive input edge
	     begin
		if (edgedetected == 0) // not detected before
		  begin
		     pedge = 1;
		     edgedetected = 1;
		  end
	     end
	   else begin
		edgedetected = 0; // reset edgedetected
	   end
	end	
     end
endmodule
```

# Analysis
0x24 = 0010 0100
0x81 = 1000 0001
0x09 = 0000 1001
0x63 = 0110 0011
0x0d = 0000 1101
