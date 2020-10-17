module FlipflopD (input clk, reset, input [3:0] D, output reg [3:0] Q);

	always @(posedge clk or posedge reset) begin
		if (reset) 
			Q <= 3'b0;
	else
		Q <= D;
	end
endmodule