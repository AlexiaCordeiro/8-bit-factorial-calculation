module Mux4(Controlador,Entrada1, Entrada2,Entrada3,Entrada4, Saida);

input [1:0] Controlador; 
input Entrada1, Entrada2, Entrada3, Entrada4;
output reg Saida;

always @(Controlador, Entrada1, Entrada2, Entrada3, Entrada4) begin //reevaluate if these change
 case (Controlador)
 0: Saida <= Entrada1;
 1: Saida <= Entrada2;
 2: Saida <= Entrada3;  
 3: Saida <= Entrada4; 
 default: Saida <= 0;
 endcase
 end
endmodule



