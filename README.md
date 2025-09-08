# BASIC UART IN VERILOG
---
## Introduction:
The Universal Asynchronous Receiver/Transmitter (UART) is a simple, widely used serial interface for point-to-point communication between devices such as microcontrollers, sensors, and PCs. Because it’s asynchronous, UART doesn’t share a clock line; instead both ends agree on a baud rate (e.g., 9,600–115,200 bps) and frame format. Each frame typically consists of an idle high line, a start bit (low), 5–9 data bits sent LSB first, optional parity for basic error checking, and one or more stop bits—commonly summarized as settings like 8-N-1. Data is carried on two lines—TX (transmit) and RX (receive)—plus ground, enabling full-duplex communication. Electrical levels depend on the physical layer: TTL/CMOS (0–3.3/5 V) is common on boards, while RS-232 (± voltages, inverted) and RS-485 (differential) adapt UART for longer or noisier links. Typical UART peripherals support interrupts/FIFOs/DMA and report framing, parity, or overrun errors.
In this project, it just focus on how to make a basic UART protocol with 8 bit data, parity bit, 1 stop bit. Also, it does not has FIFOs inside.
## Block diagram:
### TX Block:
![TX_UART](https://github.com/HuynhTrungKien/Basic-UART/blob/master/Image/TX_UART.png)
### RX Block:
![RX_UART](https://github.com/HuynhTrungKien/Basic-UART/blob/master/Image/RX_UART.png)
## Simulation
### Schematic:
![Schematic](https://github.com/HuynhTrungKien/Basic-UART/blob/master/Image/Schematic.png)
### Simulation:
![Simulation](https://github.com/HuynhTrungKien/Basic-UART/blob/master/Image/Simulation.png)
# Reference:
https://www.sciencedirect.com/science/article/abs/pii/S004579060400014X

https://github.com/MuhammadMajiid/UART
