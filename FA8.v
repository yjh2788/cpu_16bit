module FA8(A, B, Cin, S, Cout);
input [7:0] A, B;
input Cin;
output [7:0] S;
output Cout;
wire [7:0] A, B;
wire [7:0] S;
wire Carry;
FA4 S0 (A[3:0], B[3:0], Cin, S[3:0], Carry);
FA4 S1 (A[7:4], B[7:4], Carry, S[7:4], Cout);
endmodule
