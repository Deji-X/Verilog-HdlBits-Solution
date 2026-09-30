module top_module(
  input clk,
  input reset,
  input [3:1] s,
  output fr3,
  output fr2,
  output fr1,
  output dfr
);
  //Three sensors which are s[3]=s3, s[2]=s2, s[1]=s1;
  //When the water level is above the highest sensor (s[3]=s3) input flow rate is 0;
  //When the water level is below the lowest sensor (s[1]=s1) flow rate is:
  //at maximum(both nominal flow valve and supplemental flow valve opened);
  /* The flow rate when the level is between the upper and lower senseors is determined
  by two factors: water level & level previous to the last sensor change.
  s[3] = s[1] & s[2] & s[3]
  */

endmodule
