`include "testbench.v"
`include "bflopr.v"

module bflopr_tb;
  reg clk, i_sclr, i_a;
  wire o_y;

  parameter CLK_PERIOD = 10;
  bflopr uut(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_a(i_a),
    .o_y(o_y)
  );

  `dump_block
  `conf_clk_block(clk, CLK_PERIOD)

  initial begin
    #(CLK_PERIOD)
      i_sclr = 1'b1;
    @(posedge clk) #1
      i_sclr = 1'b0;
      `assert_eq(o_y, 1'b0);
      i_a = 1'b1;
    @(posedge clk) #1
      `assert_eq(o_y, 1'b1);

    `end_tb
  end

endmodule
