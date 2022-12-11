module soma2(Entrada,Entrada2,Saida);
 input [7:0] Entrada;
 input [7:0] Entrada2;
 output reg[7:0] Saida;
 always@(Entrada)
 begin
  Saida = Entrada + Entrada2;
 end
endmodule