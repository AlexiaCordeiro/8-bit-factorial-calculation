module Ula(ALUop, A, B, ALUOut, Zero);
 input [1:0] ALUop;
 input [7:0] A,B; 
 output reg [7:0] ALUOut;
 output reg Zero;
 
 
 initial 
 begin
 Zero = 0;
 end
 
 always @(ALUop, A, B) begin //reevaluate if these change
 case (ALUop)
 0: ALUOut <= A + 1;
 1: ALUOut <= A - 1;
 2: ALUOut <= A * B;  
 3: Zero <= A < 0 ? 1 : 0; 
 default: ALUOut <= 0;
 endcase
 end
endmodule