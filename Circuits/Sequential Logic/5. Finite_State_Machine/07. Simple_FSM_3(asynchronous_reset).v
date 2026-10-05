//Fsm3
/*This here below is my solution; the onehot code problem gave me a keen and unique
insight.
I'll post another solution below, I can think of 3 possible behaviourals offhand.
*/
module top_module(
    input  clk,
    input  in,
    input  areset,
    output out
);

    parameter A=0, B=1, C=2, D=3;

    reg [3:0] state, next_state;

    // State transition logic
    assign next_state[A] = ~in & (state[A] | state[C]);
    assign next_state[B] = in & (state[A] | state[B] | state[D]);
    assign next_state[C] = ~in & (state[B] | state[D]);
    assign next_state[D] = in & state[C];

    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= 4'b0001; //another way of saying "state<= A;"
        else
            state <= next_state;
    end

    // Output logic
    assign out = state[D];

endmodule

/* SOLUTION 2
module top_module(
    input clk,
    input in,
    input areset,
    output out);

    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10,
              D = 2'b11;

    reg [1:0] state, next_state;

    // State transition logic
    always @(*) begin
        case (state)
            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;
        endcase
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= A;
        else
            state <= next_state;
    end

    // Output logic
    assign out = (state == D);

endmodule
*/

/* SOLUTION 3 - The sites solution
module top_module (
	input clk,
	input in,
	input areset,
	output out
);

	// Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	parameter A=0, B=1, C=2, D=3;
	reg [1:0] state;		// Make sure state and next are big enough to hold the state encodings.
	reg [1:0] next;
    



    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
    always@(*) begin
		case (state)
			A: next = in ? B : A;
			B: next = in ? B : C;
			C: next = in ? D : A;
			D: next = in ? B : C;
		endcase
    end



    // Edge-triggered always block (DFFs) for state flip-flops. Asynchronous reset.
    always @(posedge clk, posedge areset) begin
		if (areset) state <= A;
        else state <= next;
	end
		

		
	// Combinational output logic. In this problem, an assign statement is the simplest.		
	assign out = (state==D);
	
endmodule
*/
