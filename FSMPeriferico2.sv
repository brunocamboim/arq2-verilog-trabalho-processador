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