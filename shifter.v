module shitfer(din,sh,ir,il,dout);
parameter bw=8;
input wire[bw-1:0] din;
input wire[2:0]sh;
input ir,il;
output reg[bw-1:0] dout;


always@*
case (sh)
3'b000: dout=din;
3'b001: dout={din[bw-1],din[bw-1:1]};
3'b010: dout={ir,din[bw-1:1]};
3'b011: dout={din[bw-2:0],il};
3'b100: dout={din[0],din[bw-1:1]};
3'b101: dout={din[bw-2:0],din[bw-1]};
default: dout=din;
endcase
endmodule 