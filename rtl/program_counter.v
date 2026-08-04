// program counter 
module program_counter(clk,reset,PC_in,PC_out);
input clk,reset ;
input [31:0] PC_in ;
output  reg [31:0] PC_out ;

always @ (posedge clk or posedge reset)
 begin
    if(reset )
    PC_out <= 32'b0 ;
    else
    PC_out <= PC_in ;
 end
endmodule 

// this module will update pc value if branch instruction is not there 
module program_c_plus4(fromPC,nextPC);
 input [31:0]fromPC ;
 output [31:0]nextPC ;


assign nextPC = fromPC + 4 ;
endmodule