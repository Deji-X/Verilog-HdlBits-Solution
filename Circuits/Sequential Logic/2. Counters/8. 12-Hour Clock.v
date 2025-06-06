// Count Clock
/*
Create a set of counters suitable for use as a 12-hour clock (with am/pm indicator).
Your counters are clocked by a fast-running clk,
with a pulse on ena whenever your clock should increment (i.e., once per second).

reset resets the clock to 12:00 AM. pm is 0 for AM and 1 for PM.
hh, mm, and ss are two BCD (Binary-Coded Decimal) digits each for hours (01-12),
minutes (00-59), and seconds (00-59).
Reset has higher priority than enable, and can occur even when not enabled.

The following timing diagram shows the rollover behaviour from 11:59:59 AM to 12:00:00 PM
and the synchronous reset and enable behaviour.
*/

module top_module(
  input clk,
  input reset,
  input ena,
  output pm,
  output [7:0] hh,
  output [7:0] mm,
  output [7:0] ss,
);


endmodule
