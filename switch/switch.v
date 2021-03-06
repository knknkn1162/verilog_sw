`include "btn_in.v"
`include "toggle.v"

module switch (
  input wire clk, i_sclr,
  input wire i_btn,
  output wire o_ledr
);
  parameter BIT_SIZE = 20;
  wire w_en;

  btn_in #(BIT_SIZE) btn_in0(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_bin(i_btn),
    .o_bout(w_en)
  );

  toggle toggle0(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(w_en),
    .o_sw(o_ledr)
  );
endmodule
