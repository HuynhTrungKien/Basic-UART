# BASIC UART IN VERILOG
---
## Introduction:
The Universal Asynchronous Receiver/Transmitter (UART) is a simple, widely used serial interface for point-to-point communication between devices such as microcontrollers, sensors, and PCs. Because it’s asynchronous, UART doesn’t share a clock line; instead both ends agree on a baud rate (e.g., 9,600–115,200 bps) and frame format. Each frame typically consists of an idle high line, a start bit (low), 5–9 data bits sent LSB first, optional parity for basic error checking, and one or more stop bits—commonly summarized as settings like 8-N-1. Data is carried on two lines—TX (transmit) and RX (receive)—plus ground, enabling full-duplex communication. Electrical levels depend on the physical layer: TTL/CMOS (0–3.3/5 V) is common on boards, while RS-232 (± voltages, inverted) and RS-485 (differential) adapt UART for longer or noisier links. In this project, it just focus on how to make a basic UART protocol with 8 bit data, parity bit, 1 stop bit. Also, it does not has FIFOs inside.
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
---
<img width="1721" height="491" alt="image" src="https://github.com/user-attachments/assets/e93a460d-1c8a-4069-bf4e-c4ffd8faa645" />
<img width="1280" height="415" alt="image" src="https://github.com/user-attachments/assets/be646361-5d9e-4066-accf-0196d7f46031" />
I used UVM to check my module whether it work perfectly or not, two of pictures above show the logs that simulation print out.

## Demo

https://www.youtube.com/watch?v=90tbMDvpPHY

## Reference:
[https://www.sciencedirect.com/science/article/abs/pii/S004579060400014X](https://d1wqtxts1xzle7.cloudfront.net/74700046/S0045-7906_2804_2900014-X20211115-11235-1ad609r-libre.pdf?1637034933=&response-content-disposition=inline%3B+filename%3DDesign_of_a_micro_UART_for_SoC_applicati.pdf&Expires=1758695812&Signature=EdPimVyJuKKtQ2A1stvL~Qr0d0afPOnOC67iq3WemBkPq7Z6f9W3znW66DNP4EQud5aCUhpKAQONYLUX63WgoHqKzcf9RPfSdinMNEhIrIwK0urV3AO~WbD4yrpEtznfXiV8zhrQCWPhCEtsDZVlXqR4iK98DdTgGi1RFh9Ru1fDEpjp5vVVg-eRj9Cq6dvjpXh2C4q5ayFFNah9rmB4UFgJLsN8menPZl97OYR~qARz8Gz6btdwh7J~GW79MmEz1Cqxs6ZZnbSNK2JPzAB5gi-vji~w6sudIhc-72MXoNm2NdTFVNHuIvipLrOhA640QYJNqT2LiPECqWL~OwVuKw__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA)

https://github.com/MuhammadMajiid/UART
