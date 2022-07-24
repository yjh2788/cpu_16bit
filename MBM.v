module MBM(x,y,p);
parameter w=8;
input wire[w-1:0]x,y;
output wire[2*w-1:0]p;

wire [8:0]xj,xj1,ha_1s,ha_1c,fa_1s,fa_1c,fa_2s,fa_2c,pp1,pp2,pp3,pp4,tpp1,tpp2,tpp3,tpp4,tpp5,tpp6;
wire w11,w12, w21,w22, w31, w32, w41, w42, neg1, neg2, neg3, neg4;
assign xj1={x,1'b0};
assign xj={x[7],x};
assign tpp1={pp1[8],pp1[8],pp1[8:2]};
assign tpp2={ha_1c[8],ha_1c[8:1]};
assign tpp3={ha_1s[8],ha_1s[8],ha_1s[8:2]};
assign tpp4={fa_1c[8],fa_1c[8:1]};
assign tpp5={fa_1s[8],fa_1s[8],fa_1s[8:2]};

coding u1(1'b0,y[0],y[1],w11,w12,neg1);
coding u2(y[1],y[2],y[3],w21,w22,neg2); 
coding u3(y[3],y[4],y[5],w31,w32,neg3);
coding u4(y[5],y[6],y[7],w41,w42,neg4);

partial u5( xj, xj1, w11, w12, neg1, pp1);
partial u6( xj, xj1, w21, w22, neg2, pp2);
partial u7( xj, xj1, w31, w32, neg3, pp3);
partial u8( xj, xj1, w41, w42, neg4, pp4);
/*
Ha t0(tpp1[0],pp2[0],ha_1s[0],ha_1c[0]);
Ha t1(tpp1[1],pp2[1],ha_1s[1],ha_1c[1]);
Ha t2(tpp1[2],pp2[2],ha_1s[2],ha_1c[2]);
Ha t3(tpp1[3],pp2[3],ha_1s[3],ha_1c[3]);
Ha t4(tpp1[4],pp2[4],ha_1s[4],ha_1c[4]);
Ha t5(tpp1[5],pp2[5],ha_1s[5],ha_1c[5]);
Ha t6(tpp1[6],pp2[6],ha_1s[6],ha_1c[6]);
Ha t7(tpp1[7],pp2[7],ha_1s[7],ha_1c[7]);
Ha t8(tpp1[8],pp2[8],ha_1s[8],ha_1c[8]);
*/


genvar i;
generate
for (i=0;i<9;i=i+1)begin:e5
Ha u(tpp1[i],pp2[i],ha_1s[i],ha_1c[i]);
end 
endgenerate


generate
for (i=0;i<9;i=i+1)begin :k1
FA1 u(tpp2[i],tpp3[i],pp3[i],fa_1s[i],fa_1c[i]);
end 
endgenerate

generate
for (i=0;i<9;i=i+1)begin :k5
FA1 u(tpp4[i],tpp5[i],pp4[i],fa_2s[i],fa_2c[i]);
end 
endgenerate

wire [15:0]a,b;

assign a[15:0]={fa_2c[8:0],neg4,fa_1c[0], neg3,ha_1c[0],neg2,1'b0,neg1};
assign b[15:0]={fa_2s[8],fa_2s[8:0],fa_1s[1],fa_1s[0],ha_1s[1], ha_1s[0],pp1[1],pp1[0]};

assign cin=1'b0;
wire cout;

FA16 A0(a, b,cin, p,cout);

endmodule 

