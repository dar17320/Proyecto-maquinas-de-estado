module testbench();
	
	reg clk, reset, A,B,C,D;
	wire Q;
	wire [3:0] sfut, spas;
	
	FlipflopD al(A,B,C,D,Q);

initial begin
	$dumbfile("Clk reset D | Q");
	$monitor("%b %b %b | %b", clk, reset, D, Q);
end

initial begin
	clk=0;
	reset=0;
	D=0;
	#11 D=1;
	#100;
	$finish;
end

always
	#5 clk = ~clk;

initial begin
	$dumbfile("FlipflopD.vcd");
	$dumbvars(0,testbench);
end
endmodule