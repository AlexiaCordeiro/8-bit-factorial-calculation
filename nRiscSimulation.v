module nRiscSimulation;

reg CLK;
reg [7:0]binarios [32:0]; 
reg regZero;
integer counter;
wire ZeroWire;
  
 initial begin
 CLK = 0;
 regZero = 0;
binarios[0] = 8'b00000001;//add
binarios[1] = 8'b00001001;//add
binarios[2] = 8'b00001001;//add
binarios[3] = 8'b00001001;//add
binarios[4] = 8'b10100000;//save
binarios[5] = 8'b10101001;//save
//repete
binarios[6] = 8'b10010000;//load
binarios[7] = 8'b10011001;//load
binarios[8] = 8'b01010110;//mule
binarios[9] = 8'b00111001;//sub      
binarios[10] = 8'b10110000;//save
binarios[11] = 8'b10111001;//save
binarios[12] = 8'b01111100;//gz

binarios[13] = 8'b10010000;//load
binarios[14] = 8'b10011001;//load
binarios[15] = 8'b01010110;//mule
binarios[16] = 8'b00111001;//sub      
binarios[17] = 8'b10110000;//save
binarios[18] = 8'b10111001;//save
binarios[19] = 8'b01111100;//gz

binarios[20] = 8'b10010000;//load
binarios[21] = 8'b10011001;//load
binarios[22] = 8'b01010110;//mule
binarios[23] = 8'b00111001;//sub      
binarios[24] = 8'b10110000;//save
binarios[25] = 8'b10111001;//save
binarios[26] = 8'b01111100;//gz
        end
 
 initial
  begin
    counter = 0;
    forever
    begin       
       #1;	
       CLK = ~CLK;  
		 //if(regZero == 0)
			//counter = 6;
		// if(regZero == 1)
			//$finish;
    end
  end 
  
  always@(posedge (CLK == 0))
begin
  counter = counter + 1;
end



nRisc nrisc(binarios[counter],CLK,RESET);


endmodule