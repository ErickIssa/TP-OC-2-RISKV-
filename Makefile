all:
	iverilog -o outdp pc.v somador.v Alu.v Alu_Control.v Control.v data_mem.v data_path.v immGen.v Instruction_mem.v Mux.v Reg_mem.v

run:
	vvp outdp

gtk:
	gtkwave dpteste.vcd
