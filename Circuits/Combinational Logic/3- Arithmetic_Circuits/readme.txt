Solution on arithmetic circuits....
Concatenation of Adder circuits, a brief note and lesson on it.
The formula of the fullAdder is;
sum = (a^b^cin);
cout = (a&b) | (a&cin) | (b&cin);

With Concatenation it becomes;
{sum,cout} = (a+b+cin);
Concatenation operator combines multiple signals into a single bus (a multi-bit value).
The bits are ordered from LEFT TO RIGHT in the curly braces, with leftmost beign the MSB and the rightmost
being teh LSB.

How it works {cout,sum} = a+b+cin;
Performs a 3- input addition (a+b+cin)
Since a, b and cin are 1-bit signals, the result can be:
0 (00 in binary)
1 (01 in binary)
2 (10 in binary)
3 (11 in binary), but this is impossible because a+b+cin maxes out at 1+1+1=3 (binary 11)
Which fits in 2-bits.

SPLITS THE RESULT INTO cout MSB AND sum LSB...
The 2-bit result is concatenated as {cout, sum}:
If a + b + cin = 0 -----> {0,0} (cout=0, sum=0)
If a + b + cin = 1 -----> {0,1} (cout=0, sum=1)
If a + b + cin = 2 -----> {1,0} (cout=1, sum=0)
If a + b + cin = 3 -----> {1,1} (cout=1, sum=1)
