module coding(y2i_1,y2i,y2i_2,x_sel,x_sel2,neg);
input wire y2i_1,y2i,y2i_2;
output x_sel,x_sel2,neg;

assign x_sel= y2i_1^y2i;
assign neg = y2i_2;

wire L,H;
assign L=y2i_1&y2i;
nor (H,y2i_1,y2i);

assign x_sel2=y2i_2? H:L;
endmodule
