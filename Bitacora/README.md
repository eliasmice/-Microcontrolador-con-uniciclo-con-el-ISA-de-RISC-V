## Bitácora laboratorio 4 

### Ejercicio 1. Hello World
| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|17/05/24 | Keylor y Carlos | Inicio del diseño del programa en ensamblador |

Se realizó el diagrama de flujo que seguirá el programa en ensamblador para cargar los valores ascii de todas las letras de Hello world, se decidió reutilizar una sección de código la cual se encarga de enviar através del UART el valor correspondiente y revisar si el dato fue enviado correctamente, esto con el objetivo de minimizar el código de la mejor manera y hacerlo más eficaz.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|18/05/24 | Keylor y Carlos | Elaboración de módulos decodificadores |

Se desarrollaron los módulos decodificadores que le permiten al sistema seleccionar los valores que tendrán las señales necesarias del periférico UART para realizar la transmisión de los datos de manera correcta, esto se refiere a las señales que manejaran el registro de control y el de datos de ese bloque. También se implementó un mux que permite seleccionar, gracias a una señal proveniente de otro decodificador, el dato que le entrará al procesador dependiendo de que periférico se esté utilizando en ese momento. Los decodificadores reciben el bus de datos del mapa de memoria para así enviar las señales correspondientes dependiendo del caso que se esté trabajando.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|20/05/24 | Keylor | Modificaciones al procesador |

Se realizaron las modificaciones necesarias para que el procesador monociclo, desarrollado en el curso de teoría, sea capaz de soportar las instrucciones necesarias para el programa en ensamblador que se desarrolló para el Hello world. Las pruebas realizadas demostraron que el procesador es capaz de ejecutar las nuevas instrucciones que se requieren para poder obtener el Hello world.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|21/05/24 | Carlos | Pruebas de los IPs requeridos con el archivo coe del programa ensamblador |

Se investigó acerca de las diferentes opciones de IPs para las memorias que se utilizan en esta implementación para escoger la mejor opción, al realizar pruebas en el IP de la memoria ROM (Distribuited Memory Generator) se observó que las instrucciones en dicha memoria deben ser apuntadas de 1 en 1, no de 4 en 4 como se trabaja en el monociclo, por lo que se debió tomar en cuenta este comportamiento para realizar un truncamiento de las direcciones utilizadas en el procesador para que las instrucciones sean extraidas correctamente y evitar la pérdida de información de por medio. Estas pruebas se realizaron con el archivo .coe que se le debe precargar al bloque ROM.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|23/05/24 | Keylor y Carlos | Implementación del módulo top y primeras pruebas del sistema |

Se realizó un modulo top que une los decodificadores utilizados, la IP de la ROM, el procesador monociclo y la interfaz UART. Al realizar las primeras pruebas se observó que el sistema no transmitía ninguna letra de la frase por lo que se realizaron revisiones en todos los módulos utilizados, se descubrió que el tamaño de las direcciones estaba erróneo ya que se consideraban segmentos de 8 bits cuando en realidad eran de 4 bits, pero al corregir este error el sistema enviaba solo la H, por lo que se prosiguió con la búsqueda de más errores. Se corrigieron algunos errores de sintaxis que hacían que algunas señales estuvieran desconectadas pero el sistema seguía solo enviando la H por lo que quedó pendiente de encontrar cual es el error que se estaba presentando.}

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|24/05/24 | Keylor y Carlos | Solución de errores y finalización funcional |

Se buscaron los errores que no se pudieron corregir el dia anterior, se descubrió que las instrucciones no estaban realizando los saltos correctamente y por eso solo se estaba mostrando la H, este error se debia a una señal que estaba mal escrita y al no coincidir su nombre se estaba presentando ese problema, al realizar esta corrección el sistema funcionó correctamente y mostraba el Hello world en el Realterm, dejando el sistema listo para su revisión.

### Ejercicio 2. Microcontrolador

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|Semanas 15-16 | Elías | Aplicación de python |

Trabajó en desarrollar la aplicación de python que permite descomponer las imagenes en pixeles y las envía por comunicación serial.


| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|28/05/24 | Carlos | Modulo del filtro gaussiano |

Realiza el modulo en .sv que realiza la operación del filtro gaussiano


| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|29/05/24 | Samuel y Carlos | Diagramas y modulos para el filtro gaussiano |

Se plantea el diagrama de bloques para la interfaz del filtro gaussiano, y se realiza el diagrama de estados para la maquina que controla dicha interfaz. Se realizan los modulos para los codigos del registro de control, registro de datos y la maquina de estados.


| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|02/06/24 | Keylor y Carlos | Código Rars |

Se comenzó el código rars para implementar las subrutinas para calcular los pixeles por los métodos: software y hardware. Se envideció la necesidad de implemntar un 'bit_start' por parte de la aplicación en python, un 'end_bit' de igual forma para indicar que ya se ha transmitido toda la imagen. 
Además se repartieron las tareas restantes en los 4 integrantes del grupo. 

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|03/06/24 | Elías | 7 segments |

Trabajó en la implementación del requerimiento de mostar los ciclos que dura en calcular un pixel en el 7 segmentos, hizo el contador de ciclos e instanció los modulos necesarios, faltó hacerle pruebas a esos modulos en conjunto.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|03/06/24 | Carlos | Correcciones del bloque del filtro |

Se realizaron correcciones al bloque del filtro para que ahora si realizara la captura del dato del pixel procesado correctamente, esto se logró haciendo el cálculo de manera combinacional pero que el resultado fuera capturado justo cuando ya el filtro tenga todos los datos y una señal de inicio esté activa. Se realizaron pequeños ajustes en la interfaz para que sea una única salida dependiendo de un selector que indica si se desea ver el valor del registro de control o el de datos, para esto se añadió un mux que permita el paso de estas salidas dependiendo del caso. El bloque en general parece trabajar correctamente por lo que queda pendiente realizar las pruebas ya utilizando el procesador y el programa en ensamblador.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|04/06/24 | Elías | 7 segments |

Quedó funcionando perfectamente el modulo top del 7 segmentos, funciona de acuerdo a las especificaciones.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|04/06/24 | Elías | Código python |

Modificó un poco el código de python para que se mostrara en pantalla la matriz de pixeles que estaba siendo enviada hacia el procesador y que mostrara tambien los pixeles que se estaba recibiendo.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|04/06/24 | Samuel | Submodulos |

Añade los modulos que mapean los switches y push button en uno de los registros, esto incluye los modulos para antirebotes y sincronizador; además, se incluye el modulo que mapea uno de los registros, en los LEDS.

| Fecha       | Integrantes | Objetivos     |
|--------------|------|------------|
|04/06/24 | Todos | Unión de bloques y pruebas |

Se realizó la conexión de todos los bloques que se utilizan en el sistema, así como cargarle el programa en ensamblador a la ROM, al realizar las pruebas el sistema no realizaba el procesamiento de las imágenes, ya que la aplicación de Python mostraba que estaba recibiendo 0 como valor de pixel procesado, por lo que la imagén no se iba a procesar y solo se observaba un cuadro negro. Por más que se intentó corregir los errores presentados no se logró que el sistema final funcionara correctamente.


