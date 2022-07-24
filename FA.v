module FA(x,y,cin,s,c);

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
end
endmodule

