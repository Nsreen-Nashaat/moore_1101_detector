module moore_1101_detector(
    input clk,
    input x,
    input reset_n,
    output reg y
    );
    
    reg [2:0] current_state , next_state;
    localparam s0 = 3'b000;
    localparam s1 = 3'b001;
    localparam s2 = 3'b010;
    localparam s3 = 3'b011;
    localparam s4 = 3'b100;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
        current_state =s0;
        else
        current_state = next_state;
    end
    
    always @(*)
    begin
        next_state = current_state;
        case(current_state)
            s0:
                begin
                    y <= 0;
                    if(x)
                        next_state = s1;
                    else
                        next_state = s0;
                end
            s1: 
                begin
                y <= 0;
                    if(x)
                    
                        next_state = s2;
                    else
                        next_state = s0;
                end
            s2: 
                begin
                y <= 0;
                    if(x)
                        next_state = s2;
                    else
                        next_state = s3;
                end
            s3:     
                begin
                y <= 0;
                    if(x)
                    begin
                        next_state = s4;
                        y <= 1 ;
                    end
                    else
                        next_state = s0;
                 end
            s4:     
                 begin
                 y <= 1;
                     if(x)
                         next_state = s2;
                     else
                         next_state = s0;
                  end
             default: next_state = current_state;
        endcase
    end
    
endmodule
