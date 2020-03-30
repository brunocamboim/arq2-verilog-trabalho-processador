// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module testaprocessadorperifericos;

	// Inputs
	reg P;
	reg rst;

	reg clkProcessador;
	reg clkPeriferico1;
	reg clkPeriferico2;

	// Outputs
	wire [15:0] dado;
	wire [1:0] send;
	wire [1:0] ack;

	// Instantiate the Unit Under Test (UUT)
	fsmProcessador uut1 (
		.P(P),
		.ack(ack), 
		.dado(dado), 
		.send(send), 
		.clk(clkProcessador), 
		.rst(rst)
	);

	fsmPeriferico1 uut2 (
		.dado(dado),
		.send(send), 
		.ack(ack), 
		.clk(clkPeriferico1), 
		.rst(rst)
	);

	
	initial begin
		// Initialize Inputs
      
      $dumpfile("dump.vcd");
      $dumpvars;
		P = 0;
		ack = 0; 
		dado = 0;
		send = 0;
		clkProcessador = 0;
		clkPeriferico1 = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
        #10;
        
		// Add stimulus here
		ack = 1;
		#40;
		ack = 0;
		#40;
		// #50;
		// send = 0;
		// #10;
	  $finish;
	end
   always  #10  clkProcessador =  ! clkProcessador;
   always  #17  clkPeriferico1 =  ! clkPeriferico1;
endmodule