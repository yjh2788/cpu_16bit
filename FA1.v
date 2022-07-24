module FA1 (A,B, CI,S,CO);
input A, B, CI;
output S, CO;

assign S = A ^ B ^ CI;
assign CO = (A & B) | (CI & (A | B));
/*
input x,y,cin;
output s,c;
reg s,c;
reg w1,w2,w3;

always@(*)begin
 w1=x&y;
 w2=cin&y;
 w3=x&cin;

 s=x^y^cin;
 c=w1|w2|w3;
end*/
endmodule
