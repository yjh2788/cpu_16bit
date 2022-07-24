module cpu16(clk,rstn,R0,R1,HEX0,HEX1,HEX2,HEX3);
parameter bw=16;
input clk,rstn;
output wire[bw-1:0]R0,R1;
output wire[6:0]HEX0,HEX1,HEX2,HEX3;

seg u2(R1[bw-1:12], HEX3);
seg u3(R1[11:8], HEX2);
seg u4(R1[7:4], HEX1);
seg u5(R1[3:0], HEX0);

wire[bw-1:0]din,dout;
wire [8:0]addr,pc;
wire [3:0]psw;
wire [12:0]cw;
wire [2:0]DA,AA,BA;
wire MW;
assign MW=cw[0];

cpu_dp #(bw) U0(clk1,rstn, cw, din, pc ,DA,AA,BA, addr, dout, psw,R0,R1);
cpu_cont #(bw) U1(clk1,rstn,din, psw,cw,DA,AA,BA,pc);

wire clk50,clk25,clk20,clk1,clk2;
clk_10MHz k1(
	.inclk0(clk),//50MHz
	.c0(clk50),//25MHz
	.c1(clk25),//12.5MHz
	.c2(clk20),//10MHz
	.c3(clk1));//1MHz
	clkdiv K2(
	.inclk0(clk20),
	.c0(clk2),//2kHz
	.c1(clk10));//10kHz

MM U2(
	.address(addr),
	.clock(clk1),
	.data(dout),
	.wren(MW),//mw
	.q(din));







endmodule
