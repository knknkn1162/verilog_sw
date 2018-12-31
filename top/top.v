`include "enable_gen.v"
`include "switch.v"

module top (
  input wire clk, i_sclr,
  output wire o_led
);

  wire w_en;

  parameter CYCLE_BIT_SIZE = 7
  enable_gen #(CYCLE_BIT_SIZE) enable_gen0(
    .clk(clk),
    .i_sclr(i_sclr),
    .o_en(w_en)
  );

  switch switch0(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(w_en),
    .o_sw(o_led)
  );
endmodule
