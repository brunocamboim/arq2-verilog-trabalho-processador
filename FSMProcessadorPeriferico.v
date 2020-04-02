// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module testaprocessadorperifericos;

	// Inputs
	reg rst;

	reg clkProcessador;
	reg clkPeriferico1;
	reg clkPeriferico2;

	// Outputs
	wire [15:0] dado;
	wire [1:0] send;
	wire [1:0] send2;
	wire [1:0] ack;
	wire [1:0] ack2;

	// Instantiate the Unit Under Test (UUT)
	fsmProcessador uut1 (
		.ack(ack), 
		.send(send),
		.ack2(ack2),
		.send2(send2),
		.dado(dado), 
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

	fsmPeriferico2 uut3 (
		.dado(dado),
		.send(send2), 
		.ack(ack2), 
		.clk(clkPeriferico2), 
		.rst(rst)
	);

	
	initial begin
		// Initialize Inputs
      
      $dumpfile("dump.vcd");
      $dumpvars;

		clkProcessador = 0;
		clkPeriferico1 = 0;
		clkPeriferico2 = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
        #100;
        
		// Add stimulus here
		
	  $finish;
	end
   always  #10  clkProcessador =  ! clkProcessador;
   always  #17  clkPeriferico1 =  ! clkPeriferico1;
   always  #8  	clkPeriferico2 =  ! clkPeriferico2;
endmodule