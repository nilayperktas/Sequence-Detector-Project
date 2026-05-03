`timescale 1ns / 1ps

module tb_sequence_detector();

    // Test signals
    reg clk;
    reg reset;
    reg data_in;
    wire detected_moore, detected_mealy;

    // Instantiate the design (Connect the test signals to the module)
    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected_moore(detected_moore),
        .detected_mealy(detected_mealy)
    );

    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;      // Start with reset active
        data_in = 0;

        #15 reset = 1;  // Deactivate reset after 15ns

        // Sending test sequence: 1 -> 0 -> 1 -> 1
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1; // Sequence complete
        #10 $display("Moore: %b  Mealy: %b (both should be 1)", detected_moore, detected_mealy);

        // Add some random bits and repeat
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1; // Second sequence complete
        #10 $display("Moore: %b  Mealy: %b", detected_moore, detected_mealy);

        #20 $finish;
    end


    // Create waveform file for GTKWave
    initial begin
        $dumpfile("test_results.vcd");
        $dumpvars(0, tb_sequence_detector);
    end

endmodule
