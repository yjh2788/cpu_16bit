module DIV2(x,y,b);
parameter w=16;
input wire[w-1:0]x,y;
output wire[w-1:0]b;

assign b=x%y;
endmodule
