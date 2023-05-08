`timescale 1 ns / 100 ps

module testbench(); /* No inputs, no outputs */

reg clk = 1'b0; /* Represents clock, initial value is 0 */
reg reset = 1'b0;
reg up_down = 1'b0;
reg load = 1'b0;
reg [7:0] parallel_load_data = 8'b0;
wire [7:0] count;

always begin
    #5 clk = ~clk; /* Toggle clock every 5ns */
end

counter counter(.clk(clk), .reset(reset), .up_down(up_down), .load(load), .parallel_load_data(parallel_load_data), .count(count));

initial begin
    $dumpvars; /* Open for dump of signals*/
    $display("Modules loaded, simulation started!");
    reset = 1;
    #200 reset = 0; //counting started with the next clk after this (increasing)
    #500;
    up_down = 1; //reverse (decreasing)
    #500;
    up_down = 0; //reverse again (increasing)
    #500
    parallel_load_data = 8'h01;
    load = 1;
    #500; //keeping of '00000001' 500ns
    load = 0;
    #500 //increasing of '00000001'
    $finish; 
end

endmodule