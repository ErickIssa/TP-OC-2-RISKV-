// module Alu_tb;
//     reg [31:0] aluInput1_, aluInput2_;
//     reg [3:0] aluControlAlu_;
//     wire [31:0] aluResultAlu_;
//     wire zeroAlu_;
//     alu alutb(aluInput1_, aluInput2_, aluControlAlu_, aluResultAlu_, zeroAlu_);

//     initial begin
//         $dumpfile("teste.vcd");
//         $dumpvars(2, alu_tb);
        
//         // Teste ADD (0010)
//         #5 aluControlAlu_ <= 4'b0010; 
//            aluInput1_ <= 32'hFFFFFFFF; 
//            aluInput2_ <= 32'h2;
        
//         // Teste SUB (0110)
//         #5 aluControlAlu_ <= 4'b0110; 
//            aluInput1_ <= 32'h5; 
//            aluInput2_ <= 32'hFFFFFFFF;
        
//         // Teste XOR (0011)
//         #5 aluControlAlu_ <= 4'b0011; 
//            aluInput1_ <= 32'h0; 
//            aluInput2_ <= 32'hFFFFFFFF;
        
//         // Teste SRL (0100)
//         #5 aluControlAlu_ <= 4'b0100; 
//            aluInput1_ <= 32'hFFFFFFFF; 
//            aluInput2_ <= 32'h9;
        
//         // Teste SLL (0101) - NOVO
//         #5 aluControlAlu_ <= 4'b0101; 
//            aluInput1_ <= 32'h0000000F; 
//            aluInput2_ <= 32'h2;
        
//         // Teste ADD com zero flag (0010)
//         #5 aluControlAlu_ <= 4'b0010; 
//            aluInput1_ <= 32'h0; 
//            aluInput2_ <= 32'h0;
        
//         // Teste SUB com zero flag (0110)
//         #5 aluControlAlu_ <= 4'b0110; 
//            aluInput1_ <= 32'hA; 
//            aluInput2_ <= 32'hA;
        
//         // Teste SLL com deslocamento máximo (0101) - NOVO
//         #5 aluControlAlu_ <= 4'b0101; 
//            aluInput1_ <= 32'h00000001; 
//            aluInput2_ <= 32'h1F;
        
//         #5 $finish;
//     end
// endmodule


module Alu(aluInput1, aluInput2, aluControlAlu, aluResultAlu, zeroAlu);
    input [31:0] aluInput1, aluInput2;
    input [3:0] aluControlAlu;
    output reg [31:0] aluResultAlu;
    output zeroAlu;

    assign zeroAlu = (aluResultAlu == 0) ? 1 : 0;

    always @(*)
    begin
        case (aluControlAlu)
            4'b0010: aluResultAlu <= aluInput1 + aluInput2; // add
            4'b0110: aluResultAlu <= aluInput1 - aluInput2; // sub
            4'b0011: aluResultAlu <= aluInput1 ^ aluInput2; // xor
            4'b0100: aluResultAlu <= aluInput1 >> aluInput2; // srl
            4'b0101: aluResultAlu <= aluInput1 << aluInput2; // sll
            default: aluResultAlu <= 31'bx;
        endcase
    end
endmodule
