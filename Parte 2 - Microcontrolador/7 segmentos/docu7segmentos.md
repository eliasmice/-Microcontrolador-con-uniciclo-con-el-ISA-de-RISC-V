# Documentación del Sistema de Control y Visualización en Displays de 7 Segmentos

## 1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays.
- **BCD**: Binary-Coded Decimal.
- **RST**: Reset.

## 2. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

## 3. Criterios de diseño

Este sistema está diseñado para contar ciclos de reloj y mostrar el valor en displays de 7 segmentos. Utiliza un contador cíclico y un convertidor BCD para transformar los valores binarios a decimales. Además, cuenta con señales de control para iniciar y detener el conteo.

### Componentes principales

1. **Contador cíclico**: Lleva la cuenta de los ciclos de reloj.
2. **Convertidor BCD**: Convierte el valor del contador a formato decimal.
3. **Decodificador de display**: Muestra el valor decimal en los displays de 7 segmentos.

## 4. Desarrollo

### 4.1 Módulo "module_top_7_segments"
Este módulo es el bloque principal que integra los componentes necesarios para el sistema.

#### 1. Encabezado del módulo
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

Entradas y salidas:

- clk: Reloj de la FPGA.
- rst: Señal de reset.
- activation: Señal de activación (2'b01 para iniciar, 2'b10 para detener).
- we_7seg: Señal de habilitación para el contador de 7 segmentos.
- a, b, c, d, e, f, g: Salidas para el display de 7 segmentos.
- AN: Puertos para controlar los nodos comunes del display.

Criterios de diseño
El módulo principal contiene instancias del contador de ciclos, el convertidor BCD y el decodificador de display. El flujo de datos y señales de control se maneja automáticamente a través de estas instancias.

### 4.2 Descripción de submódulos

#### 4.2.1 Módulo "cycle_counter"
Este módulo cuenta los ciclos de reloj y maneja las señales de activación y habilitación.

Encabezado del módulo
```
module cycle_counter (
   input logic clk,       // Señal de reloj
   input logic reset,     // Señal de reset
   input logic [31:0] activation, // Señal de activación (2'b01 para iniciar, 2'b10 para detener)
   input logic we_7seg, // Señal de habilitación
   output logic [31:0] counter // Registro del contador con valores de control
);
```

## Descripción:

`counter`: Registro de 32 bits que almacena el valor del conteo.

### 4.2.2 Módulo "convertidor_bcd"

Convierte el valor binario del contador a formato decimal BCD.

#### Encabezado del módulo

```
module convertidor_bcd (
    input logic [7:0] dato, // Dato binario de 8 bits del contador
    output logic [11:0] decimal // Salida de 12 bits en formato decimal
);
```

### 4.2.3 Módulo "top_module_display"

Muestra el valor decimal en los displays de 7 segmentos.

#### Encabezado del módulo

```
module top_module_display (
    input logic [15:0] switches, // Entrada de 16 bits que contiene el dato decimal para mostrar
    input logic clk_10MHz,
    input logic i_Rst,
    output logic a, b, c, d, e, f, g,
    output logic [7:0] AN // Puertos para controlar los nodos comunes
);
```

## 5. Conclusión
Este sistema automatiza la captura y visualización de datos de ciclos de reloj en un display de 7 segmentos, utilizando señales de control para iniciar y detener el conteo. El diseño modular facilita la integración y el mantenimiento del sistema.
