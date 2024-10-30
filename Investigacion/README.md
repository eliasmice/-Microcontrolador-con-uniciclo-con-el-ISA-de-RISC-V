# Investigación previa | Laboratorio 4: Microcontrolador

## 1. Investigue sobre la arquitectura RISC-V. Preste especial atención a las instrucciones que forman parte del conjunto básico de instrucciones para números enteros de 32 bits, rv32i.

La arquitectura RISC-V es un conjunto de instrucciones de propósito general (RISC) diseñado para ser simple y eficiente en términos de hardware. Se centra en operaciones básicas y simplifica el diseño del procesador al reducir la cantidad de instrucciones necesarias para realizar tareas comunes. A continuación, se detallan las instrucciones mencionadas, enfocándose en su función dentro del conjunto básico de instrucciones para números enteros de 32 bits (rv32i):

### Operaciones de carga y almacenamiento

**lw**: Carga palabra (Load Word). Lee un valor de memoria y lo coloca en un registro.

**sw**: Almacena palabra (Store Word). Escribe un valor desde un registro en una ubicación de memoria.

### Operaciones de desplazamiento

**sll, slli**: Desplaza lógicamente a la izquierda. El primer argumento es el número de posiciones a desplazar, y el segundo argumento es el valor a desplazar.

**srl, srli, sra, srai**: Desplaza lógicamente a la derecha. Similar a los desplazamientos a la izquierda, pero hacia la derecha.

### Operaciones aritméticas

**add, addi**: Suma. La primera versión suma dos registros, mientras que addi suma un registro y un inmediato (un valor constante).

**sub**: Resta. Realiza la resta entre dos registros.

### Operaciones lógicas

**xor, xori**: Exclusivo OR. Compara cada bit de dos valores; si al menos uno de los bits es diferente, el resultado es 1.

**or, ori**: OR lógico. Compara cada bit de dos valores; si alguno de los bits es 1, el resultado es 1.

**and, andi**: AND lógico. Compara cada bit de dos valores; si ambos bits son 1, el resultado es 1.

### Operaciones de control de flujo

**beq, bne, blt, bge**: Saltos condicionales. Estas instrucciones comparan dos registros o un registro con un inmediato y saltan a una dirección de memoria basada en el resultado de la comparación.

**slt, slti, sltu, sltui**: Salto si menor. Comparan dos registros o un registro con un inmediato y saltan si el primer argumento es menor que el segundo.

### Saltos y llamadas

**jal, jalr**: Jump And Link (Llamada), Jump And Link Register (Saltar y vincular registro). jal salta a una dirección de memoria y guarda la dirección de retorno actual en un registro específico. jalr realiza un salto a una dirección especificada y utiliza un registro para la dirección de retorno.

[1] A. Waterman, K. Asanovic, "The RISC-V Instruction Set Manual," Volume I: User-Level ISA, Document Version 2.2, May 7, 2017. [Online]. Available: https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf.


## 2.	Investigue sobre las diferencias entre un lenguaje de programación como C y ensamblador. Explique qué es bare-metal programming.

Las diferencias entre un lenguaje de programación como C y el ensamblador radican principalmente en varios niveles de abstracción y complejidad, así como en la relación directa con el hardware.
### Lenguaje de Programación C
**Nivel de Abstracción**: C es un lenguaje de programación de alto nivel que proporciona una capa de abstracción entre el código del usuario y el hardware. Esto significa que los desarrolladores pueden escribir programas sin tener que preocuparse demasiado por los detalles de bajo nivel del sistema, como la gestión de memoria o la manipulación directa de registros de CPU.
**Portabilidad**: Debido a su naturaleza de alto nivel, los programas escritos en C pueden ejecutarse en diferentes sistemas operativos y plataformas con poco o ningún cambio en el código fuente. Esto se debe a que C abstracta muchos detalles específicos del hardware y del sistema operativo.
**Eficiencia**: Aunque C permite una mayor portabilidad, también puede ser más eficiente que otros lenguajes de alto nivel debido a su cercana relación con el hardware. Los compiladores modernos de C optimizan el código para aprovechar al máximo las capacidades del hardware.

