module counter (
    input clk,                            //clock input
    input reset,                          //async reset input
    input up_down,                        //up/down control input
    input load,                           //parallel load control input
    input [7:0] parallel_load_data,       //parallel load data input
    output reg [7:0] count                //counter output
);

reg [7:0] count_up_down; 

always @(posedge clk or posedge reset)     //front
begin
    if (reset)
        count_up_down <= 8'h00;           //00000000
    else if (load)
        count_up_down <= parallel_load_data;
    else if (~up_down)                       //if up-down is '0' - increase, '1' - decrease
        count_up_down <= count_up_down + 8'h01;
    else
        count_up_down <= count_up_down - 8'h01;
end

always @(posedge clk)
begin
    count <= count_up_down;
end

endmodule
