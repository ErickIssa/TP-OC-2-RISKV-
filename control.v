module control(instructionCtrl, BranchCtrl, MemReadCtrl, MemToRegCtrl,
               ALUOpCtrl, MemWriteCtrl, ALUSrcCtrl, RegWriteCtrl);
    input [6:0] instructionCtrl;
    output BranchCtrl, MemReadCtrl, MemToRegCtrl, MemWriteCtrl, ALUSrcCtrl, RegWriteCtrl;
    output [1:0] ALUOpCtrl;
    reg [7:0] outputCtrl;
    
    assign {ALUSrcCtrl, MemToRegCtrl, RegWriteCtrl, MemReadCtrl, MemWriteCtrl, BranchCtrl, ALUOpCtrl} = outputCtrl;

    always @(instructionCtrl) begin
        case (instructionCtrl)
            7'b0000011: outputCtrl <= 8'b11110000; // lw
            7'b0100011: outputCtrl <= 8'b10001000; // sw
            7'b0110011: outputCtrl <= 8'b00100010; // R-type (add/sub/xor)
            7'b0010011: outputCtrl <= 8'b10100000; // addi
            7'b1100011: outputCtrl <= 8'b00000101; // bne
            default:    outputCtrl <= 8'bxxxxxxxx;
        endcase
    end
endmodule