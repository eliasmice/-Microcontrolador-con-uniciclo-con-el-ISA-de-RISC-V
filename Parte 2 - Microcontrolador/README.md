#  Laboratorio 4 / Parte 2 / Microcontrolador

## 1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays.
- **Switch**: dsipositivo que enlaza o abre el circuito entre dos posiciones.
- **Filtro Gaussiano**: filtro que puede suprimir eficazmente el ruido y suavizar la imagen.
- **Pixel**: La más pequeña de las unidades de color que componen una imagen de tipo digital.
- **BCD**: Binary-Coded Decimal

## 2. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

[1] Goparaju, V, Siva, R. "Design of Multiplierless Multiple Constant Multiplication for Convolution Circuit," IJRASET, 2018 [Online]. Available: https://www.ijraset.com/fileserve.php?FID=18375

## 3. Criterios de diseño

### 3.1 Diagrama de Bloques

Se adjunta un diagrama de bloques del sistema microcontrolador para una mejor comprensión de la interconexión de los componentes.

![bloques_micro](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/3a31ba98-990f-4463-8d74-1f479b0e85bb)


### 3.2 Mapa de Memoria

El mapa de memoria del sistema indica la disposición de la memoria de programa y la memoria de datos, así como las direcciones asignadas a los registros internos de los periféricos.

![mapa_memoria](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/42815830-2dcb-4b5f-bd48-92717103dd0a)


## 4. Desarrollo
### 4.1 Módulo "top" del Sistema Microcontrolador

Este módulo "top" del sistema microcontrolador integra varios componentes para el funcionamiento completo del sistema. Incluye un procesador monociclo, memoria, periféricos y lógica de control.

#### 1. Definición del Módulo

```
module top(
    input logic clk,
    input logic rst,
    input logic UART_in,
    input logic [19:0] switches_buttons,
    output logic [15:0] leds,
    output logic UART_out,
    output logic a, b, c, d, e, f, g,
    output logic [7:0] AN // Puertos para controlar los nodos comunes
);
```

#### 2. Descripción

El módulo "top" actúa como la interfaz principal del sistema microcontrolador. A continuación, se describen los componentes principales integrados en este módulo:

- **Reloj de 10 MHz:** Se instancia un módulo para generar una señal de reloj de 10 MHz a partir del reloj de entrada.
- **ROM:** Se incluye una memoria de solo lectura (ROM) para almacenar el programa a ejecutar por el procesador.
- **IPU (Interfaz de Periféricos Universales):** Este módulo proporciona la interfaz entre el procesador y los periféricos, incluyendo la UART.
- **Decodificadores:** Se utilizan decodificadores para interpretar las señales de control y direccionamiento hacia los diferentes periféricos.
- **Multiplexor:** Se emplea un multiplexor para seleccionar la fuente de datos que se enviará al procesador.
- **Procesador Monociclo:** Se instancia un procesador monociclo que ejecuta las instrucciones del programa almacenado en la ROM y se comunica con los periféricos y la memoria de datos.
- **Filtro Gaussiano:** Se integra un bloque para el procesamiento de datos utilizando un filtro Gaussiano.
- **Control de LEDs y 7 segmentos:** Se incluyen módulos para controlar los LEDs y los displays de 7 segmentos de la tarjeta.
- **Switches y Botones:** Se incorpora un bloque para mapear los interruptores y botones de la tarjeta a registros accesibles por el procesador.

#### 3. Entradas y salidas:
  - `clk`: Señal de reloj de entrada.
  - `rst`: Señal de reinicio.
  - `UART_in`: Señal de entrada UART para la comunicación.
  - `switches_buttons`: Datos de entrada desde los interruptores y botones.
  - `leds`: Datos de salida para los LEDs.
  - `UART_out`: Señal de salida UART para la comunicación.
  - `a, b, c, d, e, f, g`: Salidas individuales para los segmentos de los displays de 7 segmentos.
  - `AN`: Puertos para controlar los nodos comunes de los displays de 7 segmentos.


