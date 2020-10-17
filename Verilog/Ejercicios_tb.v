//include	"Ejercicios.v"

module testbench();
	
	reg clk, reset, A,B;
	wire Q;
	wire [1:0] Sfut, Spres;
	
	ejercicio1 al(A,B,clk,reset,Q,Sfut,Spres);
	

initial begin
	$display("Ejercicio 1");
	$display("Clk | reset | A | B  | Sf | S  || Q");
	$monitor("  %b  |   %b   | %b | %b | %b | %b || %b", clk, reset, A, B, Sfut, Spres, Q);
end

initial begin
	clk = 0;
	reset = 0;
	A = 0;
	B = 0;
	#1 reset = 1;
	#1 reset = 0;
	#10
	A = 1;
	B = 1;
	#20
	A = 0;
	B = 1;
	
end
//module testbench();
	
ejercicio3 el(A,clk,reset,Y1,Y2,Y3,Spres,Sfut);
initial begin
	#101
	$display("Ejercicio 3");
	$display("Clk | reset | A | B  | Y1 | 2  || Y3");
	$monitor("  %b  |   %b   | %b | %b | %b | %b || %b", clk, reset, A, B, Y1, Y2, Y3);
end

initial begin
	clk = 0;
	reset = 0;
	A = 0;
	//B = 0;
	#1 reset = 1;
	#1 reset = 0;
	#10
	A = 1;
	//B = 1;
	#20
	A = 0;
	//B = 1;
	
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