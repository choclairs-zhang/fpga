`timescale 1ns / 1ps


module led_test (               
                  clk,                 // inputs clock
                  rst_n,
                  led                  // output led
             );
             
//===========================================================================
// PORT declarations
//===========================================================================
input clk;
input rst_n;
output [3:0] led;

reg [31:0] timer;
reg [3:0] led;


  always @(posedge clk or negedge rst_n)
    begin
      if (~rst_n)
          timer <= 0;
      else if (timer == 100000000)         //计数器
          timer <= 0;
      else
          timer <= timer + 1;          
    end


  always @(posedge clk or negedge rst_n)
    begin
      if (~rst_n)
          led <= 4'b1111;
      else if (timer == 25000000)      //计数25000000, led2灭
          led <= 4'b1101;
      else if (timer == 50000000)      //计数50000000, led3灭
          led <= 4'b1011;
      else if (timer == 75000000)      //计数75000000, led4灭
          led <= 4'b0111;                              
      else if (timer == 100000000)     //计数100000000, led1灭
          led <= 4'b1110;          
    end
    
endmodule

