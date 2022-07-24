module cpu_dp(clk,rstn, cw,din,pc,DA,AA,BA, addr,dout, psw,R0,R1);
parameter bw=8;
input clk,rstn;
input wire [8:0]pc;
input wire [12:0]cw;
input wire [2:0]DA,AA,BA;
input wire [bw-1:0]din;
output wire [bw-1:0]dout,R0,R1;
output wire [8:0]addr;
output reg [3:0]psw;


wire [3:0]tpsw;
wire TD,TA,TB;
wire [4:0]FS;
wire MB,MD,RW;
wire [bw-1:0] busA,busB,busD,fout,opA,opB;
wire [bw-1:0]cin;

assign dout= busB;
assign TD = cw[12];
assign TA = cw[11];
assign TB = cw[10];
assign MB = cw[9];
assign FS = cw[8:4];
assign MD = cw[3];
assign RW = cw[2];
assign MM = cw[1];

assign cin= {{13{1'b0}},BA};
rfile #(bw) U0(clk,rstn,{TD,DA},{TA,AA},{TB,BA},busD,RW,opA,opB,R0,R1);
funit #(bw) U1(busA,busB,FS,tpsw,fout);

always @(negedge clk)
if (RW) psw<=tpsw;
	

assign addr = MM ? pc : opA[8:0];
assign busA=opA;
assign busB=MB? cin:opB;
assign busD=MD? din:fout;
endmodule 