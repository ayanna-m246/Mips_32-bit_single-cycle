#  MIPS 32-bit Single Cycle Processor

This is a Verilog-based implementation of a **32-bit MIPS Single Cycle Processor**. Each instruction is executed in a single clock cycle. The processor supports a subset of MIPS instructions and is designed using modular components for easy simulation and extension.

---

##  Features

- 32-bit single-cycle architecture
- Supports key MIPS instructions:
  - **R-type**: `add`, `sub`, `and`, `or`, `slt`
  - **I-type**: `lw`, `sw`, `beq`, `addi`
  - **J-type**: `j`
- Modular design with separate files for each major unit
- `$monitor` used for real-time signal tracing during simulation

---

##  Top Module: `top.v`

The `top.v` module acts as the heart of the processor, connecting all major components. It:

- Fetches instructions from the instruction memory
- Decodes using the control unit and ALU control
- Executes arithmetic/logical instructions via the ALU
- Accesses data memory and registers for load/store operations
- Updates the program counter on each clock edge

Internal signals like PC, ALU result, and register outputs can be monitored using `$monitor` for debugging purposes.

---

## 🗂️ File Structure

The project is divided into modular Verilog files:

- `top.v`: Top-level module integrating all processor components
- `control_unit.v`: Generates control signals based on instruction opcode
- `alu_control.v`: Decodes function field for ALU operations
- `ALU_unit.v`: Performs arithmetic and logical operations
- `registers.v`: Implements the 32 general-purpose 32-bit registers
- `ins_memory.v`: Stores and provides instructions to be executed
- `data_mem.v`: Simulates memory used for load/store instructions
- `testbench.v`: (to be added) Simulates processor behavior for testing

