module top_module(
  input too_cold,
  input too_hold,
  input mode,
  input fan_on,
  output heater,
  output aircon,
  output fan
);

  // mode = 1 ;  heating.
  // mode = 0 ; cooling.
  // in heating mode, the heater(output) is ON(1), aircon is OFF(0).
  // in cooling mode, the aircon(output) is ON(1), heater is OFF(0).
  // in either cooling OR heating mode, the fan(output) is ON(1).
  // the user can also request the fan to turn on fan_on = 1, even if the heater
  // and aircon are OFF(0)
  
  assign heater = mode & too_cold;
  assign aircon = ~mode & too_hot;
  assign fan = heater | aircon | fan_on;
  
endmodule
