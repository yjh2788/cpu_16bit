module cpu_cont (clk,rstn,din, psw,cw,DA,AA,BA,pc);
parameter bw=8;
localparam MM_start = 9'b0;///start addr
localparam cw_start = 8'd188;//start addr
input clk,rstn;
input wire[bw-1:0] din;
input wire [3:0]psw;
output wire [12:0]cw;
output wire [2:0]DA,AA,BA;
output reg [8:0]pc;

wire psw_C,psw_V, psw_Z,psw_N,MC, IL, PI, PL;
reg mout;
reg [bw-1:0]ir;
wire [27:0]cword;
wire [3:0]MS;

wire [7:0]NA,opcode,MC_out;
reg 	[7:0]car;
assign psw_C=psw[1];
assign psw_V=psw[0];
assign psw_N=psw[2];
assign psw_Z=psw[3];
assign MC_out=MC ? {1'b0,opcode} : NA;


always @(posedge clk or negedge rstn)
if (!rstn) car<=cw_start;
else if (mout) car<=MC_out;
else car <=car+8'b1;

always@*
case(MS)
3'b000: mout=1'b0;
3'b001: mout=1'b1;
3'b010: mout=psw_C;
3'b011: mout=psw_V;
3'b100: mout=psw_Z;
3'b101: mout=psw_N;
3'b110: mout=!psw_C;
3'b111: mout=!psw_Z;
default: mout=1'b0;
endcase

assign NA=cword[27:20];
assign MS=cword[19:17];
assign MC=cword[16];
assign IL=cword[15];
assign PI=cword[14];
assign PL=cword[13];
assign cw=cword[12:0]; 

always @(posedge clk)
if(IL)
 ir<= din;

assign opcode = ir[15:9];
assign DA = ir[8:6];
assign AA = ir[5:3];
assign BA = ir[2:0];


always @(posedge clk, negedge rstn)
if(!rstn) pc <=MM_start;
else if(PI) pc<= pc+9'b1;
else if(PL) begin
 case(MS)
3'b010: pc<=pc+{ir[7],ir[7:0]};
3'b011: pc<=pc+{ir[7],ir[7:0]};
3'b100: pc<=pc+{ir[7],ir[7:0]};
3'b101: pc<=pc+{ir[7],ir[7:0]};
3'b110: pc<=pc+{ir[7],ir[7:0]};
3'b111: pc<=pc+{ir[7],ir[7:0]};
default: pc <= ir[7:0] ;
endcase
end


wire en;
assign en=1'b1;

cwrom U0(
	.address(car),
	.clock(clk),
	.rden(en),
	.q(cword));


endmodule 