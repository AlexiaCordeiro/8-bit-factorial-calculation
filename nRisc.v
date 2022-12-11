//include "memoriadeinstrucao.v"

module nRisc(instrucao,CLK,RESET);


reg [7:0] PC;
 wire [7:0] PCRESULT; 
 
 input [7:0] instrucao; 
 input CLK;
 input RESET;
 
	 reg writeEnable;
    reg [2:0] Controle;
    reg [1:0] Read1;
    reg [1:0] Read2;
	 reg [2:0] Read3;
    reg [1:0] RegEsc;
	 reg [7:0] EntMuxRes1;
	 reg [7:0] EntMuxRes2;
	 
    wire [2:0] EntradaExt;
	 wire [7:0] SaidaExt;
    wire [7:0] muxPCOut;
	 wire [7:0] muxResultOut;
    wire [7:0] ALUOut;
	 wire ZeroWire;
	 wire EscMEM;
	 wire LerMEM;
	 wire RegFonte;
	 wire [7:0] DadoLido;
	 wire gz;
	 wire EscReg;
	 wire EscPC;
	 wire [1:0]ULAOp;
    wire [7:0] Dado1;
    wire [7:0] Dado2;
	 
	 //always@(RESET)
    //reseting the pc if reset is on
    //begin
     //if(RESET ==1)  PC =-4;
	 	
    always@(posedge CLK)
    begin
       #1
       PC = PCRESULT;
    end
	 
soma somador(PC,PCRESULT);
registerfile Reg(Read1,Read2,RegEsc, muxResultOut,EscReg,CLK,Dado1,Dado2);
ControlUnit  UC(Controle,reset,ULAOp,gz,EscPC,EscMEM,RegFonte,LerMEM,EscReg);
extensorSinal ext(EntradaExt, SaidaExt);

 always@(instrucao)
 begin
 
		Controle = instrucao[7:5];
      RegEsc = instrucao[4:3];
      Read1  = instrucao[4:3];
      Read2 = instrucao[2:1];	
		Read3 = instrucao[2:0];
		
 end
 
 deslocaSinal ds(SaidaExt,SaidaExt);
 
 Mux muxPC ((gz & EntMuxRes1),SaidaExt, 8'b00000000 , muxPCOut);
 
 soma2 somadorGZ(PC,muxPCOut,PCRESULT);
 
 Ula ula(ULAOp, Dado1, Dado2, ALUOut,ZeroWire);
 
    always@(ALUOut)
 begin
    EntMuxRes1 = ALUOut;
 end

 
memoriadedados memo(Dado1,Read3,EscMEM,LerMem,DadoLido,CLK); 

 always@(DadoLido)
 begin
    EntMuxRes2 = DadoLido;  
 end
 
 Mux muxResult (RegFonte,EntMuxRes1, EntMuxRes2, muxResultOut);

endmodule