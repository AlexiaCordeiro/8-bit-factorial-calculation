module Mux(Controlador,Entrada1, Entrada2, Saida);

input Controlador; 
input [7:0]Entrada1; 
input [7:0]Entrada2;
output reg [7:0] Saida;

always @(Controlador, Entrada1, Entrada2) begin //reevaluate if these change
 case (Controlador)
 0: Saida <= Entrada1;
 1: Saida <= Entrada2; 
 default: Saida <= 0;
 endcase
 end
endmodule


