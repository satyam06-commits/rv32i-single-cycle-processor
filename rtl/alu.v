//
module alu_unit (a,b,control_in,alu_result,zero) ;
input [31:0] a,b ;
input [3:0] control_in ;
output reg [31:0] alu_result;
output reg zero ;
localparam ALU_AND = 4'b0000;
localparam ALU_OR  = 4'b0001;
localparam ALU_ADD = 4'b0010;
localparam ALU_SUB = 4'b0110;
always @(*) begin

    zero = 1'b0;
    alu_result = 32'b0;

    case(control_in)

        ALU_AND:
            alu_result = a & b;

        ALU_OR:
            alu_result = a | b;

        ALU_ADD:
            alu_result = a + b;

        ALU_SUB: begin
            alu_result = a - b;
            zero = (a==b);
        end

    endcase

end
endmodule