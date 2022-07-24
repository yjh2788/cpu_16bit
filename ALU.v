module ALU (A,B,sel,V,C,dout);
parameter bw=8;
input wire [bw-1:0]A,B;
input wire[3:0]sel;
output V,C;
output reg[bw-1:0]dout;

reg [bw-1:0]lout;
wire [bw-1:0]aout,a,b,p;


arith #(bw) A0(A,B,sel[2:0],V,C,aout);
MBM  A1(A[7:0],B[7:0],p);//8bit mul
DIV1 A2(A,B,a);
DIV2 A3(A,B,b);

always@*
case (sel)
4'b1001 : dout = p;
4'b1011 : dout = a;
4'b1101 : dout = b;
default : dout=sel[3]? lout:aout;
endcase 

always@*
case (sel[2:1])
2'b00: lout=A&B;
2'b01: lout=A|B;
2'b10: lout=A^B;
2'b11: lout=~A;
default: lout=A&B;
endcase
endmodule 