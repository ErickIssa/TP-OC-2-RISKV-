// // module teste;
// //     wire BranchCtrl_, MemReadCtrl_, MemToRegCtrl_, MemWriteCtrl_, ALUSrcCtrl_, RegWriteCtrl_;
// //     wire [1:0] ALUOpCtrl_;
// //     reg [6:0] instructionCtrl_;
// //     control ctrl(instructionCtrl_, BranchCtrl_, MemReadCtrl_, MemToRegCtrl_, ALUOpCtrl_, MemWriteCtrl_, ALUSrcCtrl_, RegWriteCtrl_);

// //     initial begin
// //         $dumpfile("test.vcd");
// //         $dumpvars(2,teste);
// //     

// module teste;
//     wire BranchCtrl_, MemReadCtrl_, MemToRegCtrl_, MemWriteCtrl_, ALUSrcCtrl_, RegWriteCtrl_;
//     wire [1:0] ALUOpCtrl_;
//     reg [6:0] instructionCtrl_;
//     control ctrl(instructionCtrl_, BranchCtrl_, MemReadCtrl_, MemToRegCtrl_, ALUOpCtrl_, MemWriteCtrl_, ALUSrcCtrl_, RegWriteCtrl_);

//     initial begin
//         $dumpfile("test.vcd");
//         $dumpvars(2,teste);
        
//         // Test LW (I-type)
//         #5 instructionCtrl_ <= 7'b0000011;
        
//         // Test SW (S-type)
//         #5 instructionCtrl_ <= 7'b0100011;
        
//         // Test R-type (ADD/SUB/XOR/SLL)
//         #5 instructionCtrl_ <= 7'b0110011;
        
//         // Test ADDI (I-type)
//         #5 instructionCtrl_ <= 7'b0010011;
        
//         // Test Branch (BEQ/BNE)
//         #5 instructionCtrl_ <= 7'b1100011;
        
//         #5 $finish;
//     end
// endmodule
module Control(instructionCtrl, BranchCtrl, MemReadCtrl, MemToRegCtrl,
                ALUOpCtrl, MemWriteCtrl, ALUSrcCtrl, RegWriteCtrl);
    input [6:0] instructionCtrl;
    output BranchCtrl, MemReadCtrl, MemToRegCtrl, MemWriteCtrl, ALUSrcCtrl, RegWriteCtrl;
    output [1:0] ALUOpCtrl;
    reg [7:0] outputCtrl;
    assign {ALUSrcCtrl, MemToRegCtrl, RegWriteCtrl, MemReadCtrl, MemWriteCtrl, BranchCtrl, ALUOpCtrl} = outputCtrl;

    always @(instructionCtrl)
    begin
        case (instructionCtrl)
            7'b0000011: outputCtrl <=  8'b11110000; // lw   - I
            7'b0100011: outputCtrl <=  8'b10001000; // sw   - S
            7'b0110011: outputCtrl <=  8'b00100010; // R-type instructions
            7'b0010011: outputCtrl <=  8'b10100000; // addi - I
            7'b1100011: begin
                case (instructionCtrl[14:12])
                    3'b000: outputCtrl <=  8'b00000101; // beq
                    3'b001: outputCtrl <=  8'b00000101; // bne
                    default: outputCtrl <=  8'bxxxxxxxx;
                endcase
            end
            default: outputCtrl <=  8'bxxxxxxxx;
        endcase
    end
endmodule