### Ensamblador
**Nivel de Abstracción**: El ensamblador es un lenguaje de programación de bajo nivel que se traduce directamente en instrucciones máquina. Esto significa que los desarrolladores tienen un control total sobre el hardware, lo que les permite escribir código extremadamente eficiente y optimizado para una plataforma específica.
**No Portabilidad**: Los programas escritos en ensamblador son altamente específicos de la plataforma y no pueden ejecutarse en diferentes tipos de hardware sin modificaciones significativas. Esto se debe a que el ensamblador opera directamente en el hardware y depende de las características específicas de la arquitectura de la CPU.
**Control Directo sobre el Hardware**: El uso del ensamblador permite a los desarrolladores acceder y manipular directamente los recursos del sistema, como los registros de la CPU, las memorias y los dispositivos periféricos. Esto es útil para tareas que requieren un control muy preciso sobre el hardware, como la programación de sistemas embebidos o la creación de software de tiempo real.

### Bare-Metal Programming
El bare-metal programming se refiere a la práctica de escribir software que se ejecuta directamente en el hardware sin ninguna capa de sistema operativo. Esto implica trabajar a un nivel muy bajo, similar al ensamblador, donde el programador tiene control total sobre todos los recursos del sistema. Es común en aplicaciones de sistemas embebidos, donde el rendimiento y la eficiencia son críticos, y el sistema operativo podría no estar presente o ser demasiado pesado para la aplicación.

La elección entre usar C o ensamblador depende de las necesidades específicas del proyecto. C es preferible cuando se necesita portabilidad y una capa de abstracción, mientras que el ensamblador es adecuado para situaciones que requieren un control extremadamente preciso sobre el hardware y la máxima eficiencia.


## 3.	Investigue sobre cómo se almacenan los datos en una memoria. ¿Qué es little-endian y big-endian?

El almacenamiento de datos en memoria se logra mediante el uso de la memoria interna del sistema para un acceso rápido y eficiente a los datos. Las bases de datos en memoria utilizan técnicas avanzadas para optimizar el almacenamiento y el acceso a los datos, lo que las hace ideales para aplicaciones que requieren tiempos de respuesta rápidos y el manejo de grandes volúmenes de datos

Los términos little-endian y big-endian describen el orden en el que los sistemas almacenan secuencias de bytes en la memoria. Ambos términos se refieren a dónde se almacena el primer valor en la secuencia:

### Big-endian
En este sistema, el valor más significativo en la secuencia se almacena primero, en la dirección de almacenamiento más baja. Por ejemplo, si se almacenan los dos bytes requeridos para el número hexadecimal 4F52, un sistema big-endian los almacenaría como 4F52, donde 4F se almacena en la dirección de almacenamiento 1000 y 52 en la dirección 1001. Este orden parece natural para aquellos que usan idiomas que leen de izquierda a derecha, ya que coincide con la forma en que las personas esperan ver presentados los caracteres o números.

### Little-endian
Contrariamente, en un sistema little-endian, el valor menos significativo en la secuencia se almacena primero. Siguiendo el mismo ejemplo, un sistema little-endian almacenaría los bytes como 524F, con 52 en la dirección 1000 y 4F en la dirección 1001. Este orden es dominante en las arquitecturas de procesadores como x86, la mayoría de las implementaciones de ARM y las bases de RISC-V, así como en su memoria asociada.

