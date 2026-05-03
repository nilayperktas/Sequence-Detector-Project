// 1011 Sequence Detector - Moore FSM
module sequence_detector (
    input clk,            
    input reset,          // Resets when 0
    input data_in,        // input bit 1 or 0
    output reg detected_moore,   // high (1) when sequence 1011 is found
    output wire detected_mealy
    // reg because it will store the value
);

    parameter S_IDLE  = 3'b000, // Initial state (the area that circuit is waiting)
              S_1     = 3'b001, // Sequence 1 
              S_10    = 3'b010, // 10 
              S_101   = 3'b011, // 101
              S_1011  = 3'b100; // 1011

    reg [2:0] current_state, next_state; //3 bit


    always @(posedge clk or negedge reset) begin //sequential logic with clk 
    //Using a non-blocking block allows multiple printers to process jobs simultaneously.
        if (!reset) // if reset result is !0 result is true (reverse logic)
            current_state <= S_IDLE;
        else
            current_state <= next_state;
    end
 
    // Decides where to go based on the current state and input bit
    always @(*) begin //combinational logic
        case (current_state)
            S_IDLE:  next_state = (data_in) ? S_1    : S_IDLE; // if state is 1 go to S_1
            //if state is 0 stay in idle
            S_1:     next_state = (data_in) ? S_1    : S_10;
            S_10:    next_state = (data_in) ? S_101  : S_IDLE;
            S_101:   next_state = (data_in) ? S_1011 : S_10;
            S_1011:  next_state = (data_in) ? S_1    : S_10; // Overlap support
            default: next_state = S_IDLE;
        endcase
    end

    // In Moore, output only depends on the current state
//Moore output
always @(*) begin
    detected_moore = (current_state == S_1011) ? 1 : 0;
end
// BLOK 4 - Mealy çıkışı
assign detected_mealy = (current_state == S_101 && data_in == 1) ? 1'b1 : 1'b0;

endmodule