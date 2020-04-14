# lab02 - BCDtoSSEG
laboratorio 02

* Fabián Steven Galindo Peña
* Juan Sebastián Gil Roa
* Juan Camilo Rojas Dávila

### Introducción

Para este laboratorio se nos pidió realizar un proyecto en verilog para poder programar una FPGA y que esta sea capaz de mostrar en formato hexadecimal los dígitos que se requieran. Como condición teníamos que usar 4 displays de 7 segmentos distintos y que se activara de a uno por vez. Para lograr esto fue necesaria la realización de un divisor de frecuencia para que el cambio de display fuera visible, un testbench para hacer las pruebas, el código donde se instancia el objeto creado por el profesor y que además indica el display a usar, y por último modificar un poco el código entregado de BCDtoSSeg.

##### Objetivos

  * Hacer un programa que le indique a una FPGA qué display de 7 segmentos usar y qué dígito del sistema hexadecimal mostrar.
  * Comprender los códigos de ejemplo.
  * Hacer simulaciones para visulizar los resultados obtenidos y comprender lo que hacen los códigos.


### Primera parte: comprender el código BCDtoSSeg.v, simulación y análisis

Se nos entregó un código el cual explicamos con comentarios como se puede ver a continuación:
```
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
```
La idea del código es mostrar un dígito del sistema hexadecimal en un display de 7 segmentos. La siguiente imagen muestra la simulación realizada con el código BCDtoSSeg.v dado por el profesor.

![simulación](https://github.com/unal-edigital1-2020-1/lab02-bcs2sseg-grupo-04/blob/master/src/Soluciones_Grupo4/recursos/WhatsApp%20Image%202020-04-13%20at%203.40.29%20PM.jpeg)

En la simulación se ve que como input para la prueba se usaron números del 1 al 9 (en la simulación se muestra en binario). Después de eso se ve cómo el programa tiene una salida de 7 bits para poder prender y apagar los distintos LEDs que tiene el display de 7 segmentos. Por la configuración de la FPGA cuando el display recibe un 1 es para mantenerse apagado, y cuando recibe un 0 es para prenderse. La salida se da como se esperaba y además en la simulación se ve la salida de 7 bits en formato hexadecimal.

### Segunda parte: Escribir el código para la visualización dinámica 4 display, simulación y análisis

Se nos pidió hacer nuestra propia implementación para la visualización dinámica en 4 displays. Como condición por las características da la FPGA para determinar qué display se debía encender, en el código se usaba por ejemplo `<1101>` para prender el segundo display, pues los 1s apagan y los 0s encienden por el sistema de ánodos de la FPGA. De la misma forma los segmentos de los displays se prenden con 0s y no con 1s. Los códigos realizados se pueden observar en la carpeta de "Soluciones_Grupo4."

Para poder visualizar los resultados en una FPGA real es necesaria la elaboración de un divisor de frecuancia. Para esto es necesario conocer el tiempo al que trabaja la FPGA (reloj interno del sistema) que en este caso es de 100MHz. El divisor de frecuencia lo que hace es un conteo con cada ciclo del reloj interno de la FPGA y al llegar a un número determinado con el contador se cambia la señal de salida. Esta señal de salida tendrá una frecuencia mucho más baja para así hacer posible la visualización de los resultados obtenidos. Esta frecuencia se usa para ir cambiando de display.

Al simular los códigos se tuvo la siguiente gráfica:

![simulación 4display](https://github.com/unal-edigital1-2020-1/lab02-bcs2sseg-grupo-04/blob/master/src/Soluciones_Grupo4/recursos/WhatsApp%20Image%202020-04-14%20at%204.25.01%20PM.jpeg)

En la simulación se puede observar que el número de entrada es 4321, que el botón de reset está desactivado y cómo cada vez que cambia la variable 'an' se ve que cambia el dígito a mostrar en el display selecionado. Además, se puede ver que la parte que convierte el número de BCD a la señal para el display de 7 segmentos funciona de manera adecuada. Por esto podemos decir que el código se hizo correctamente.

### Tercera parte: Cambio de visualización: de hexadecimal a decimal



### Conclusiones

* Se logró la realización y comprensión de un código para seleccionar el display de 7 segmentos de la FPGA a utilizar y para visualizar un dígito en formato hexadecimal.
* Las simulaciones de todos los códigos fueron exitosas, y con estas se comprendió mejor el funcionamiento de los códigos.
