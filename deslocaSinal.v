module deslocaSinal(Entrada, Saida);

input [7:0]Entrada;
output reg[7:0]Saida;


always@(Entrada)
 begin
  Saida = Entrada * 4;
 end



endmodule
