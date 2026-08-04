//
module mux1(sel1,a1,b1,mux1_out);
input sel1 ;
input [31:0]a1,b1 ;
output [31:0]mux1_out ;

assign mux1_out = (sel1)? b1 :a1 ;
endmodule

module mux2(sel2,a2,b2,mux2_out);
input sel2 ;
input [31:0]a2,b2 ;
output [31:0]mux2_out ;

assign mux2_out = (sel2)? b2 :a2 ;
endmodule

module mux3(sel3,a3,b3,mux3_out);
input sel3 ;
input [31:0]a3,b3 ;
output [31:0]mux3_out ;

assign mux3_out = (sel3)? b3 :a3 ;
endmodule