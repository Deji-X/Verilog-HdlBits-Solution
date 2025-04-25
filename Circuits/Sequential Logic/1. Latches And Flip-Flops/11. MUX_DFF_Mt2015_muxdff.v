module top_module(
  input clk,
  input L,
  input r_in,
  input q_in,
  output req Q
); 
  /*
  always @(posedge clk)
        Q<=L ? r_in : q_in;
  
  always @ (posedge clk) begin
        case (L)
            1'b0 : Q <= q_in;
            1'b1 : Q <= r_in;
        endcase    
    end 
  */

  wire Q0, Q1, Q2;
  wire r0, r1, r2;
  wire D0, D1, D2;
  wire MUX1;

  assign MUX1 = (Q1 ^ Q2);

  assign D0 = (L==0) ? Q2:r0;
  assign D1 = (L==0) ? Q0:r1;
  assign D2 = (L==0) ? MUX1:r2;
  
  my_dff d0 ( clk, D0, Q0 );
  my_dff d1 ( clk, D1, Q1 );
  my_dff d2 ( clk, D2, Q2 );

  always @ (posedge clk) begin
    case (L)
            1'b0 : Q <= q_in;
            1'b1 : Q <= r_in;
        endcase    
    end 
  
endmodule
