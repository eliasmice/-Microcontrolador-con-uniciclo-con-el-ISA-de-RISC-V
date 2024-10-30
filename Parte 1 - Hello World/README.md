#  Laboratorio 4 / Parte 1 / Aplicación Hello World


## 1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays.
- **UART**: Universal Asynchronous Receiver-Transmitter.

## 2. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

## 3. Criterios de diseño
Para el diseño de esta aplicación se tomo en cuenta que el programa en ensamblador por realizar llevará el control de los valores ASCII de todas las letras correspondientes al Hello world, este programa irá precargando uno a uno estos valores en los registros del procesador y lo enviará por medio de la comunicación serial UART, una vez que se haya enviado la última letra el sistema se mantendrá en reposo y cada vez que se aplique el reset se volverá a enviar la frase. Para implementar el programa en ensamblador, se hace uso del siguiente diagrama de flujo.

![flujo_hello_world](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/f6bb444c-351b-47e2-958f-1c649c45ac91)

Para esta implementación es necesario el uso de un procesador, por lo que se parte del procesador uniciclo desarrollado en el curso de Diseño de Sistemas Digitales, para poder utilizarlo se le hacen los ajustes correspondientes para que este procesador sea capaz de soportar las instrucciones de RISCV necesarias que se utilizarán en el programa de ensamblador.

También se requiere de diferentes decodificadores que le permiten al sistema habilitar las señales de habilitación de escritura de los diferentes periféricos utilizados, se implementa también otro decodificador específicamente para la interfaz del UART para las señales que permiten seleccionar entre el registro de control y el de datos, y otro decodificador que va de la mano de un multiplexor que se encargan de seleccionar de que periférico será la entrada correspondiente al procesador.

Por último, se requiere de un pequeño módulo que trunque las direcciones de entrada para el IP de la ROM, ya que este requiere que el pc aumente de 1 en 1 y el procesador implementado aumenta de 4 en 4, por lo que se realizó un corrimiento a la derecha de 2 bits para evitar este problema y así no perder información en el proceso.

## 4. Desarrollo

### 4.1 Módulo "top"
#### 1. Encabezado del módulo
```
module top(
    input logic clk,
    input logic rst,
    
    input logic UART_in,

    output logic UART_out
);
```

#### 2. Entradas y salidas:
- `clk`: Reloj de la FPGA.
- `rst`: Señal de reset, se asigna a un push button.
- `UART_in`: Entrada del puerto serial para la recepción de datos.
- `UART_out`: Salida del puerto serial para la transmisión de datos.

#### 3. Criterios de diseño

Este módulo top se diseñó realizando las instancias del procesador, del IP de la ROM y de los demás bloques necesarios para el funcionamiento del sistema.

```
ROM unidad_ROM (
    .a(ProgAddress_o_trunc_in),
    .spo(spo_in)
);

IPU unidad_IPU (
    .clk(clk),
    .rst(rst),
    .wr_i(we_Uart_in),
    .reg_sel_i(reg_sel_i_in),
    .entrada_i(DataOut_o_in),
    .addr_i(addr_i_in),
    .rx(UART_in),
    .salida_o(salida_o_in),
    .tx(UART_out)
);

unicycle unidad_procesador(
    .clk(clk),
    .rst(rst),
    .instruction(spo_in),
    .DataIn_i(DataIn_in),
    .ProgAddress_o(ProgAddress_o_in),
    .DataAddress_o(DataAddress_o_in),
    .DataOut_o(DataOut_o_in),
    .read(read_in),
    .we_o(we_o_in)
);
```

### 4.2 Módulo "unycicle"
#### 1. Encabezado del módulo
```
module unicycle #(
    parameter W=32
)(
    input logic clk, rst,
    input logic [W-1:0] instruction,
    input logic [W-1:0] DataIn_i,
    output logic [W-1:0] ProgAddress_o,
    output logic [W-1:0] DataAddress_o,
    output logic [W-1:0] DataOut_o,
    output logic read,
    output logic we_o
);
```

#### 2. Entradas y salidas:
- `clk`: Reloj de la FPGA.
- `rst`: Señal de reset.
- `instruction`: Instrucción proveniente de la ROM.
- `DataIn_i`: Entrada de los datos provenientes de alguno de los periféricos.
- `ProgAddress_o`: Salida del program counter para las direcciones de las instrucciones.
- `DataAddress_o`: Dirección de salida proveniente de la ALU interna.
- `DataOut_o`: Dato proveniente de los registros internos del procesador.
- `read`: Señal de habilitación de lectura.
- `we_o`: Señal de habilitación de escritura.

#### 3. Criterios de diseño

Como se mencionó anteriormente, este procesador fue elaborado durante el curso de teoría Diseño de Sistemas Digitales, este módulo se encarga de realizar todas las instancias de los bloques internos del procesador, los cuales son la memoria de instrucciones, memoria de datos, ALU, unidad de control, registros intermedios, generador de inmediatos, contador de pc y algunos submódulos más pequeños como unos cuantos mux. Es importante resaltar que se cambia la memoria de instrucciones y de datos ya que para esta implementación se deben utilizar como IPs de Vivado. Al sistema se le realizaron ciertos ajustes para que sea capaz de soportar las instrucciones de RISC-V necesarias utilizadas en esta implementación.

```
imm_gen unidad_imm_gen (
    //entrada
    .inst(instruction),
    //salida
    .immediate_gen(inmediato)
);

registro unidad_registro (
    //entradas
    .clk(clk),
    .rst(rst),
    .rs1(instruction[19:15]),
    .rs2(instruction[24:20]),
    .rd(instruction[11:7]),
    .data_in(write_data),
    .we(RegWrite),
    //salidas
    .data_rs1(data1),
    .data_rs2(data2)
);

main_control unidad_main_control (
    //entradas
    .opcode(instruction[6:0]),
    //salidas
    .Branch(Branch),
    .Mem_read(MemRead),
    .Memto_Reg(MemReg),
    .ALU_OP(ALUOp),
    .Mem_write(MemWrite),
    .ALUSrc(ALUSrc),
    .Reg_Write(RegWrite),
    .salto_incon(salto_incon),
    .flag_direccion(flag_direccion)                        
);

pc unidad_pc(
    //entradas
    .clk(clk),
    .rst(rst),
    .PC_next(pc_in),
    //salidas
    .inst_address(pc_out)
);

```

## 5. Testbench

Se realizó un testbench que le permite al sistema realizar todo el proceso y asi observar en la aplicación RealTerm en la computadora como se escribe la frase Hello World. Las gráficas permiten observar los cambios correspondientes en las instrucciones, direcciones y como se transmiten los datos através del UART.

![hello_world_tb](https://github.com/EL3313/laboratorio4-equipo-4/assets/112665832/4393dd1c-602f-4308-9041-5ac5d05fa846)

