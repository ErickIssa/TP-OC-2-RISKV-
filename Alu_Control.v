// module Alu_Control_tb;
//     wire [3:0] aluCtrlACtrl_;
//     reg [1:0] aluOpACtrl_;
//     reg [3:0] f3f7ACtrl_;
//     aluControl aluControl(f3f7ACtrl_, aluOpACtrl_, aluCtrlACtrl_);

//     initial begin
//         $dumpfile("alu_control_test.vcd");
//         $dumpvars(2, aluControl_tb);
        
//         // Test 1: ALUOp = 00 (add for I-type)
//         #5 aluOpACtrl_ <= 2'b00; 
//            f3f7ACtrl_ <= 4'bxxxx;  // Don't care
//            $display("Test 1: ALUOp=00 (I-type) => ADD, Output: %b", aluCtrlACtrl_);
        
//         // Test 2: ALUOp = 01 (sub for branches)
//         #5 aluOpACtrl_ <= 2'b01; 
//            f3f7ACtrl_ <= 4'bxxxx;  // Don't care
//            $display("Test 2: ALUOp=01 (branch) => SUB, Output: %b", aluCtrlACtrl_);
        
//         // Test 3: R-type - ADD (funct7=0, funct3=000)
//         #5 aluOpACtrl_ <= 2'b10; 
//            f3f7ACtrl_ <= 4'b0000;
//            $display("Test 3: R-type ADD => ADD, Output: %b", aluCtrlACtrl_);
        
//         // Test 4: R-type - SUB (funct7=1, funct3=000)
//         #5 aluOpACtrl_ <= 2'b10; 
//            f3f7ACtrl_ <= 4'b1000;
//            $display("Test 4: R-type SUB => SUB, Output: %b", aluCtrlACtrl_);
        
//         // Test 5: R-type - XOR (funct3=100)
//         #5 aluOpACtrl_ <= 2'b10; 
//            f3f7ACtrl_ <= 4'b0100;
//            $display("Test 5: R-type XOR => XOR, Output: %b", aluCtrlACtrl_);
        
//         // Test 6: R-type - SRL (funct3=101)
//         #5 aluOpACtrl_ <= 2'b10; 
//            f3f7ACtrl_ <= 4'b0101;
//            $display("Test 6: R-type SRL => SRL, Output: %b", aluCtrlACtrl_);
        
//         // Test 7: R-type - SLL (funct3=001) - NEW
//         #5 aluOpACtrl_ <= 2'b10; 
//            f3f7ACtrl_ <= 4'b0001;
//            $display("Test 7: R-type SLL => SLL, Output: %b", aluCtrlACtrl_);
        
//         // Test 8: Invalid funct3
//         #5 aluOpACtrl_ <= 2'b10; 
//            f3f7ACtrl_ <= 4'b0111;
//            $display("Test 8: Invalid funct3 => X, Output: %b", aluCtrlACtrl_);
        
//         #5 $finish;
//     end
// endmodule

module Alu_Control(f3f7ACtrl, aluOpACtrl, aluCtrlACtrl);
    output reg [3:0] aluCtrlACtrl;
    input [1:0] aluOpACtrl;
    input [3:0] f3f7ACtrl;
    wire funct7ACtrl;
    wire [2:0] funct3ACtrl;

    assign funct7ACtrl = f3f7ACtrl[3];
    assign funct3ACtrl = f3f7ACtrl[2:0];

    always @(*)
    begin
        case (aluOpACtrl)
            2'b00: aluCtrlACtrl <= 4'b0010; // 00 - add (addi, lw, sw)
            2'b01: aluCtrlACtrl <= 4'b0110; // 01 - sub (beq, bne)
            2'b10: begin
                case (funct3ACtrl)
                    3'b000: aluCtrlACtrl <= (funct7ACtrl) ? 4'b0110 : 4'b0010; // sub ou add
                    3'b100: aluCtrlACtrl <= 4'b0011; // xor
                    3'b101: aluCtrlACtrl <= 4'b0100; // srl
                    3'b001: aluCtrlACtrl <= 4'b0101; // sll
                endcase
            end
        endcase
    end
endmodule