![image](https://github.com/EL3313/laboratorio4-equipo-4/assets/124960144/c97a5105-6c90-4a70-ac7e-f92712e9d284)


[2] Crystal Bedell, "big-endian and little-endian," TechTarget, December 2023. [Online]. Available: https://www.techtarget.com/searchnetworking/definition/big-endian-and-little-endian. 



## 4.	Explique el concepto de periféricos mapeados en memoria. ¿Cuál es el método utilizado para leer o escribir datos/instrucciones a un periférico?
El concepto de periféricos mapeados en memoria se refiere a un método de comunicación entre la CPU y los dispositivos de entrada/salida (E/S) en un sistema informático, donde los dispositivos de E/S se acceden utilizando el mismo bus de direcciones que se utiliza para acceder a la memoria. Este método es conocido como E/S mapeada en memoria.

### Método de Lectura y Escritura
Para leer o escribir datos/instrucciones a un periférico mapeado en memoria, se utilizan instrucciones de la CPU que normalmente se utilizan para acceder a la memoria. Cuando la CPU intenta acceder a una dirección de memoria que ha sido asignada a un dispositivo de E/S, el dispositivo responde a este acceso, permitiendo que los datos se transfieran entre la CPU y el dispositivo. Este proceso es transparente para el programador, quien simplemente utiliza las mismas instrucciones de acceso a memoria para interactuar con los dispositivos de E/S.

### Ventajas y Desafíos
**Ventajas**: La E/S mapeada en memoria es simple y eficiente, ya que no requiere instrucciones especiales de la CPU para acceder a los dispositivos de E/S. Esto reduce la complejidad del hardware y hace que la CPU sea más rápida y fácil de construir, siguiendo los principios de diseño de sistemas RISC (Reduced Instruction Set Computer). Además, permite que todos los modos de direccionamiento de la CPU disponibles para la memoria también estén disponibles para los dispositivos de E/S, lo cual es beneficioso en sistemas embebidos y en arquitecturas modernas con amplios rangos de direcciones.
**Desafíos**: Uno de los desafíos de la E/S mapeada en memoria es que puede ralentizar los accesos a la memoria, ya que los dispositivos de E/S suelen ser más lentos que la memoria principal. Además, para evitar conflictos, es necesario reservar áreas específicas del espacio de direcciones de la CPU para los dispositivos de E/S, lo cual puede limitar la cantidad de memoria disponible para otras funciones.

[3] Departamento de Ingeniería y Arquitectura, Universidad de Valencia, "Sistemas Electrónicos para el Tratamiento de la Información," OpenCourseWare, 2024. [Online]. Available: http://ocw.uv.es/ingenieria-y-arquitectura/sistemas-electronicos-para-el-tratamiento-de-la-informacion/seti_materiales/seti2_ocw.pdf.

## 5.	Investigue sobre el filtro Gaussiano para procesamiento de imágenes digitales. Particularmente, investigue sobre implementaciones sin multiplicador (multiplierless multiple constant multiplication)

El filtro Gaussiano es un método ampliamente utilizado en el procesamiento de imágenes digitales para suavizar imágenes y eliminar el ruido. Este filtro se basa en la distribución gaussiana, que describe la probabilidad de ocurrencia de un evento aleatorio. En el contexto de las imágenes, el filtro Gaussiano se utiliza para suavizar las transiciones suaves entre regiones de color diferentes, reduciendo el ruido y las variaciones abruptas en intensidad de color.

Una implementación clave del filtro Gaussiano en el procesamiento de imágenes digitales es la realizada sin el uso de multiplicadores, conocida como múltiple constante multiplicación sin multiplicador (multiplierless multiple constant multiplication). Este enfoque busca optimizar el rendimiento y la eficiencia del filtro al evitar la necesidad de realizar operaciones de multiplicación, que pueden ser costosas en términos de tiempo de procesamiento y consumo de energía.

Este enfoque de implementación sin multiplicador se basa en la partición ponderada de los coeficientes del filtro, permitiendo una implementación más eficiente y compacta del filtro Gaussiano. La partición ponderada permite dividir los coeficientes del filtro en partes más pequeñas, lo que facilita la realización de operaciones aritméticas más simples, como sumas y restas, en lugar de multiplicaciones. Esto resulta en una reducción significativa del tiempo de procesamiento y del consumo de energía, lo cual es crucial en aplicaciones de procesamiento de imágenes en tiempo real y en sistemas embebidos con restricciones de energía y tamaño.

[4] Goparaju, V, Siva, R.  "Design of Multiplierless Multiple Constant Multiplication for Convolution Circuit," IJRASET, 2018 [Online]. Available: https://www.ijraset.com/fileserve.php?FID=18375 


## 6.	Investigue sobre el uso de los IP-Cores en Vivado para memorias RAM y ROM.
   
Vivado ofrece soporte para varias memorias, incluyendo RAM y ROM, que pueden ser configuradas y utilizadas dentro de los diseños de FPGA. Estas memorias son fundamentales para almacenar datos temporales durante la ejecución de programas o para almacenar datos permanentemente.

### Configuración de Memorías RAM y ROM
**Memorías RAM** : Se pueden utilizar para almacenar datos temporales durante la ejecución de un programa. Vivado permite configurar la cantidad de RAM disponible y su organización, lo que afecta el rendimiento y la capacidad de almacenamiento.
**Memorías ROM**: Son utilizadas para almacenar datos que deben permanecer constantes durante la ejecución del programa, como firmware o configuraciones de inicialización. Al igual que con la RAM, Vivado permite configurar la cantidad y organización de la ROM.

Para implementar memorias RAM y ROM en un diseño de FPGA usando Vivado, se pueden seleccionar varios tipos de memoria deseado (por ejemplo, Block RAM o Distributed RAM para RAM, o Block ROM para ROM).
### Block RAM

**Organización**: Es una memoria organizada en bloques, lo que significa que está físicamente agrupada en el chip FPGA. Esto permite un acceso más rápido a los datos debido a la proximidad física de los elementos de memoria.

**Rendimiento**: Ofrece un rendimiento superior en comparación con la Distributed RAM debido a su organización en bloques. Esto es especialmente relevante para aplicaciones que requieren alta frecuencia de acceso a la memoria.

**Flexibilidad**: Tiene menos flexibilidad en términos de configuración, ya que los bloques de RAM están predefinidos en cuanto a tamaño y capacidad. Sin embargo, esta flexibilidad se ve compensada por un acceso más rápido y un menor consumo de recursos.


### Distributed RAM

**Organización**: Esta memoria se distribuye a lo largo del chip FPGA, lo que significa que los elementos de memoria están dispersos en lugar de estar agrupados en bloques. Esto puede resultar en un acceso ligeramente más lento a los datos en comparación con la Block RAM.

**Rendimiento**: Aunque el rendimiento generalmente es inferior al de la Block RAM, la Distributed RAM sigue siendo suficiente para la mayoría de las aplicaciones de FPGA. Su rendimiento es adecuado para tareas que no requieren acceso a la memoria a altas frecuencias.

**Flexibilidad**: Ofrece mayor flexibilidad en términos de configuración, ya que permite definir el tamaño y la capacidad de la memoria según las necesidades del diseño. Esto es útil para optimizar el uso de recursos en el chip FPGA.


### Block ROM

**Organización**: Similar a la Block RAM, el Block ROM está organizado en bloques en el chip FPGA. Esto asegura un acceso rápido a los datos, lo cual es crucial para aplicaciones que requieren la ejecución de código o datos fijos.

**Rendimiento**: Ofrece un rendimiento similar al de la Block RAM, con velocidades de acceso rápidas debido a su organización en bloques. Esto es ideal para aplicaciones que necesitan ejecutar rutinas de firmware o configuraciones iniciales rápidamente.

**Flexibilidad**: Al igual que la Block RAM, el Block ROM tiene menos flexibilidad en términos de configuración, ya que los bloques están predefinidos. Sin embargo, su uso es común para almacenar datos o código que debe permanecer constante durante la ejecución del programa.

[5] AMD, "Choosing Between Distributed RAM and Dedicated Block RAM," AMD Technical Information Portal, 2024. [Online]. Available: https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Choosing-Between-Distributed-RAM-and-Dedicated-Block-RAM. 















