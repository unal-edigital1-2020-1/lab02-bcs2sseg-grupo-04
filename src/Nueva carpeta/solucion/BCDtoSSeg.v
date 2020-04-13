module BCDtoSSeg (BCD, SSeg, an); //Se crea el display de 7 segmentos y se declaran las variables de entrada y salida

  input [3:0] BCD;
  output reg [0:6] SSeg;
  output [3:0] an;
	//Se define cada variable, si es de salida o entrada y el tamaño que va a tener
	//BCD es el número que se va a mostrar en el display
	//SSeg es para prender o apagar los LEDs del display
	//an es el display a prender
assign an=4'b1110;
	//Se le asigna un valor a an, en este caso para prender el primer display

always @ ( * ) begin //siempre que haya un cambio ejecuta esta función
	case (BCD) // para cada caso de BCD se le da un valor al SSeg para mostrar en el display
   4'b0000: SSeg = 7'b0000001; // "0"  
	4'b0001: SSeg = 7'b1001111; // "1" 
	4'b0010: SSeg = 7'b0010010; // "2" 
	4'b0011: SSeg = 7'b0000110; // "3" 
	4'b0100: SSeg = 7'b1001100; // "4" 
	4'b0101: SSeg = 7'b0100100; // "5" 
	4'b0110: SSeg = 7'b0100000; // "6" 
	4'b0111: SSeg = 7'b0001111; // "7" 
	4'b1000: SSeg = 7'b0000000; // "8"  
	4'b1001: SSeg = 7'b0000100; // "9" 
   4'ha: SSeg = 7'b0001000;  
   4'hb: SSeg = 7'b1100000;
   4'hc: SSeg = 7'b0110001;
   4'hd: SSeg = 7'b1000010;
   4'he: SSeg = 7'b0110000;
   4'hf: SSeg = 7'b0111000;
    default:
    SSeg = 0;
  endcase
end

endmodule
