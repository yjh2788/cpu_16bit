module funit (A,B,FS,psw,fout);
parameter bw=8;
input wire[bw-1:0]A,B;
input wire[4:0]FS;
output wire[3:0] psw;
output wire[bw-1:0]fout;


wire C,V,N,Z;
wire	ir=1'b0;
wire	il=1'b0;
wire [bw-1:0]gout,hout;
assign psw={Z,N,C,V};

ALU #(bw) F0(A,B,FS[3:0],V,C,gout);
shitfer #(bw) F1(B,FS[3:1],ir,il,hout);

assign fout=FS[4]? hout:gout;
assign N=!C;
assign Z=!(|fout);


endmodule 