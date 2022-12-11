module registerfile (Read1,Read2,RegEsc,DadoEscr,EscReg,clock,Data1,Data2);
 
 input [1:0] Read1,Read2; // registradores para ler
 input [1:0] RegEsc; // o reg que deve ser escrito os dados retornados
 input [7:0] DadoEscr;// o valor que deve ser escrito no registrador
 input EscReg, // se deve ser escrito no reg ou nao
       clock; // clock
 output [7:0] Data1, Data2; // valores que saem dos registradores
 reg [7:0] t0, t1, s0, s1; // 4 registradores de 8 bits
 
 initial begin
		t0 <= 8'b00000000;
		t1 <= 8'b00000000;
		s0 <= 8'b00000000;
		s1 <= 8'b00000000;
	end
   assign Data1 = Read1 == 2'b00 ? t0 :
						Read1 == 2'b01 ? t1 :
						Read1 == 2'b10 ? s0 :
						Read1 == 2'b11 ? s1 : 0;
						
   assign Data2 = Read2 == 2'b00 ? t0 :
						Read2 == 2'b01 ? t1 :
						Read2 == 2'b10 ? s0 :
						Read2 == 2'b11 ? s1 : 0;

   always @(posedge clock) begin
      if (EscReg) 
    case (RegEsc) 
      2'b00: begin
         t0 <= DadoEscr;
      end
      2'b01: begin
         t1 <= DadoEscr;
      end
      2'b10: begin
         s0 <= DadoEscr;
      end
      2'b11: begin
         s1 <= DadoEscr;
      end
    endcase 
   end 
endmodule