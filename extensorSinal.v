module extensorSinal(Entrada, Saida);

input [2:0] Entrada; // 16-bit input
output [7:0] Saida; // 32-bit output

assign Saida = { 4'b0000 , Entrada };

endmodule
