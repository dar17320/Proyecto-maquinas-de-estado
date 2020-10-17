//include	"Ejercicios.v"

module testbench();
	
	reg clk, reset, I1,I2,D1,D2;
	wire Q;
	wire [4:0] Sfut, Spres;
	
	salidas al(I1,I2,D1,D2,clk,reset,Q,Sfut,Spres);
	

initial begin
	$display("Salidas");
	$display("Clk | reset | I1 | I2 | D1 | D2 | Sf | S  || |");
	$monitor("  %b  |   %b   | %b | %b | %b | %b | %b | %b || |", clk, reset, I1, I2, D1, D2, Sfut, Spres);
end

initial begin
	clk = 0;
	reset = 0;
	I1 = 0;
	I2 = 0;
	D1 = 0;
	D2 = 0;
	#1 reset = 1;
	#1 reset = 0;
	#10
	I1 = 1;
	I2 = 0;
	D1 = 0;
	D2 = 0;
	#20
	I1 = 0;
	I2 = 1;
	D1 = 0;
	D2 = 0;
	#30
	I1 = 0;
	I2 = 0;
	D1 = 1;
	D2 = 0;
	#40
	I1 = 0;
	I2 = 0;
	D1 = 0;
	D2 = 1;

	
end

initial
	#200 $finish;

	always
	#5 clk = ~clk;

initial begin
	$dumpfile("Ejercicios_tb.vcd");
	$dumpvars(0,testbench);
end
endmodule