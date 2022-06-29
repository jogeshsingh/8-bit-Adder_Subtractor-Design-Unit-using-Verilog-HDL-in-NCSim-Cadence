/module name : D_FF ///



///module name : ADD/Sub///

`define WIDTH 8
module Add_Sub(i_a,i_b,i_cin,i_add_sub,sum_out,c_out);
input [`WIDTH-1:0]i_a,i_b;
input i_add_sub ;
input i_cin;
output [`WIDTH-1:0]sum_out;
output c_out;
wire c1,c2,c3,c4,c5,c6,c7;
wire g1 , g2 , g3,g4, g5,g6,g7, g8 ;


Xor X1(i_b[0], i_add_sub,g1);
Xor X2(i_b[1], i_add_sub,g2);
Xor X3(i_b[2], i_add_sub,g3);
Xor X4(i_b[3], i_add_sub,g4);
Xor X5(i_b[4], i_add_sub,g5);
Xor X6(i_b[5], i_add_sub,g6);
Xor X7(i_b[6], i_add_sub,g7);
Xor X8(i_b[7], i_add_sub,g8);




FA U1(i_a[0],g1,i_cin,sum_out[0],c1);
FA U2(i_a[1],g2, c1,sum_out[1],c2);
FA U3(i_a[2],g3,c2,sum_out[2],c3);
FA U4(i_a[3],g4,c3,sum_out[3],c4);
FA U5(i_a[4],g5,c4,sum_out[4],c5);
FA U6(i_a[5],g6,c5,sum_out[5],c6);
FA U7(i_a[6],g7,c6,sum_out[6],c7);
FA U8(i_a[7],g8,c7,sum_out[7],c_out);

endmodule


module FA(a_in,b_in,c_in,o_sum,o_cout);
input a_in,b_in,c_in;
output o_sum,o_cout;

assign o_sum = a_in^b_in^c_in;
assign o_cout = (a_in&b_in)|(b_in&c_in)|(a_in&c_in);
endmodule


module Xor(in_a,in_b, o_xor);
input in_a,in_b ;
output o_xor;

assign o_xor = in_a^in_b ;