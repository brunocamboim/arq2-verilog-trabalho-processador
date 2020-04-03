`timescale 1ns / 1ps
// Code your design here
module fsmProcessador (ack, send, ack2, send2, dado, clk, rst);
    input [1:0] ack;
    input [1:0] ack2;
    output reg [15:0] dado;
    output reg [1:0] send;
    output reg [1:0] send2;
    input clk;//clock
    input rst;//reset

    reg [1:0] S;//state processador
    reg [1:0] NS;//next state processador
  
    always @ (posedge clk)
        begin
            if (rst == 1) begin
                    S <= 2'b00;
                    send <= 2'b01;
                    send2 <= 2'b01;
                    dado <= 16'b00;
                end
            else 
                S <= NS;
        end
  
    always @ (*)
        begin
            if (ack == 0) 
                begin
                    if (ack2 == 0) 
                        NS = 2'b00;
                    else
                        NS = 2'b10;
                end
            else
                begin
                    if (ack2 == 0) 
                        NS = 2'b01;
                    else
                        NS = 2'b11;
                end
        end

    always @ (*)
        begin
            dado = dado + 1;
            case ({S})
                2'b00 : begin
                    send = 2'b01;
                    send2 = 2'b01;
                end
                2'b01 : begin
                    send = 2'b00;
                    send2 = 2'b01;
                end
                2'b10 : begin
                    send = 2'b01;
                    send2 = 2'b00;
                end
                2'b11 : begin
                    send = 2'b00;
                    send2 = 2'b00;
                end
            endcase
        end
  
endmodule

module fsmPeriferico1 (dado, send, ack, clk, rst);
    input [15:0] dado;
    input [1:0] send;
    output reg [1:0] ack;
    input clk;//clock
    input rst;//reset

    reg [1:0] S;//state
    reg [1:0] NS;//next state
    
    always @ (posedge clk)
        begin
            if (rst == 1) begin
                    S <= 2'b00;
                    ack <= 2'b00;
                end
            else 
                S <= NS;
        end
    
    always @ (*)
        begin
            case ({S})
                2'b00 : begin
                    if (send == 0)
                        NS = 2'b00;
                    else
                        NS = 2'b01;
                end
                2'b01 : begin
                    if (send == 0)
                        NS = 2'b00;
                    else
                        NS = 2'b01;
                end
            endcase
        end

    always @ (*)
        begin
            case ({S})
                2'b00 : begin
                    ack = 2'b00;
                end
                2'b01 : begin
                    ack = 2'b01;
                end
            endcase
        end
  
endmodule

module fsmPeriferico2 (dado, send, ack, clk, rst);
    input [15:0] dado;
    input [1:0] send;
    output reg [1:0] ack;
    input clk;//clock
    input rst;//reset

    reg [1:0] S;//state
    reg [1:0] NS;//next state
    
    always @ (posedge clk)
        begin
            if (rst == 1) begin
                    S <= 2'b00;
                    ack <= 2'b00;
                end
            else 
                S <= NS;
        end
    
    always @ (*)
        begin
            case ({S})
                2'b00 : begin
                    if (send == 0)
                        NS = 2'b00;
                    else
                        NS = 2'b01;
                end
                2'b01 : begin
                    if (send == 0)
                        NS = 2'b00;
                    else
                        NS = 2'b01;
                end
            endcase
        end

    always @ (*)
        begin
            case ({S})
                2'b00 : begin
                    ack = 2'b00;
                end
                2'b01 : begin
                    ack = 2'b01;
                end
            endcase
        end
  
endmodule