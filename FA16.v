module FA16(A, B, Cin, S, Cout);
input [15:0] A, B;
input Cin;
output [15:0] S;
output Cout;
wire [15:0] A, B;
wire [15:0] S;
wire Carry;
FA8 A0 (A[7:0], B[7:0], Cin, S[7:0], Carry);
FA8 A1 (A[15:8], B[15:8], Carry, S[15:8], Cout);
endmodule
