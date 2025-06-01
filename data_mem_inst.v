data_mem data_mem_inst
(
	.clock(clock_sig) ,	// input  clock_sig
	.memReadDM(memReadDM_sig) ,	// input  memReadDM_sig
	.memWriteDM(memWriteDM_sig) ,	// input  memWriteDM_sig
	.addressDM(addressDM_sig) ,	// input [31:0] addressDM_sig
	.writeDataDM(writeDataDM_sig) ,	// input [31:0] writeDataDM_sig
	.readDataDM(readDataDM_sig) 	// output [31:0] readDataDM_sig
);