### 4.2 Documentación del Sistema de Control y Visualización en Displays de 7 Segmentos

#### 1. Criterios de diseño

Este sistema está diseñado para contar ciclos de reloj y mostrar el valor en displays de 7 segmentos. Utiliza un contador cíclico y un convertidor BCD para transformar los valores binarios a decimales. Además, cuenta con señales de control para iniciar y detener el conteo.

#### 2. Componentes principales

1. **Contador cíclico**: Lleva la cuenta de los ciclos de reloj.
2. **Convertidor BCD**: Convierte el valor del contador a formato decimal.
3. **Decodificador de display**: Muestra el valor decimal en los displays de 7 segmentos.

#### 3. Módulo "module_top_7_segments"
Este módulo es el bloque principal que integra los componentes necesarios para el sistema.

##### 3.1. Encabezado del módulo
```
module module_top_7_segments (
   input logic clk,
   input logic rst,
   input logic [31:0] activation, // Señal de activación (2'b01 para iniciar, 2'b10 para detener)
   input logic we_7seg,          // Nueva señal de habilitación

   // Del Display
   output logic a, b, c, d, e, f, g,
   output logic [7:0] AN // Puertos para controlar los nodos comunes
);
```

##### 3.2. Entradas y salidas:

- clk: Reloj de la FPGA.
- rst: Señal de reset.
- activation: Señal de activación (2'b01 para iniciar, 2'b10 para detener).
- we_7seg: Señal de habilitación para el contador de 7 segmentos.
- a, b, c, d, e, f, g: Salidas para el display de 7 segmentos.
- AN: Puertos para controlar los nodos comunes del display.

##### 3.3. Criterios de diseño
El módulo principal contiene instancias del contador de ciclos, el convertidor BCD y el decodificador de display. El flujo de datos y señales de control se maneja automáticamente a través de estas instancias.

##### 3.4. Descripción de submódulos

###### 3.4.1 Módulo "cycle_counter"
Este módulo cuenta los ciclos de reloj y maneja las señales de activación y habilitación.

###### Encabezado del módulo
```
module cycle_counter (
   input logic clk,       // Señal de reloj
   input logic reset,     // Señal de reset
   input logic [31:0] activation, // Señal de activación (2'b01 para iniciar, 2'b10 para detener)
   input logic we_7seg, // Señal de habilitación
   output logic [31:0] counter // Registro del contador con valores de control
);
```

###### Descripción:

`counter`: Registro de 32 bits que almacena el valor del conteo.

##### 3.4.2 Módulo "convertidor_bcd"

Convierte el valor binario del contador a formato decimal BCD.

###### Encabezado del módulo

```
module convertidor_bcd (
    input logic [7:0] dato, // Dato binario de 8 bits del contador
    output logic [11:0] decimal // Salida de 12 bits en formato decimal
);
```

##### 3.4.3 Módulo "top_module_display"

Muestra el valor decimal en los displays de 7 segmentos.

###### Encabezado del módulo

```
module top_module_display (
    input logic [15:0] switches, // Entrada de 16 bits que contiene el dato decimal para mostrar
    input logic clk_10MHz,
    input logic i_Rst,
    output logic a, b, c, d, e, f, g,
    output logic [7:0] AN // Puertos para controlar los nodos comunes
);
```

### 4.3 Módulo "top_gauss"
#### 1. Encabezado del módulo
```
module top_gauss (
    input logic clk,
    input logic rst,
    
    input logic select,
    input logic we,
    input logic [31:0] entrada_i,
    output logic [31:0] salida_o
);
```


#### 2. Entradas y salidas:
- `clk`: Reloj del sistema.
- `rst`: Señal de reset.
- `Select`: Señal de selección para el multiplexor y demultiplexor.
- `we`: Señal de habilitación de escritura.
- `entrada_i`: Dato de entrada de 32 bits.
- `salida_o`: Dato de salida de 32 bits.


#### 3. Criterios de diseño

