module FFD (input clk, reset, D, output reg Y1, Y2, Y3, Y4);
        always @ (posedge clk or posedge reset)begin
            if (reset) begin
                Q <= 1'b0;
            end
            else
                Q <= D;
        end
endmodule


//Salidas

module ejercicio3(input I1, I2, D1, D2, clk, reset, output wire Y1, Y2, Y3, Y4, Y5 output wire [4:0] Spres, Sfut);
    	wire S0, S1, S2, S0fut, S1fut, S2fut, S3, S3fut, S4, S4fut;

  not W0(NS0,S0);
  not W1(NS1,S1);
  not W2(NS2,S2);
  not W3(NS3,S3);
  not W4(NS4,S4);
  not W5(NI1,I1);
  not W6(NI2,I2);
  not W7(ND1,D1);
  not W8(ND2,D2);

	assign Ng = (NS0 & NS1 & NS2 & NS3 & NS4);

    	assign S0fut = (NI1 & NI2 & ND1 & ND2 & Ng)|(NI1 & NI2 & ND1 & ND2 & S0 & NS1 & NS2 & NS3 & NS4);
    	assign S1fut = (I1 & NI2 & ND1 & ND2 & Ng)|(I1 & NI2 & ND1 & ND2 & NS0 & S1 & NS2 & NS3 & NS4)|(I1 & NI2 & ND1 & ND2 & S0 & NS1 & NS2 & NS3 & NS4);
    	assign S2fut = (NI1 & I2 & ND1 & ND2 & Ng)|(NI1 & I2 & ND1 & ND2 & NS0 & NS1 & S2 & NS3 & NS4)|(NI1 & I2 & ND1 & ND2 & S0 & NS1 & NS2 & NS3 & NS4);
    	assign S3fut = (NI1 & NI2 & D1 & ND2 & Ng)|(NI1 & NI2 & D1 & ND2 & NS0 & NS1 & NS2 & S3 & NS4)|(NI1 & NI2 & D1 & ND2 & S0 & NS1 & NS2 & NS3 & NS4);
    	assign S4fut = (NI1 & NI2 & ND1 & D2 & Ng)|(NI1 & NI2 & ND1 & D2 & NS0 & NS1 & NS2 & NS3 & S4)|(NI1 & NI2 & ND1 & D2 & S0 & NS1 & NS2 & NS3 & NS4);

    	FFD U3(clk, reset, S0fut, S0);
    	FFD U4(clk, reset, S1fut, S1);
    	FFD U5(clk, reset, S2fut, S2);
    	FFD U6(clk, reset, S3fut, S3);
    	FFD U7(clk, reset, S4fut, S4);


	assign Y1 = S1;
    	assign Y2 = S2;
	assign Y3 = S3;
	assign Y4 = S4;

endmodule