module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
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
                    else begin
                        hh <= hh + 8'h01;
                    end

                end
                else begin
                    mm <= mm + 8'h01;
                end

            end
            else begin
                ss <= ss + 8'h01;
            end
        end
    end

endmodule

explain this

Yes. This is a good implementation, and the main thing to understand is that the code is implementing a hierarchical counter:

seconds → minutes → hours → AM/PM

One important correction first: because hh, mm, ss, and pm are assigned inside an always block, they should be declared as reg in Verilog. So the header should be:

output reg pm,
output reg [7:0] hh,
output reg [7:0] mm,
output reg [7:0] ss

Now let's break your code down.

1. Module declaration
module top_module(

This starts your module and names it top_module.

Think of the module as the entire digital clock circuit.

2. Inputs
input clk,
input reset,
input ena,

You have three inputs.

clk
clk = fast-running clock

This is the actual hardware clock.

For example, it might run at:

50 MHz

or

100 MHz

The clock continuously ticks.

reset
reset = 1

means:

Reset the clock back to 12:00:00 AM.

The reset is synchronous, meaning it only takes effect on a rising edge of clk.

ena

ena means:

Should the clock advance by one second right now?

The problem tells us that ena is already generated once per second.

So:

clk → runs constantly
ena → pulse once per second
3. Outputs

Your original code has:

output pm,
output [7:0] hh,
output [7:0] mm,
output [7:0] ss

These are the clock's outputs.

pm → AM/PM
hh → hours
mm → minutes
ss → seconds

Because they're assigned in an always block, use:

output reg pm,
output reg [7:0] hh,
output reg [7:0] mm,
output reg [7:0] ss
4. The clocked block
always @(posedge clk) begin

This means:

Execute this block every time clk goes from 0 → 1.

So the entire clock update happens on the rising edge.

Conceptually:

clk:

___|‾|___|‾|___|‾|___
   ↑     ↑     ↑
  execute
5. Reset has highest priority
if (reset) begin

The first thing we check is reset.

If:

reset = 1

we don't care about ena.

We immediately set:

hh <= 8'h12;
mm <= 8'h00;
ss <= 8'h00;
pm <= 1'b0;
6. Why these values?
hh <= 8'h12;

The hours become 12.

Remember that the clock uses BCD.

So:

8'h12

means:

0001 0010
  1    2

Therefore:

hh = 12
mm <= 8'h00;
ss <= 8'h00;

Minutes and seconds become zero.

So the clock is:

12:00:00
pm <= 1'b0;

The problem says:

pm = 0 → AM
pm = 1 → PM

Therefore:

pm = 0

means:

12:00 AM

So reset gives:

12:00:00 AM
7. What happens if reset isn't active?
else if (ena) begin

This means:

If we're not resetting, check whether the clock should advance.

If:

ena = 0

nothing inside this block executes.

The clock stays exactly where it is.

If:

ena = 1

we advance the clock by one second.

8. Seconds logic

Now we get to the main logic:

if (ss == 8'h59) begin

We're asking:

Are the seconds currently 59?

There are two possibilities.

Case 1: Seconds aren't 59
else begin
    ss <= ss + 8'h01;
end

For example:

12:34:27

becomes:

12:34:28

And:

12:34:58

becomes:

12:34:59

Simple.

9. What happens at 59 seconds?

If:

ss = 59

we do:

ss <= 8'h00;

So:

58 → 59 → 00

But when seconds go:

59 → 00

we need to increase the minutes.

That's why the minute logic is inside the seconds rollover condition.

This is a very important concept.

seconds reaches 59
       ↓
seconds → 00
       ↓
increment minutes
10. Minutes logic

Inside:

if (ss == 8'h59) begin

we have:

if (mm == 8'h59) begin

We're asking:

Are the minutes also 59?

If not:

else begin
    mm <= mm + 8'h01;
end

For example:

12:34:59

becomes:

12:35:00

Notice:

59 seconds → 00
34 minutes → 35
11. What happens at 59:59?

Suppose we have:

11:59:59 AM

Then:

ss == 59

and:

mm == 59

So:

ss <= 8'h00;
mm <= 8'h00;

We now need to deal with the hour.

That's why the hour logic is nested inside the minute rollover.

The hierarchy is:

if seconds = 59
    reset seconds

    if minutes = 59
        reset minutes

        update hours
12. The 11 → 12 case

This is the most important part:

if (hh == 8'h11) begin
    hh <= 8'h12;
    pm <= ~pm;
end

Suppose:

11:59:59 AM

At the next ena pulse:

hh = 12

and:

pm = ~pm

Since:

pm = 0

we get:

~0 = 1

So:

11:59:59 AM
        ↓
12:00:00 PM

Exactly what we want.

13. Why ~pm?
pm <= ~pm;

~ is the bitwise NOT operator.

Since pm is only one bit:

pm = 0

becomes:

~pm = 1

and:

pm = 1

becomes:

~pm = 0

So it simply toggles:

AM → PM
PM → AM

That's perfect for a 12-hour clock.

14. The 12 → 01 case

Next:

else if (hh == 8'h12) begin
    hh <= 8'h01;
end

Suppose:

12:59:59 PM

We don't want:

13:00:00 PM

because this is a 12-hour clock.

Instead:

12:59:59 PM
       ↓
01:00:00 PM

So:

12 → 01

But notice:

pm

doesn't change.

That's correct.

15. What about 1 through 10?

That's what this handles:

else begin
    hh <= hh + 8'h01;
end

For example:

01 → 02
02 → 03
...
09 → 10
10 → 11

So:

10:59:59 AM
        ↓
11:00:00 AM

No AM/PM change occurs.

16. Why doesn't PM change at 12 → 01?

Because the AM/PM transition occurs specifically at:

11:59:59 → 12:00:00

not:

12:59:59 → 01:00:00

Think of a normal 12-hour clock:

11:59 AM
   ↓
12:00 PM
   ↓
12:59 PM
   ↓
1:00 PM
   ↓
...
11:59 PM
   ↓
12:00 AM

So pm toggles every time:

11 → 12
17. Why the nesting is important

Your code essentially creates this logic:

                  ena
                   │
                   ▼
              seconds?
             /         \
          < 59          59
           │             │
       ss = ss+1       ss = 00
                         │
                         ▼
                    minutes?
                   /        \
                < 59         59
                 │            │
             mm = mm+1      mm = 00
                              │
                              ▼
                          hours?
                       /    |     \
                     11    12    01-10
                     │      │       │
                    12      01    hh+1
                     │
                   toggle
                     pm

That's the entire clock.

One thing to fix in your code

Your header should be:

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

because you're using traditional Verilog:

always @(posedge clk)

and assigning directly to the outputs.

If you were writing SystemVerilog, you could instead use logic:

output logic pm,
output logic [7:0] hh,
output logic [7:0] mm,
output logic [7:0] ss
The three rules to remember for this problem
Rule 1 — ena controls whether time advances
ena = 0 → nothing changes
ena = 1 → advance one second
Rule 2 — rollover happens from right to left
59 seconds
    ↓
00 seconds + increment minute

59 minutes
    ↓
00 minutes + increment hour
Rule 3 — AM/PM only changes at 11 → 12
11:59:59 AM → 12:00:00 PM
11:59:59 PM → 12:00:00 AM

That last rule is the part I'd expect an interviewer to probe you on.

Hint: Non-BCD values detected. Are you sure you're using two-digit BCD representation for hh, mm, and ss?
# Hint: Output 'pm' has 125152 mismatches. First mismatch occurred at time 434270.
# Hint: Output 'hh' has 335752 mismatches. First mismatch occurred at time 38270.
# Hint: Output 'mm' has 342052 mismatches. First mismatch occurred at time 2870.
# Hint: Output 'ss' has 312938 mismatches. First mismatch occurred at time 170.
# Hint: Total mismatched samples is 352018 out of 352413 samples

result for the code given

The problem is the addition.

Your hh, mm, and ss are two-digit BCD, but expressions like:

ss <= ss + 8'h01;

perform binary addition, not BCD addition.

For example:

BCD 09 = 0000 1001

Adding 1 happens to work:

0000 1001
+       1
----------
0000 1010

But 0000 1010 is not valid BCD. It represents decimal 10 in binary, but BCD requires:

0001 0000

That's exactly why the tester says:

Non-BCD values detected.

Fix

You need to increment the individual BCD digits.

For seconds:

if (ss[3:0] == 4'd9) begin
    ss[3:0] <= 4'd0;
    ss[7:4] <= ss[7:4] + 4'd1;
end
else begin
    ss[3:0] <= ss[3:0] + 4'd1;
end

But we can make the entire clock cleaner.

Correct version
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
The important idea

A BCD byte is actually two separate decimal digits:

        7 6 5 4 | 3 2 1 0
        tens     | ones

           5    |    9
              ↓
             59

So for 59 → 00:

ss = 0101 1001
       5    9

       ↓

ss = 0000 0000
       0    0

You cannot treat the entire 8'h59 as a normal binary number.

For example

38 → 39:

0011 1000
  3    8

        ↓

0011 1001
  3    9

But 39 → 40 needs:

0011 1001
  3    9

        ↓

0100 0000
  4    0

So the logic is:

if ones digit == 9:
    ones = 0
    tens = tens + 1
else:
    ones = ones + 1

That's the pattern you need for both ss and mm.

One more subtle issue

Your original:

hh <= hh + 8'h01;

also breaks BCD. For example:

09 + 1

produces binary 0A, which is invalid BCD.

The corrected version handles the BCD digits individually:

hh <= {hh[7:4], hh[3:0] + 4'h1};

So:

09 → 10

rather than:

09 → 0A

That's what the simulator's "Non-BCD values detected" warning is telling you.