El módulo top_gauss implementa un sistema de procesamiento de imágenes utilizando un filtro Gaussiano. El sistema está compuesto por varios submódulos que trabajan juntos para realizar el filtrado. A continuación, se presenta un resumen de sus funciones y submódulos:

1. **Filtro Gaussiano (gaussian_filter)**: Este submódulo implementa el algoritmo de filtro Gaussiano. Recibe nueve píxeles de entrada (una ventana 3x3) y produce un píxel procesado.

2. **Registro de Control (registro_control_gauss)**: Este submódulo maneja el registro de control del sistema. Recibe señales de control y las almacena para ser utilizadas por otros submódulos.

3. **Registro de Datos (registro_datos_gauss)**: Este submódulo maneja los datos de los píxeles. Almacena los píxeles de entrada y los píxeles procesados, y proporciona las ventanas 3x3 para el filtro Gaussiano.

4. **Multiplexor (mux_gauss)**: Este submódulo selecciona entre la salida del registro de control y la salida del registro de datos, basándose en la señal select.

5. **FSM del Filtro (filtro_fsm)**: Este submódulo implementa una máquina de estados finita que controla el flujo del proceso de filtrado. Genera señales de control para otros submódulos.

6. **Contador 9 (contador_9)**: Este submódulo cuenta hasta 9, exactamente para indicarle a la maquina de estados que ya se recibieron los nueve pixeles para calcular el pixel procesado

7 **Demultiplexor (demux_gauss)**: Este submódulo dirige la señal de habilitación de escritura (we) al registro de control o al registro de datos, basándose en la señal select.


Se presenta el diagrama de bloques de la interfaz del filtro gaussiano:

![bloques_filtro](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/b8557766-8327-486c-8b94-ca8006e96854)


### 4.4 Módulo "filtro_fsm"
#### 1. Encabezado del módulo
```
module filtro_fsm (
    input logic clk,
    input logic reset,
    input logic [31:0] out_control,
    input logic conto9,
    output logic inicio, cuente9, we_c, we_d,
    output logic [3:0] control
);
```



#### 2. Entradas y salidas:
- `clk`: Reloj del sistema.
- `reset`: Señal de reset.
- `out_control`: Señal de entrada de 32 bits que contiene información de control.
- `conto9`: Señal de entrada que indica si el contador ha llegado a 9.
- `inicio`: Señal de salida que indica el inicio del proceso de filtrado.
- `cuente9`: Señal de salida que habilita el conteo hasta 9.
- `we_c`: Señal de salida que habilita la escritura en el registro de control.
- `we_d`: Señal de salida que habilita la escritura en el registro de datos.
- `control`: Señal de salida de 4 bits que contiene información de control.



#### 3. Criterios de diseño
El módulo filtro_fsm implementa una máquina de estados finita (FSM) que controla el proceso de filtrado gaussiano. A continuación, se presenta un diagrama de maquina de estados que explica su funcionamiento:

![filtro_fsm](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/b922ee15-8656-429c-8389-121cbe1e3731)



### 4.5 Módulo "gaussian_filter"
#### 1. Encabezado del módulo
```
module gaussian_filter (
    input logic clk,
    input logic rst,
    input logic inicio,
    input logic [7:0] pixel_00, pixel_01, pixel_02,
    input logic [7:0] pixel_10, pixel_11, pixel_12,
    input logic [7:0] pixel_20, pixel_21, pixel_22,
    output logic [7:0] pixel_procesado
);
```


#### 2. Entradas y salidas:
- `clk`: Reloj del sistema.
- `rst`: Señal de reset.
- `inicio`: Señal que indica el inicio del proceso de filtrado.
- `pixel_00 a pixel_22`: Nueve entradas de 8 bits cada una, representando los valores de una ventana 3x3 de píxeles.
- `pixel_procesado`: Salida de 8 bits que representa el valor del píxel procesado por el filtro gaussiano..


