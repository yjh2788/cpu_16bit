module seg (bcd, seg);

	input [3:0] bcd;
	output [6:0] seg;
	
	reg [6:0] seg;
	
	always @*
			case(bcd)
			// LED 			   abc_defg CA
			4'b0000: seg = 7'b000_0001 ; // 0	01   
			4'b0001: seg = 7'b100_1111 ; // 1	4f	
			4'b0010: seg = 7'b001_0010 ; // 2	12
			4'b0011: seg = 7'b000_0110 ; // 3	06
			4'b0100: seg = 7'b100_1100 ; // 4	4c
			4'b0101: seg = 7'b010_0100 ; // 5	24
			4'b0110: seg = 7'b010_0000 ; // 6	20
			4'b0111: seg = 7'b000_1101 ; // 7	0d
			4'b1000: seg = 7'b000_0000 ; // 8	00
			4'b1001: seg = 7'b000_0100 ; // 9	04
			4'b1010: seg = 7'b000_1000 ; // A	24
			4'b1011: seg = 7'b111_0000 ; // B	20
			4'b1100: seg = 7'b011_0001 ; // C	0d
			4'b1101: seg = 7'b100_0110 ; // D	00
			4'b1110: seg = 7'b011_0000 ; // E	04
			4'b1111: seg = 7'b011_1000 ; // F	04
			
			default: seg = 7'b111_1110 ; // "-" for invalid code	7e
			endcase
endmodule


