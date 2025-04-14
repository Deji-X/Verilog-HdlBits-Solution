module top_module(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] sum
);
    wire [15:0] cout1;
    wire [15:0] cout2;
    wire [15:0] sum2;
    wire [15:0] sum3;
    
    add16 add_1(a[15:0], b[15:0], 0, sum[15:0], cout1);
    add16 add_2(a[31:16], b[31:16], 0, sum2, cout2);
    add16 add_3(a[31:16], b[31:16], 1, sum3, cout2);
    
    always @ (cout1, sum2, sum3) begin
        case(cout1)
            0 : sum[31:16] = sum2 ;
            1 : sum[31:16] = sum3 ;
        endcase
  end

endmodule
