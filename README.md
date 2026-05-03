# Sequence Detector Design (1011)

## Project Description
This project aims to design and implement a synchronous sequence detector using Verilog Hardware Description Language (HDL). The system is engineered to detect a specific 4-bit binary sequence (1011) from a continuous serial input stream. It utilizes a Finite State Machine (FSM) architecture to ensure precise and efficient hardware performance, providing a detection signal whenever the target pattern is identified.

## Project Files
* `sequence_detector.v`: The core hardware design containing the FSM logic for sequence detection.
* `tb_sequence_detector.v`: The comprehensive testbench file used to verify the design under various scenarios.
* `test_results.vcd`: The simulation waveform data for visual verification of signal transitions.
* `Report.pdf`: The formal academic report detailing the state diagrams, logic design, and analysis.

## Prerequisites
To compile and simulate this Verilog project, you need to have the following tools installed on your system.
* **Icarus Verilog**: For compiling the Verilog HDL code.
* **GTKWave**: For viewing and analyzing the simulation waveforms.

## Installation and Simulation Procedure
Follow these step-by-step instructions to run the simulation on your local machine.

**Step 1: Download the project**
Clone this repository or download the files into a single folder on your computer.

**Step 2: Compile the Verilog files**
Open your terminal or command prompt, navigate to the folder where the files are located, and run the following command.

iverilog -o sequence_sim sequence_detector.v tb_sequence_detector.v

Step 3: Run the simulation
After successful compilation, execute the generated simulation file:

vvp sequence_sim

Step 4: View the waveforms
The simulation will automatically generate a .vcd file. To open it and view the hardware signals visually, run:

gtkwave test_results.vcd
