//
module control(instruction,branch,memread,memtoreg,aluop,memwrite,alusrc,regwrite);  
input [6:0] instruction ;
output reg branch,memread,memtoreg,memwrite,alusrc,regwrite ;
output reg [1:0] aluop ;
localparam OPCODE_RTYPE  = 7'b0110011;
localparam OPCODE_ITYPE  = 7'b0010011;
localparam OPCODE_LOAD   = 7'b0000011;
localparam OPCODE_STORE  = 7'b0100011;
localparam OPCODE_BRANCH = 7'b1100011;

always @(*)
begin 
    case({instruction})
    default: {alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop} = 8'b00000000;
    OPCODE_RTYPE : {alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop[1:0]} = 8'b00100010 ;
    OPCODE_LOAD : {alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop[1:0]} = 8'b11110000 ;
    OPCODE_STORE : {alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop[1:0]} = 8'b11001000 ; // mem to reg is x lets here be 1 
    OPCODE_BRANCH : {alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop[1:0]} = 8'b00000101 ; // mem to reg is x lets here be 0 
    OPCODE_ITYPE : {alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop}= 8'b10100011;
    endcase
end
endmodule

