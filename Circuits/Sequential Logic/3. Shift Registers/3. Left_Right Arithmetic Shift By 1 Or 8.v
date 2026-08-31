//Shift18

module top_module(
  input clk,
  input load,
  input ena,
  input [1:0] amount,
  input [63:0] data,
  output reg [63:0] q
);

  always @(posedge clk)begin
        if(load) 
            q<=data;
        else begin
            case(ena)
                'b00: q<={q[0],q[99:1]};
                'b01: q<={q[98:0],q[99]};
                'b10: q<={q[98:0],q[99]};
                'b11: q<={q[98:0],q[99]};
                default: q<=q;
            endcase
        end
    end

  
endmodule
