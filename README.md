
## File Descriptions

- **`mux.v`**: Implements an N-to-1 multiplexer.
- **`decoder.v`**: A binary decoder for instruction decoding.
- **`register.v`**: General-purpose register module.
- **`ram.v`**: RAM module with read/write capability.
- **`rom.v`**: ROM module to store instruction memory.
- **`cpu.v`**: The top-level CPU integrating all components.
- **`tb_cpu.v`**: Testbench to simulate and validate the CPU.

## Requirements

Ensure the following tools are installed:

- [Icarus Verilog](http://iverilog.icarus.com/)
- [GTKWave](http://gtkwave.sourceforge.net/) (optional for waveform visualization)

## Compilation

To compile the CPU and its components with the testbench:

```bash
iverilog -o cpu.out cpu.v decoder.v mux.v ram.v rom.v register.v tb_cpu.v
