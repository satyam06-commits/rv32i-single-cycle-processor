 
`timescale 1ns/1ps

module testbench;

reg clk;
reg reset;

// Instantiate the DUT (Device Under Test)
top uut (
    .clk(clk),
    .reset(reset)
);

// Clock Generation (10 ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset and Simulation
initial begin
    reset = 1'b1;

    #20;
    reset = 1'b0;

    // Run long enough to execute all instructions
    #300;

    $stop;
end

endmodule