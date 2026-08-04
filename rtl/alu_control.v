module alu_control(aluop,fun7,fun3,control_out );
input fun7 ;
input [2:0] fun3;
input [1:0] aluop ;
output reg [3:0] control_out ;
localparam ALUOP_LS     = 2'b00;
localparam ALUOP_BRANCH = 2'b01;
localparam ALUOP_RTYPE  = 2'b10;
localparam ALUOP_ITYPE = 2'b11;
localparam ALU_AND = 4'b0000;
localparam ALU_OR  = 4'b0001;
localparam ALU_ADD = 4'b0010;
localparam ALU_SUB = 4'b0110;
always@(*) 
begin 
    case({aluop,fun7,fun3})

{ALUOP_LS,1'b0,3'b000} :
    control_out = ALU_ADD;

{ALUOP_BRANCH,1'b0,3'b000} :
    control_out = ALU_SUB;

{ALUOP_RTYPE,1'b0,3'b000} :
    control_out = ALU_ADD;

{ALUOP_RTYPE,1'b1,3'b000} :
    control_out = ALU_SUB;

{ALUOP_RTYPE,1'b0,3'b111} :
    control_out = ALU_AND;

{ALUOP_RTYPE,1'b0,3'b110} :
    control_out = ALU_OR; 
    
{ALUOP_ITYPE,1'b0,3'b000} :
    control_out = ALU_ADD;


{ALUOP_ITYPE,1'b0,3'b110} :
    control_out = ALU_OR;


{ALUOP_ITYPE,1'b0,3'b111} :
    control_out = ALU_AND;
    endcase
end
endmodule 
