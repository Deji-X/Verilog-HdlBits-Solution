//Tb/tff

module top_module();
  reg clk, reset, t;
  wire q;

  tff inst(clk, reset, t, q);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    t = 1; reset = 1;
    #10 reset = 0;
  end
  

endmodule