#### 3. Criterios de diseño
Este módulo implementa el núcleo del algoritmo de filtro gaussiano. Recibe una ventana 3x3 de píxeles, aplica el filtro gaussiano para suavizar el píxel central, y produce el píxel procesado como salida. 
Este proceso se repite para cada píxel de la imagen, resultando en una imagen suavizada.
La ecuación utilizada representa la convolución con el kernel gaussiano:


![kernel](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/c4160423-a756-4e34-a2a0-52ed43af3a8a)


### 4.6 Módulo "registro_control_gauss"
#### 1. Encabezado del módulo
```
module registro_control_gauss (
    input logic clk,         
    input logic rst,
    input logic senal,
    input logic [31:0] in_c, 
    input logic we,
    input logic we_fsm,
    output reg [31:0] out_c
);
```


#### 2. Entradas y salidas:
- `clk`: Reloj del sistema.
- `rst`: Señal de reset.
- `senal`: Señal de entrada de 1 bit.
- `in_c`: Entrada de datos de 32 bits.
- `we`: Señal de habilitación de escritura para senal.
- `we_fsm`: Señal de habilitación de escritura para in_c.
- `out_c`: Salida de datos de 32 bits que representa el contenido del registro de control.



#### 3. Criterios de diseño
El módulo implementa un registro de control de 32 bits que se utiliza para gestionar las señales de control en el sistema de filtro gaussiano.


### 4.7 Módulo "registro_datos_gauss"
#### 1. Encabezado del módulo
```
module registro_datos_gauss (
    input logic clk,         
    input logic rst,
    input logic [7:0] in_pixel,
    input logic [7:0] in_procesado,
    input logic we,
    input logic we_fsm,
    input logic [3:0] addr_i,
    output logic [31:0] out_d,
    output logic [7:0] out_pixel_1,
    output logic [7:0] out_pixel_2,
    output logic [7:0] out_pixel_3,
    output logic [7:0] out_pixel_4,
    output logic [7:0] out_pixel_5,
    output logic [7:0] out_pixel_6,
    output logic [7:0] out_pixel_7,
    output logic [7:0] out_pixel_8,
    output logic [7:0] out_pixel_9
);
```


#### 2. Entradas y salidas:
- `clk_fpga`: Reloj del sistema.
- `rst`: Señal de reset.
- `in_pixel`: Entrada de 8 bits para un píxel.
- `in_procesado`: Entrada de 8 bits para un píxel procesado.
- `we`: Señal de habilitación de escritura para senal.
- `we_fsm`: Señal de habilitación de escritura desde la FSM (no utilizada en este módulo).
- `addr_i`: Dirección de 4 bits para seleccionar el registro de píxel a escribir.
- `out_d`: Salida de 32 bits que contiene el píxel procesado.
- `out_pixel_1 a out_pixel_9`: Nueve salidas de 8 bits cada una, representando los valores de una ventana 3x3 de píxeles.


#### 3. Criterios de diseño
El módulo registro_datos_gauss implementa un conjunto de registros para almacenar y gestionar píxeles y píxeles procesados en el sistema de filtro gaussiano.
Almacena una ventana 3x3 de píxeles en registros individuales y proporciona estas salidas al filtro. También almacena el píxel procesado resultante. Este diseño facilita el procesamiento de imágenes píxel por píxel.


### Testbench: "tb_top_gauss"

#### **Descripción general**:
   
El testbench tb_top_gauss está diseñado para verificar el funcionamiento del módulo top_gauss, que es el módulo principal del sistema de filtro gaussiano.
El testbench genera estímulos de entrada, los aplica al módulo bajo prueba (DUT), y observa las salidas.

#### Secuencia de prueba:

##### Inicialización:

- Se inicializan las señales (rst, select, we, entrada_i) a 0.

- Se aplica un pulso de reset (rst) durante 10 ns.


##### Primera secuencia de prueba:

- Se activa we y select para escribir en el registro de control.

- Se envían 9 valores de prueba para los píxeles a través de entrada_i, uno cada 10 ns.

##### Finalización

#### Resultados de simulación:

![filtro_tb](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/9f50ce02-a874-4117-9537-daa34b4a8d6a)






