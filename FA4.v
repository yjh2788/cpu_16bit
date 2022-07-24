module FA4 (A, B, Cin, S, Cout);
input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;
wire [3:0] A, B;
wire [3:0] S;
wire [3:1] Carry;
FA1 U0 (A[0], B[0], Cin, S[0], Carry[1]);
FA1 U1 (A[1], B[1], Carry[1], S[1], Carry[2]);
FA1 U2 (A[2], B[2], Carry[2], S[2], Carry[3]);
FA1 U3 (A[3], B[3], Carry[3], S[3], Cout);
endmodule
