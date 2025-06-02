all:
	iverilog -o outdp Alu_Control.v alu.v Control.v data_mem.v data_path.v immGen.v Instruction_mem.v mux.v pc.v Reg_mem.v somador.v

run:
	vvp outdp

gtk:
	gtkwave dpteste.vcd
