// the first 7 bits are opcode for this processor 
module imm_gen (
    opcode,
    instruction,
    immext
);

input [6:0] opcode;
input [31:0] instruction;
output reg [31:0] immext;

//------------------ Opcodes ------------------//
localparam OPCODE_RTYPE  = 7'b0110011;
localparam OPCODE_ITYPE  = 7'b0010011;
localparam OPCODE_LOAD   = 7'b0000011;
localparam OPCODE_STORE  = 7'b0100011;
localparam OPCODE_BRANCH = 7'b1100011;

always @(*) begin
    case (opcode)

        // I-Type Instructions (ADDI, ORI, etc.)
        OPCODE_ITYPE:
            immext = {{20{instruction[31]}}, instruction[31:20]};

        // Load Instructions (LW)
        OPCODE_LOAD:
            immext = {{20{instruction[31]}}, instruction[31:20]};

        // Store Instructions (SW)
        OPCODE_STORE:
            immext = {{20{instruction[31]}},
                      instruction[31:25],
                      instruction[11:7]};

        // Branch Instructions (BEQ)
            OPCODE_BRANCH:
    immext = {{19{instruction[31]}},
              instruction[31],
              instruction[7],
              instruction[30:25],
              instruction[11:8],
              1'b0};
        // R-Type Instructions don't use an immediate
        OPCODE_RTYPE:
            immext = 32'b0;

        default:
            immext = 32'b0;

    endcase
end

endmodule
