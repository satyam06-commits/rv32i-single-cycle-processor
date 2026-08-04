//
// module registers(clk,reset,regwrite,rr1,rr2,wr,wd,rd1,rd2);


//  // regwrite - ONE BIT CONTROL UNIT WHICH TELLS WHETHER TO WRITE DATA FROM MEMORY
//  // RR1,RR2 -- read registers which contain address of register from where to take data 
//  // wr -write register , contain address of register in which wehave to write data .
//  // wd - the data which we want to write from memory .
// // rd1,rd2 - read data , which contain data to supply further to alu 

// input clk,reset,regwrite ;
// input [4:0] rr1,rr2,wr ;
// input [31:0] wd ;
// output [31:0] rd1,rd2 ;
// parameter XLEN = 32;
// parameter REG_DEPTH = 32;

// reg [XLEN-1:0] REGISTERS [0:REG_DEPTH-1];
//  initial begin 
//      REGISTERS[0] = 0 ;
//      REGISTERS[1] = 4 ;
//      REGISTERS[2] = 2 ;
//      REGISTERS[3] = 24 ;
//      REGISTERS[4] = 4 ;
//      REGISTERS[5] = 1 ;
//      REGISTERS[6] = 44 ;
//      REGISTERS[7] = 4 ;
//      REGISTERS[8] = 2 ;
//      REGISTERS[9] = 1 ;
//      REGISTERS[10] = 23 ;
//      REGISTERS[11] = 4 ;
//      REGISTERS[12] = 90 ;
//      REGISTERS[13] = 10 ;
//      REGISTERS[14] = 20 ;
//      REGISTERS[15] = 30 ;
//      REGISTERS[16] = 40 ;
//      REGISTERS[17] = 50 ;
//      REGISTERS[18] = 60 ;
//      REGISTERS[19] = 70 ;
//      REGISTERS[20] = 80 ;
//      REGISTERS[21] = 80 ;
//      REGISTERS[22] = 90 ;
//      REGISTERS[23] = 70 ;
//      REGISTERS[24] = 60 ;
//      REGISTERS[25] = 65 ;
//      REGISTERS[26] = 4 ;
//      REGISTERS[27] = 32 ;
//      REGISTERS[28] = 12 ;
//      REGISTERS[29] = 34 ;
//      REGISTERS[30] = 5 ;
//      REGISTERS[31] = 10 ;  
//  end
//  integer k ;
//  always@(posedge clk or posedge reset ) 
//  begin
//      if( reset ) begin
//         for (k = 0; k < REG_DEPTH; k = k + 1)
//             REGISTERS[k] <= 32'b0;
//     end
      
//       else  if(regwrite && wr != 0 ) begin
//           REGISTERS[wr] <= wd ;
//       end
     
//  end
//  assign rd1 = REGISTERS[rr1] ;
//  assign rd2 = REGISTERS[rr2] ;
// endmodule




//  this is for simulation only 
module registers (
    clk,
    reset ,
    regwrite,
    rr1,
    rr2,
    wr,
    wd,
    rd1,
    rd2
);

input clk , reset;
input regwrite;
input [4:0] rr1, rr2, wr;
input [31:0] wd;

output [31:0] rd1, rd2;

parameter XLEN = 32;
parameter REG_DEPTH = 32;

reg [XLEN-1:0] REGISTERS [0:REG_DEPTH-1];

//------------------------------------------------------------
// Register Initialization (Simulation Only)
//------------------------------------------------------------
integer i;

initial begin
    for (i = 0; i < REG_DEPTH; i = i + 1)
        REGISTERS[i] = 32'd0;

    REGISTERS[1]  = 32'd4;
    REGISTERS[2]  = 32'd2;
    REGISTERS[3]  = 32'd24;
    REGISTERS[4]  = 32'd4;
    REGISTERS[5]  = 32'd1;
    REGISTERS[6]  = 32'd44;
    REGISTERS[7]  = 32'd4;
    REGISTERS[8]  = 32'd2;
    REGISTERS[9]  = 32'd1;
    REGISTERS[10] = 32'd23;
    REGISTERS[11] = 32'd4;
    REGISTERS[12] = 32'd90;
    REGISTERS[13] = 32'd10;
    REGISTERS[14] = 32'd20;
    REGISTERS[15] = 32'd30;
    REGISTERS[16] = 32'd40;
    REGISTERS[17] = 32'd50;
    REGISTERS[18] = 32'd60;
    REGISTERS[19] = 32'd70;
    REGISTERS[20] = 32'd80;
    REGISTERS[21] = 32'd80;
    REGISTERS[22] = 32'd90;
    REGISTERS[23] = 32'd70;
    REGISTERS[24] = 32'd60;
    REGISTERS[25] = 32'd65;
    REGISTERS[26] = 32'd4;
    REGISTERS[27] = 32'd32;
    REGISTERS[28] = 32'd12;
    REGISTERS[29] = 32'd34;
    REGISTERS[30] = 32'd5;
    REGISTERS[31] = 32'd10;
end

//------------------------------------------------------------
// Synchronous Write Port
//------------------------------------------------------------
always @(posedge clk) begin
    if (regwrite && (wr != 5'd0))
        REGISTERS[wr] <= wd;
end

//------------------------------------------------------------
// Asynchronous Read Ports
//------------------------------------------------------------
assign rd1 = REGISTERS[rr1];
assign rd2 = REGISTERS[rr2];

endmodule