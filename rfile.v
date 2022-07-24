module rfile(clk, rstn, DA, AA, BA, din, RW, A,B,R0,R1);
parameter bw=8;
input  RW, clk,rstn;
input wire[3:0]DA,AA,BA;
input wire [bw-1:0]din;
output reg [bw-1:0]A,B;
output reg[bw-1:0] R0,R1;
reg [bw-1:0] R2,R3,R4,R5,R6,R7,R8;

always@*
case(AA)
4'b0000: A=R0;
4'b0001: A=R1;
4'b0010: A=R2;
4'b0011: A=R3;
4'b0100: A=R4;
4'b0101: A=R5;
4'b0110: A=R6;
4'b0111: A=R7;
4'b1000: A=R8;
default: A=R0;
endcase


always@*
case(BA)
4'b0000: B=R0;
4'b0001: B=R1;
4'b0010: B=R2;
4'b0011: B=R3;
4'b0100: B=R4;
4'b0101: B=R5;
4'b0110: B=R6;
4'b0111: B=R7;
4'b1000: B=R8;
default: B=R0;
endcase

always@(negedge rstn or negedge clk)
begin
if(!rstn) begin 
 R0<={bw{1'b0}};
 R1<={bw{1'b0}};
 R2<={bw{1'b0}};
 R3<={bw{1'b0}};
 R4<={bw{1'b0}};
 R5<={bw{1'b0}};
 R6<={bw{1'b0}};
 R7<={bw{1'b0}};
 R8<={bw{1'b0}};
 end//R0~R8
else if(RW)
case(DA)
4'b0000: R0<=din;
4'b0001: R1<=din;
4'b0010: R2<=din;
4'b0011: R3<=din;
4'b0100: R4<=din;
4'b0101: R5<=din;
4'b0110: R6<=din;
4'b0111: R7<=din;
4'b1000: R8<=din;
default: R0<=din;
endcase



end



endmodule
