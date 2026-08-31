module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
            pm <= 1'b0;
        end
        else if (ena) begin

            // Seconds
            if (ss == 8'h59) begin
                ss <= 8'h00;

                // Minutes
                if (mm == 8'h59) begin
                    mm <= 8'h00;

                    // Hours
                    if (hh == 8'h11) begin
                        hh <= 8'h12;
                        pm <= ~pm;
                    end
                    else if (hh == 8'h12) begin
                        hh <= 8'h01;
                    end
                    else if (hh[3:0] == 4'h9) begin
                        hh <= {hh[7:4] + 4'h1, 4'h0};
                    end
                    else begin
                        hh <= {hh[7:4], hh[3:0] + 4'h1};
                    end

                end
                else if (mm[3:0] == 4'h9) begin
                    mm <= {mm[7:4] + 4'h1, 4'h0};
                end
                else begin
                    mm <= {mm[7:4], mm[3:0] + 4'h1};
                end

            end
            else if (ss[3:0] == 4'h9) begin
                ss <= {ss[7:4] + 4'h1, 4'h0};
            end
            else begin
                ss <= {ss[7:4], ss[3:0] + 4'h1};
            end
        end
    end

endmodule
