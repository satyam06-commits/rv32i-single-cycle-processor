//
module top (clk,reset);
input clk, reset ; 
wire [31:0] PC_top,instrution_top,rd1_top,rd2_top,immext_top,mux1out_top,sum_out_top,PC_plus4_top,PC_in_top,alu_result_top,mem_dataout_top,mux3out_top;
wire regwrite_top,alusrc_top,branch_top,zero_top,and_out_top,memread_top,memwrite_top,memtoreg_top;
wire [1:0] aluop_top ;
wire [3:0] alucontrol_top ;

localparam ALU_AND = 4'b0000;
localparam ALU_OR  = 4'b0001;
localparam ALU_ADD = 4'b0010;
localparam ALU_SUB = 4'b0110;


// program counter 
program_counter PC (.clk(clk),.reset(reset),.PC_in(PC_in_top),.PC_out(PC_top));
// pc adder 
program_c_plus4 PC_adder(.fromPC(PC_top), .nextPC(PC_plus4_top));
// intruction memory 
instruction_memory Inst_memory( .read_address(PC_top) , .instruction_out(instrution_top));
// register file 
registers   reg_file(.clk(clk),.reset(reset),.regwrite(regwrite_top),.rr1(instrution_top[19:15]),.rr2(instrution_top[24:20]),.wr(instrution_top[11:7]),.wd(mux3out_top),.rd1(rd1_top),.rd2(rd2_top));
// immediate generator 
imm_gen imm_gen(.opcode(instrution_top[6:0]),.instruction(instrution_top[31:0]),.immext(immext_top) );
// control unit 
control  control_unit(.instruction(instrution_top[6:0]),.branch(branch_top),.memread(memread_top),.memtoreg(memtoreg_top),.aluop(aluop_top),.memwrite(memwrite_top),.alusrc(alusrc_top),.regwrite(regwrite_top));
// alu control 
alu_control alu_control(.aluop(aluop_top),.fun7(instrution_top[30]),.fun3(instrution_top[14:12]),.control_out(alucontrol_top) );
// alu 
alu_unit alu_unit(.a(rd1_top),.b(mux1out_top),.control_in(alucontrol_top),.alu_result(alu_result_top),.zero(zero_top)) ;
// alu_multiplexer 
mux1  mux_alu(.sel1(alusrc_top),.a1(rd2_top),.b1(immext_top),.mux1_out(mux1out_top));
// adder 
adder adder(.in_1(PC_top),.in_2(immext_top),.sum_out(sum_out_top));
// and gate 
and_logic and_logic(.branch(branch_top),.zero(zero_top),.and_out(and_out_top));
// adder mux 
mux2  mux_adder(.sel2(and_out_top),.a2(PC_plus4_top),.b2(sum_out_top),.mux2_out(PC_in_top));
// datamemory 
data_memory data_memory(.clk(clk),.reset(reset), .memwrite(memwrite_top),.memread(memread_top),.read_address(alu_result_top),.rd2(rd2_top) ,.mem_dataout(mem_dataout_top));
// memory mux
mux3  memory_mux(.sel3(memtoreg_top),.a3(alu_result_top),.b3(mem_dataout_top),.mux3_out(mux3out_top)); // mux3_out is connected to write data in register file 

endmodule