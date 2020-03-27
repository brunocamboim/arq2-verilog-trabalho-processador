
// Code your design here
module fsmProcessador (ack, dado, send, clk, rst);
  input [1:0] ack;
  output reg [15:0] dado;
  output reg [1:0] send;
  input clk;//clock
  input rst;//reset

  reg [1:0] S;//state
  reg [1:0] NS;//next state
  
  always @ (posedge clk)
  	begin
      if (rst == 1)
        S <= 2'b00;
        send <= 2'b01;
      else 
        S <= NS;
    end
  
  always @ (*)
	begin
    case ({S})
      2'b00 : begin
        if (ack == 0)
          NS = 2'b00;
        else
          NS = 2'b01;
      end
      2'b01 : begin
        if (ack == 0)
          NS = 2'b01;
        else
          NS = 2'b00;
      end
	end

  always @ (*)
	begin
    case ({S})
      2'b00 : begin
        send = 2'b01;
      end
      2'b01 : begin
        send = 2'b00;
      end
	end
  
endmodule