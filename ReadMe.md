# Single-Cycle RISC-V Processor (RV32I)

A modular implementation of a 32-bit Single-Cycle RISC-V processor in Verilog HDL. This project was developed as a self-learning exercise to understand processor architecture, datapath design, and control logic by implementing a subset of the RV32I instruction set.

The processor follows the classic single-cycle datapath where every instruction completes in one clock cycle.

---

## Features

- 32-bit RV32I processor implementation
- Single-cycle datapath architecture
- Modular Verilog design
- Separate Control Unit and ALU Control
- 32 × 32-bit Register File
- Instruction Memory
- Data Memory
- Immediate Generator
- Program Counter with Branch Support
- ModelSim simulation and waveform verification

---

## Supported Instructions

### R-Type
- ADD
- SUB
- AND
- OR

### I-Type
- ADDI

### Load/Store
- LW
- SW

### Branch
- BEQ

---

## Processor Datapath

The processor consists of the following modules:

```
Program Counter
        │
        ▼
Instruction Memory
        │
        ▼
Control Unit ───────────────┐
        │                   │
        ▼                   ▼
 Register File         Immediate Generator
        │                   │
        └──────┬────────────┘
               ▼
              ALU
               │
        ┌──────┴──────┐
        ▼             ▼
   Data Memory      Branch Logic
        │             │
        └──────┬──────┘
               ▼
          Write Back MUX
               │
               ▼
         Register File
```

---

## Project Structure

```
.
├── adder.v
├── alu.v
├── alu_control.v
├── andlogic.v
├── controlunit.v
├── datamemory.v
├── immediate_generator.v
├── instruction_memory.v
├── multiplexers.v
├── pc.v
├── register.v
├── topmodule.v
├── testbench.v
└── README.md
```

---

## Module Description

### Program Counter
Maintains the address of the current instruction and updates it every clock cycle.

### Instruction Memory
Stores the instruction program and provides instruction fetch based on the current PC.

### Register File
Implements 32 general-purpose 32-bit registers with two asynchronous read ports and one synchronous write port.

### Immediate Generator
Generates sign-extended immediates for I-type, S-type, and B-type instructions.

### Control Unit
Generates processor control signals based on the instruction opcode.

### ALU Control
Decodes ALU operation using the ALUOp signal together with funct3 and funct7 fields.

### ALU
Performs arithmetic and logical operations including ADD, SUB, AND, and OR.

### Data Memory
Supports load and store operations for LW and SW instructions.

### Multiplexers
Control operand selection, write-back selection, and next PC selection.

---

## Simulation

The processor has been simulated using **ModelSim**.

The simulation verifies:

- Program Counter operation
- Instruction Fetch
- Register Read/Write
- ALU Operations
- Immediate Generation
- Load/Store Operations
- Branch Decision Logic

---

## Example Program

The instruction memory includes a sample program containing:

- ADD
- SUB
- OR
- AND
- ADDI
- LW
- SW
- BEQ

These instructions are executed sequentially to verify the complete datapath.

---

## Future Improvements

- Complete RV32I instruction support
- Jump Instructions (JAL/JALR)
- Shift Instructions
- SLT/SLTU Instructions
- Byte and Half-word Load/Store
- Parameterized Memory Initialization
- Memory File (.mem) Support
- Automated Verification Testbench

---

## Tools Used

- Verilog HDL
- ModelSim
- Git
- Visual Studio Code

---

## Learning Outcomes

This project helped build a practical understanding of:

- RISC-V ISA
- Single-Cycle Processor Architecture
- Datapath Design
- Control Signal Generation
- ALU Design
- Register File Implementation
- Memory Interface Design
- Processor Verification using ModelSim

---

