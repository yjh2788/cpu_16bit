module partial ( xj, xj1, x_sel, x2_sel, NEG, pp);
parameter w=8;
input wire[w:0]xj, xj1;
input  x_sel, x2_sel, NEG;
output reg[w:0]pp;

wire [w:0]xsel,x2sel,neg;
assign xsel={9{x_sel}};
assign x2sel={9{x2_sel}};
assign neg={9{NEG}};

reg [w:0]a1, a2, o1,xo1;
always@* begin
a1=  xj & xsel;
a2=  xj1 & x2sel;
o1=  a1 | a2 ;
pp = neg ^ o1;
end
endmodule
