module ControlUnit(opcode,reset,ULAOp,gz,EscPC,EscMEM,RegFonte,LerMEM,EscReg);  
input[2:0] opcode;  
input reset; 
output reg[1:0] ULAOp;
output reg gz,EscPC,EscMEM,RegFonte,LerMEM,EscReg;  

 always @(*)  
 begin  
      if(reset == 1'b1) begin  


					EscPC = 1'b0;
					EscMEM = 1'b0;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b0;
					ULAOp = 2'b00;
					EscReg = 1'b0;

      end  
      else begin  
      case(opcode)   
      3'b000: begin // addo  
		
					EscPC = 1'b0;
					EscMEM = 1'b0;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b0;
					ULAOp = 2'b00;
					EscReg = 1'b1; 
                end  
      3'b001: begin // subo  
               
					EscPC = 1'b0;
					EscMEM = 1'b0;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b0;
					ULAOp = 2'b01;
					EscReg = 1'b1; 
                end  
      3'b010: begin // mule
               
					EscPC = 1'b0;
					EscMEM = 1'b0;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b0;
					ULAOp = 2'b10;
					EscReg = 1'b1;  
                end  
      3'b011: begin // gz
		
               EscPC = 1'b1;
					EscMEM = 1'b0;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b1;
					ULAOp = 2'b11;
					EscReg = 1'b0;
                end  
      3'b100: begin // lw  
               EscPC = 1'b0;
					EscMEM = 1'b0;
					LerMEM = 1'b1;
					RegFonte = 1'b1;
					gz = 1'b0;
					ULAOp = 2'b00;
					EscReg = 1'b1; 
                end  
      3'b101: begin // sw  
             	EscPC = 1'b0;
					EscMEM = 1'b1;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b1;
					ULAOp = 2'b00;
					EscReg = 1'b0;
                end  
 
      default: begin  
		
					EscPC = 1'b0;
					EscMEM = 1'b0;
					LerMEM = 1'b0;
					RegFonte = 1'b0;
					gz = 1'b0;
					ULAOp = 2'b00;
					EscReg = 1'b0;
		
                end  
      endcase  
      end  
 end  
 endmodule 