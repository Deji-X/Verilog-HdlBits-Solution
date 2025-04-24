module top_module(
  input d,
  input ena,
  output q
);

  wire df;
  
  assign df = ~ena;
  
  always @ (posedge ena) begin
    q <= df;
  end

endmodule
