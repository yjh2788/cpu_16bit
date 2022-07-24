module arith (A,B,sel,V,C,dout);
parameter bw=8;
input wire[bw-1:0]A,B;
input wire[2:0]sel;
output V,C;
output wire [bw-1:0]dout;

wire [bw-1:0]Y;
wire s0=sel[1];
wire s1=sel[2];

assign Y=(B&{bw{s0}}) | (~B&{bw{s1}});
wire TMP;

rca #(bw) U0(A,Y,sel[0],dout,C,TMP,V);


endmodule
