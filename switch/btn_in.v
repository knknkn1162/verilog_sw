`ifndef _btn_in
`define _btn_in

`include "enable_gen.v"
`include "bflopr.v"

module btn_in #(
  parameter BIT_SIZE = 20
) (
  input wire clk, i_sclr,
  input wire i_bin,
  output wire o_bout
);

  wire w_en;
  wire w_bin1, w_bin2;
  wire w_bout;

  enable_gen #(BIT_SIZE) enable_gen0(
    .clk(clk),
    .i_sclr(i_sclr),
    .o_en(w_en)
  );

  bflopr bflopr0(
    .clk(w_en),
    .i_sclr(i_sclr),
    .i_a(i_bin),
    .o_y(w_bin1)
  );

  bflopr bflopr1(
    .clk(w_en),
    .i_sclr(i_sclr),
    .i_a(w_bin1),
    .o_y(w_bin2)
  );

  assign w_bout = ~w_bin1 & w_bin2 & w_en;

  bflopr bflopr2(
    .clk(w_en),
    .i_sclr(i_sclr),
    .i_a(w_bout),
    .o_y(o_bout)
  );
endmodule

`endif
