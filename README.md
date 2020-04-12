# lab02- BCD2SSEG
laboratorio 01 simulación

* Fabián Steven Galindo Peña
* Juan Sebastián Gil Roa
* Juan Camilo Rojas Dávila

### Introducción

En este documento se muestra el paso a paso de la realización de un sumador de 4 bits a partir de un de 1 bit utilizando herramientas de programación y de diseño de hardware. Se trabajó la implementación de compuertas lógicas para crear el sumador. Posteriormente se simularon los códigos usados en el programa.

##### Objetivos

  * Realizar un sumador de 4 bits, a partir de uno de 1 bit.
  * Afianzar conceptos de lógica combinacional y algebra booleana.
  * Aprender a hacer simulaciones.


### Primera parte: comprender el sumador de 1 bit

Un sumador de un bit consiste en 3 entradas (A, B, Ci) y dos salidas (S y Cout). A y B son las entradas del número inicial y Ci es la entrada del segundo dígito en caso de que se haya hecho una suma antes. S es el primer dígito del resultado de la suma y Cout el segundo dígito que pasaría a un siguiente sumador en caso de que el número a sumar tenga varios bits. La tabla de verdad para el sumador sería:

![tabla de verdad](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-04/blob/master/tverdad.png)

Se entregaron unos códigos de sumadores de 1 bit para comprenderlos y compararlos. 

![Fig.1 comentarios en código sum1bcc_primitive.v](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-04/blob/master/Captura%20de%20Pantalla%202020-03-23%20a%20la(s)%2016.08.56.png)

Este código se fórmula a partir de un diseño previo de hardware entendiendo cuáles compuertas lógicas usar y cómo usarlas, por eso se manejan funciones and, xor y or dentro del código.

![Fig.2 comentarios en código sum1bcc.v](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-04/blob/master/Captura%20de%20Pantalla%202020-03-23%20a%20la(s)%2016.09.25.png)

En este código sólo se le pide al programa que haga la suma y que muestre los dos dígitos. Se obtiene el mismo resultado que en el anterior con menos pasos y variables.

### Segunda parte: Análisis de las simulaciones

Se llevó el código al programa Vivado para poder hacer simulaciones de este usando los distintos casos de prueba. Los resultados fueron los siguientes:

![simulación 1 bit](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-04/blob/master/1bit.jpeg)

### Tercera parte: Creación del sumador de 4 bits

Para hacer el sumador de 4 bits era necesario usar uno de los códigos hechos para después instanciarlo 4 veces y sumar los 4 bits. Teniendo en cuenta que las salidas Cout influencian al sumador siguiente y así. La siguiente imagen muestra la forma en la que debería trabajar. 

![Diagrama sum4bcc](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-04/blob/master/Captura%20de%20Pantalla%202020-03-23%20a%20la(s)%2017.23.47.png)

### Cuarta parte: Simulación del sumador de 4 bits

Para verificar que el código quedara bien se realizó la simulació del sumador hecho. Se hizo un archivo que genere los casos de prueba para el sumador y así poder hacer la simulación. Los resultados se muestran a continuación e indican que todo se hizo correctamente.

![simulación 4 bit](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-04/blob/master/4bit.jpeg)

### Conclusiones

 * Vivado es una gran herramienta para simular los diseños de hardware que necesiten. 
 * Es más fácil y eficaz realizar el sumador de 4 bits uniendo 4 de 1 bits, que realizar uno de 4 bits directamente.
 * Se aprendió a usar la herramienta para realizar las simulaciones y comprobar que el diseño sea el correcto.
