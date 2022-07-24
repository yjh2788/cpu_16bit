`timescale 1ns/1ns
module tb_cpu8;
parameter bw=8;
reg clk,rstn;
reg [bw-1:0]din,cin;
//reg [9:0]cin;
wire [bw-1:0]addr,dout;

cpu8 U0(clk,rstn,cin,din, addr,dout);


always #50 clk=~clk;

initial begin
cin =8'd0;clk=0;rstn=0;din=8'd0;
#100 rstn=1;din=0;
#100 din=8'd1;
#100 din=8'd2;
#100 din=8'd3;
#100 din=8'd4;
#100 din=8'd5;
#100 din=8'd6;
#100 din=8'd7;
#300 cin=8'd2;
#200 din=8'd18;


/*#100 rstn=1;din=8'd1;cin=9'b000000000;
#100 din=8'd2;cin=9'b001001001;
#100 din=8'd3;cin=9'b010010010;
#100 din=8'd4;cin=9'b011011011;
#100 din=8'd5;cin=9'b100100100;
#100 din=8'd6;cin=9'b101101101;
#100 din=8'd7;cin=9'b110110110;

#100 din=8'd1;*/
end

endmodule
