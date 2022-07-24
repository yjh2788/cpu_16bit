module rca
#(parameter bw = 8)
( input [bw-1:0] a, b,
input cin, output reg [bw-1:0] sum,
output reg co, neg, ov );

reg [bw-1:0] c;
generate
genvar i;
for (i = 0; i< bw; i=i+1) begin: stage
case(i)
0: begin
always @(*) begin
sum[i] = a[i] ^ b[i] ^ cin;
c[i] = a[i] & b[i] | b[i] & cin | a[i] & cin;
end
end

bw-1: begin
always @(*) begin
sum[i] = a[i] ^ b[i] ^ c[i-1];
co = a[i] & b[i] | b[i] & c[i-1] | a[i] & c[i-1];
neg = sum[i];
ov = co ^ c[i-1]; // overflow
end
end
default: begin
always @(*) begin
sum[i] = a[i] ^ b[i] ^ c[i-1];
c[i] = a[i] & b[i] | b[i] & c[i-1] | a[i] & c[i-1];
end
end
endcase
end
endgenerate
endmodule 