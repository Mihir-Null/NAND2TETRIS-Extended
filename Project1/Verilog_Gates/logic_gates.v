module nand_gate (output y, input a, b);
  assign y = ~(a & b);
endmodule

module not_gate (output y, input a);
  nand_gate nand1 (y, a, a);
endmodule

module and_gate (output y, input a, b);
  nand_gate nand1 (nand1_out, a, b);
  not_gate not1 (y, nand1_out);
endmodule

module or_gate (output y, input a, b);
  not_gate not1 (not1_out, a);
  not_gate not2 (not2_out, b);
  nand_gate nand1 (nand1_out, not1_out, not2_out);
  not_gate not3 (y, nand1_out);
endmodule

module xor_gate (output y, input a, b);
  nand_gate nand1 (nand1_out, a, b);
  or_gate or1 (or1_out, a, b);
  and_gate and1 (y, nand1_out, or1_out);
endmodule

module mux_2to1 (output y, input a, b, sel);
  not_gate not1 (not_sel, sel);
  and_gate and1 (a_out, a, not_sel);
  and_gate and2 (b_out, b, sel);
  or_gate or1 (y, a_out, b_out);
endmodule

module demux_1to2 (output y0, y1, input a, sel);
  not_gate not1 (not_sel, sel);
  and_gate and1 (y0, a, not_sel);
  and_gate and2 (y1, a, sel);
endmodule