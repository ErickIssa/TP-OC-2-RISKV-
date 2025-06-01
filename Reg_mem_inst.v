Reg_mem Reg_mem_inst
(
	.clock(clock_sig) ,	// input  clock_sig
	.reset(reset_sig) ,	// input  reset_sig
	.regWrite(regWrite_sig) ,	// input  regWrite_sig
	.readReg1(readReg1_sig) ,	// input [4:0] readReg1_sig
	.readReg2(readReg2_sig) ,	// input [4:0] readReg2_sig
	.writeRegId(writeRegId_sig) ,	// input [4:0] writeRegId_sig
	.writeData(writeData_sig) ,	// input [31:0] writeData_sig
	.readData1(readData1_sig) ,	// output [31:0] readData1_sig
	.readData2(readData2_sig) 	// output [31:0] readData2_sig
);

