`timescale 1ns/1ns
module tb_cpu16;
parameter bw=16;
reg clk,rstn;
wire[bw-1:0]R0,R1;


cpu16 U0(clk,rstn,R0,R1);

//always #50 clk1=~clk1;
always #20 clk=~clk;
initial begin
clk=1;rstn=0;
#60 rstn=1;


end
endmodule
