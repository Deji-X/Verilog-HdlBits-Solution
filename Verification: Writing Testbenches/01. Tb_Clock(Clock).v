module top_module();
  reg clk

  dul inst(clk);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


endmodule
