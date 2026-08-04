//

module data_memory (clk,reset, memwrite,memread,read_address,rd2,mem_dataout);
    input clk,reset,memwrite,memread ;
    input [31:0] read_address,rd2;
    output [31:0]  mem_dataout ;
 integer k;

 reg [31:0] d_memory[63:0] ;
 always @(posedge clk or posedge reset)
 begin
    if(reset) begin
        for (k =0 ; k<64;k= k+1 ) begin
            d_memory[k] <= 32'b00 ;
        end
    end
   else if (memwrite) begin
         d_memory[read_address[31:2]] <= rd2 ;
   end
 end
   assign mem_dataout = (memread) ? d_memory[read_address[31:2]] : 32'b00 ;

endmodule