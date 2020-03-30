`timescale 1ns / 1ps
// Code your design here
module fsmProcessador (P, ack, dado, send, clk, rst);
    input P;
    input [1:0] ack;
    output reg [15:0] dado;
    output reg [1:0] send;
    input clk;//clock
    input rst;//reset

    reg [1:0] S;//state processador
    reg [1:0] NS;//next state processador
    // reg [1:0] SM;//state mode
    // reg [1:0] NSM;//next state mode
    // reg [1:0] M;// variavel mode
  
    always @ (posedge clk)
        begin
            if (rst == 1) begin
                    S <= 2'b00;
                    send <= 2'b01;
                end
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
                    send = 2'b01;
                end
                2'b01 : begin
                    send = 2'b00;
                end
            endcase
        end

  //mode
    // always @ (posedge clk)
    //     begin
    //         if (rst == 1)
    //             SM <= 2'b00;
    //         else 
    //             SM <= NSM;
    //     end
  
    // always @ (*)
    //     begin
    //         case ({SM})
    //             2'b00 : begin
    //                 if (P == 0)
    //                     NSM = 2'b00;
    //                 else
    //                     NSM = 2'b01;
    //             end
    //             2'b01 : begin
    //                 if (R == 0)
    //                     NSM = 2'b01;
    //                 else
    //                     NSM = 2'b00;
    //             end
    //         endcase
    //     end

    // always @ (*)
    //     begin
    //         case ({S})
    //             2'b00 : begin
    //                 M = 2'b00;
    //             end
    //             2'b01 : begin
    //                 M = 2'b01;
    //             end
    //         endcase
    //     end
  
endmodule