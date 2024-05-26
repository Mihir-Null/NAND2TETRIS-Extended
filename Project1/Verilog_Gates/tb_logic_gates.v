module tb_logic_gates;
  // Declare variables for inputs and outputs
  reg a, b, sel;
  wire y_not, y_and, y_or, y_xor, y_mux, y_dmux0, y_dmux1;

  // Instantiate the modules
  not_gate u_not (.y(y_not), .a(a));
  and_gate u_and (.y(y_and), .a(a), .b(b));
  or_gate u_or (.y(y_or), .a(a), .b(b));
  xor_gate u_xor (.y(y_xor), .a(a), .b(b));
  mux_2to1 u_mux (.y(y_mux), .a(a), .b(b), .sel(sel));
  demux_1to2 u_dmux (.y0(y_dmux0), .y1(y_dmux1), .a(a), .sel(sel));

  // Test vectors
  initial begin
    $display("Testing basic logic gates, MUX, and DEMUX");
    $display("a b sel | NOT AND OR XOR MUX DMUX0 DMUX1");

    a = 0; b = 0; sel = 0; #10 display_results();
    a = 0; b = 1; sel = 0; #10 display_results();
    a = 1; b = 0; sel = 0; #10 display_results();
    a = 1; b = 1; sel = 0; #10 display_results();
    a = 0; b = 0; sel = 1; #10 display_results();
    a = 0; b = 1; sel = 1; #10 display_results();
    a = 1; b = 0; sel = 1; #10 display_results();
    a = 1; b = 1; sel = 1; #10 display_results();

    $finish;
  end

  // Task to display the results
  task display_results;
    $display("%b %b  %b  |  %b   %b   %b  %b   %b   %b     %b", a, b, sel, y_not, y_and, y_or, y_xor, y_mux, y_dmux0, y_dmux1);
  endtask
endmodule