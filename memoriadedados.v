module memoriadedados (DadoEscr,Endereco,EscMem,LerMem,DadoLido,clock);
 
 input [7:0] DadoEscr; // dado que sera escrito na memoria
 input [2:0]Endereco; // endereço na memoria
 input EscMem; // se deve escrever na memoria ou nao
 input LerMem;//  se deve ler da memoria ou nao
 output [7:0] DadoLido; // dado lido da memoria
 input  clock; // clock
 reg [7:0] MEM1, MEM2, MEM3, MEM4; // 4 endereços de memoria de 8 bits

 
  initial begin
		MEM1 <= 8'b00000000;
		MEM2 <= 8'b00000000;
		MEM3 <= 8'b00000000;
		MEM4 <= 8'b00000000;
	end
 
 assign DadoLido = Endereco == 2'b00 ? MEM1 :
						Endereco == 2'b01 ? MEM2 :
						Endereco == 2'b10 ? MEM3 :
						Endereco == 2'b11 ? MEM4 : 0;
									

   always @(posedge clock) begin
      if (EscMem) 
    case (Endereco)
      2'b00: begin
         MEM1 <= DadoEscr;
      end
      2'b01: begin
         MEM2 <= DadoEscr;
      end
      2'b10: begin
         MEM3 <= DadoEscr;
      end
      2'b11: begin
         MEM4 <= DadoEscr;
      end
    endcase 
   end 
	
endmodule