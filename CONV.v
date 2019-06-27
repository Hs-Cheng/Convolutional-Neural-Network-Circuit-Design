
`timescale 1ns/10ps

module  CONV(
        input wire clk,
	input wire reset,
	output reg busy,
	input wire ready,
        output reg [11:0] iaddr,
	input wire [19:0] idata,
	output reg cwr,
	output reg [11:0] caddr_wr,
	output reg [19:0] cdata_wr,
	output reg crd,
	output reg [11:0] caddr_rd,
	input wire [19:0] cdata_rd,
	output reg [2:0]  csel
	);


reg [6:0] indexx, indexy;
reg [1:0] sindex;

// Self-Defined registers
reg [3:0] state;
reg [19:0] buffer [3:0][65:0];
reg [35:0] string0 [3:0];
reg [35:0] string1 [3:0];
reg [35:0] l0temp1, l0temp2, l0temp3, l0temp4;
reg [6:0] center [1:0];
reg [11:0] l0addr, l1addr, l2addr;
reg [19:0] temp0, temp1;
reg write0;
wire [39:0] filter1 [8:0];
wire [39:0] filter2 [8:0];

integer i, j, k;

// Macro definition
parameter ini = 3'b000;
parameter layer0 = 3'b001;
parameter layer1 = 3'b010;
parameter layer2 = 3'b011;
parameter idle = 3'b100;
parameter layer0_calc = 3'b101;
parameter layer0_write = 3'b110;
parameter layer0_relu = 3'b111;
parameter layer0_calc2 = 4'b1000;
parameter layer0_calc3 = 4'b1001;
parameter idle2 = 4'b1010;
parameter idle3 = 4'b1011;
parameter bias1 = 40'h0000001310;      //Pixel 0: 7.446289e-02
parameter bias2 = 40'hFFFFFF7295;      //Pixel 1: -5.524139e-01

// Kernal weights
assign filter1[0] = 40'h000000A89E;      //Pixel 0: 6.586609e-01
assign filter2[0] = 40'hFFFFFFDB55;      //Pixel 1: -1.432343e-01
assign filter1[1] = 40'h00000092D5;      //Pixel 2: 5.735626e-01
assign filter2[1] = 40'h0000002992;      //Pixel 3: 1.623840e-01
assign filter1[2] = 40'h0000006D43;      //Pixel 4: 4.268036e-01
assign filter2[2] = 40'hFFFFFFC994;      //Pixel 5: -2.125854e-01
assign filter1[3] = 40'h0000001004;      //Pixel 6: 6.256104e-02
assign filter2[3] = 40'h00000050FD;      //Pixel 7: 3.163605e-01
assign filter1[4] = 40'hFFFFFF8F71;      //Pixel 8: -4.396820e-01
assign filter2[4] = 40'h0000002F20;      //Pixel 9: 1.840820e-01
assign filter1[5] = 40'hFFFFFF6E54;      //Pixel 10: -5.690308e-01
assign filter2[5] = 40'h000000202D;      //Pixel 11: 1.256866e-01
assign filter1[6] = 40'hFFFFFFA6D7;      //Pixel 12: -3.482819e-01
assign filter2[6] = 40'h0000003BD7;      //Pixel 13: 2.337494e-01
assign filter1[7] = 40'hFFFFFFC834;      //Pixel 14: -2.179565e-01
assign filter2[7] = 40'hFFFFFFD369;      //Pixel 15: -1.741791e-01
assign filter1[8] = 40'hFFFFFFAC19;      //Pixel 16: -3.277435e-01
assign filter2[8] = 40'h0000005E68;      //Pixel 17: 3.687744e-01

always@(posedge clk or posedge reset) begin
	if(reset) begin
		for(i = 0; i < 4; i = i + 1) begin
			for(j = 0; j < 66; j = j + 1) begin
				buffer[i][j] <= 20'b0;
			end
		end
		state <= idle;
		busy <= 0;
		indexx <= 7'd1;
		indexy <= 7'd1;
		center[0] <= 7'b1;
		center[1] <= 7'b1;
		sindex <= 2'b0;
		csel <= 3'b000;
		cwr <= 1'b0;
		crd <= 1'b0;
		l0addr <= 12'b0;
		l1addr <= 12'b0;
		l2addr <= 12'b0;
		write0 <= 1'b1;
	end
	else begin
		crd <= 1'b0;
		case (state)
			idle: begin
				state <= ini;
				iaddr <= 12'b0;
				busy <= 1;
			end
			idle2: begin
				busy <= 0;
				for(i = 0; i < 4; i = i + 1) begin
					for(j = 0; j < 66; j = j + 1) begin
						buffer[i][j] <= 20'b0;
					end
				end
				indexx <= 7'b1;
				indexy <= 7'b1;
				center[0] <= 7'b1;
				center[1] <= 7'b1;
				sindex <= 2'b0;
				csel <= 3'b000;
				cwr <= 1'b0;
				l0addr <= 12'b0;
				l1addr <= 12'b0;
				l2addr <= 12'b0;
				write0 <= 1'b1;
				state <= idle3;
			end
			idle3: begin
				if(ready == 1'b1) begin
					state <= idle;
				end
			end
			ini: begin
				buffer[indexx][indexy] <= idata;
				iaddr <= iaddr + 12'b1;
				indexy <= indexy + 7'b1;
				if(indexy == 7'd64) begin
					state <= layer0;
					indexx <= indexx + 1'b1;
					indexy <= 7'b1;
				end
			end
			layer0: begin
				buffer[indexx][indexy] <= idata;
				iaddr <= iaddr + 12'b1;
				indexy <= indexy + 7'b1;
				if(iaddr > 12'd4093 && indexy == 7'd64) begin
					state <= layer0_calc;
					for(k = 0; k < 66; k = k + 1) begin
						buffer[indexx + 1'b1][k] <= 20'b0;
					end
				end
				else if(indexx == 7'd3 && indexy == 7'd64) begin
					indexx <= 7'd2;
					indexy <= 7'b1;
					state <= layer0_calc;
				end
				else if(indexy == 7'd64) begin
					indexx <= indexx + 1'b1;
					indexy <= 7'b1;
				end
			end
			layer0_calc: begin
				cwr <= 1'b0;
				l0temp1 <= buffer[center[0]-1][center[1]-1]*filter1[0] + buffer[center[0]-1][center[1]]*filter1[1] + buffer[center[0]-1][center[1]+1]*filter1[2] + buffer[center[0]][center[1]-1]*filter1[3];
				l0temp2 <= buffer[center[0]-1][center[1]-1]*filter2[0] + buffer[center[0]-1][center[1]]*filter2[1] + buffer[center[0]-1][center[1]+1]*filter2[2] + buffer[center[0]][center[1]-1]*filter2[3];
				//string0[sindex] <= buffer[center[0]-1][center[1]-1]*filter1[0] + buffer[center[0]-1][center[1]]*filter1[1] + buffer[center[0]-1][center[1]+1]*filter1[2] + buffer[center[0]][center[1]-1]*filter1[3] + buffer[center[0]][center[1]]*filter1[4] + buffer[center[0]][center[1]+1]*filter1[5] + buffer[center[0]+1][center[1]-1]*filter1[6] + buffer[center[0]+1][center[1]]*filter1[7] + buffer[center[0]+1][center[1]+1]*filter1[8] + {bias1, 16'b0};
				//string1[sindex] <= buffer[center[0]-1][center[1]-1]*filter2[0] + buffer[center[0]-1][center[1]]*filter2[1] + buffer[center[0]-1][center[1]+1]*filter2[2] + buffer[center[0]][center[1]-1]*filter2[3] + buffer[center[0]][center[1]]*filter2[4] + buffer[center[0]][center[1]+1]*filter2[5] + buffer[center[0]+1][center[1]-1]*filter2[6] + buffer[center[0]+1][center[1]]*filter2[7] + buffer[center[0]+1][center[1]+1]*filter2[8] + {bias2, 16'b0};
				state <= layer0_calc2;
			end
			layer0_calc2: begin
				l0temp3 <= buffer[center[0]][center[1]]*filter1[4] + buffer[center[0]][center[1]+1]*filter1[5] + buffer[center[0]+1][center[1]-1]*filter1[6] + buffer[center[0]+1][center[1]]*filter1[7];
				l0temp4 <= buffer[center[0]][center[1]]*filter2[4] + buffer[center[0]][center[1]+1]*filter2[5] + buffer[center[0]+1][center[1]-1]*filter2[6] + buffer[center[0]+1][center[1]]*filter2[7];
				state <= layer0_calc3;
			end
			layer0_calc3: begin
				string0[sindex] <= l0temp1 + l0temp3 + buffer[center[0]+1][center[1]+1]*filter1[8] + {bias1, 16'b0};
				string1[sindex] <= l0temp2 + l0temp4 + buffer[center[0]+1][center[1]+1]*filter2[8] + {bias2, 16'b0};
				state <= layer0_relu;
			end
			layer0_relu: begin
				string0[sindex] <= string0[sindex][35] ? 36'b0 : string0[sindex];
				string1[sindex] <= string1[sindex][35] ? 36'b0 : string1[sindex];
				state <= layer0_write;
			end
			layer0_write: begin
				cwr <= 1;
				if(write0) begin
					csel <= 3'b001;
					caddr_wr <= l0addr;
					cdata_wr <= string0[sindex][15] ? string0[sindex][35:16] + 1'b1 : string0[sindex][35:16];
					write0 <= 1'b0;
				end
				else if(!write0) begin
					csel <= 3'b010;
					caddr_wr <= l0addr;
					cdata_wr <= string1[sindex][15] ? string1[sindex][35:16] + 1'b1 : string1[sindex][35:16];
					write0 <= 1'b1;
					if(sindex == 2'd3) begin
						sindex <= 2'b0;
						state <= layer1;
					end
					else begin
						sindex <= sindex + 2'b1;
						state <= layer0_calc;
						if(center[0] == 7'd1) begin
							center[0] <= 7'd2;
							l0addr <= l0addr + 12'd64;
						end
						else if(center[0] == 7'd2) begin
							center[0] <= 7'd1;
							center[1] <= center[1] + 7'd1;
							l0addr <= l0addr - 7'd63;
						end
					end
				end
			end
			layer1: begin
				if(write0) begin
					csel <= 3'b011;
					caddr_wr <= l1addr;
					write0 <= 1'b0;
					if((string0[0] >= string0[1]) && (string0[0] >= string0[2]) && (string0[0] >= string0[3])) begin
						cdata_wr <= string0[0][15] ? string0[0][35:16] + 1'b1 : string0[0][35:16];
						temp0 <= string0[0][15] ? string0[0][35:16] + 1'b1 : string0[0][35:16];
					end
					else if((string0[1] >= string0[0]) && (string0[1] >= string0[2]) && (string0[1] >= string0[3])) begin
						cdata_wr <= string0[1][15] ? string0[1][35:16] + 1'b1 : string0[1][35:16];
						temp0 <= string0[1][15] ? string0[1][35:16] + 1'b1 : string0[1][35:16];
					end
					else if((string0[2] >= string0[0]) && (string0[2] >= string0[1]) && (string0[2] >= string0[3])) begin
						cdata_wr <= string0[2][15] ? string0[2][35:16] + 1'b1 : string0[2][35:16];
						temp0 <= string0[2][15] ? string0[2][35:16] + 1'b1 : string0[2][35:16];
					end
					else begin
						cdata_wr <= string0[3][15] ? string0[3][35:16] + 1'b1 : string0[3][35:16];
						temp0 <= string0[3][15] ? string0[3][35:16] + 1'b1 : string0[3][35:16];
					end
				end
				else if(!write0) begin
					csel <= 3'b100;
					caddr_wr <= l1addr;
					write0 <= 1'b1;
					if((string1[0] >= string1[1]) && (string1[0] >= string1[2]) && (string1[0] >= string1[3])) begin
						cdata_wr <= string1[0][15] ? string1[0][35:16] + 1'b1 : string1[0][35:16];
						temp1 <= string1[0][15] ? string1[0][35:16] + 1'b1 : string1[0][35:16];
					end
					else if((string1[1] >= string1[0]) && (string1[1] >= string1[2]) && (string1[1] >= string1[3])) begin
						cdata_wr <= string1[1][15] ? string1[1][35:16] + 1'b1 : string1[1][35:16];
						temp1 <= string1[1][15] ? string1[1][35:16] + 1'b1 : string1[1][35:16];
					end
					else if((string1[2] >= string1[0]) && (string1[2] >= string1[1]) && (string1[2] >= string1[3])) begin
						cdata_wr <= string1[2][15] ? string1[2][35:16] + 1'b1 : string1[2][35:16];
						temp1 <= string1[2][15] ? string1[2][35:16] + 1'b1 : string1[2][35:16];
					end
					else begin
						cdata_wr <= string1[3][15] ? string1[3][35:16] + 1'b1 : string1[3][35:16];
						temp1 <= string1[3][15] ? string1[3][35:16] + 1'b1 : string1[3][35:16];
					end
					state <= layer2;
					l1addr <= l1addr + 1'b1;
				end
			end
			layer2: begin
				csel <= 3'b101;
				if(l2addr == 12'd2048) begin
					busy <= 0;
					state <= idle2;
				end
				else if(write0) begin
					caddr_wr <= l2addr;
					l2addr <= l2addr + 1'b1;
					write0 <= 1'b0;
					cdata_wr <= temp0;
				end
				else if(!write0) begin
					caddr_wr <= l2addr;
					l2addr <= l2addr + 1'b1;
					write0 <= 1'b1;
					cdata_wr <= temp1;
					if(l2addr == 2047) begin
						l2addr <= l2addr + 12'b1;
					end
					else if(center[0] == 7'd2 && center[1] == 7'd64) begin
                                                center[0] <= 7'd1;
                                                center[1] <= 7'd1;
                                                for(j = 0; j < 66; j = j + 1) begin
                                                        buffer[0][j] <= buffer[2][j];
                                                        buffer[1][j] <= buffer[3][j];
                                                end
                                                l0addr <= l0addr + 1'b1;
						state <= layer0;
                                        end
					else begin
						state <= layer0_calc;
						center[0] <= 7'd1;
						center[1] <= center[1] + 7'd1;
						l0addr <= l0addr - 7'd63;
					end
				end
			end
		endcase
	end
end
endmodule
