module Ha(x,y,s,c);
input x,y;
output s,c;

xor (s,x,y);
assign c=x&y;
endmodule
