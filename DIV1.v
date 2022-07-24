module DIV1(x,y,a);
parameter w=16;
input wire[w-1:0]x,y;
output wire[w-1:0]a;

assign a=x/y;
endmodule
