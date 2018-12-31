`include "flopr_en.v"

module counter_en #(
  parameter WIDTH = 4,
  parameter [WIDTH-1:0] ULIMIT = {WIDTH{1'b1}}
) (
  input wire clk, i_sclr, i_en,
  output wire [WIDTH-1:0] o_cnt
);

  wire [WIDTH-1:0] w_cnt_0, w_cnt_1;
  flopr_en #(WIDTH) flopr_en0(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(i_en),
    .i_a(w_cnt_0),
    .o_y(w_cnt_1)
  );

  assign w_cnt_0 = (w_cnt_1 == ULIMIT) ? 0 : w_cnt_1 + 1;
  assign o_cnt = w_cnt_1;
endmodule
