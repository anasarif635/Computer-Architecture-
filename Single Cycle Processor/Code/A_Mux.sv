// ALU Input A Mux
module A_Mux ( pc_out, reg_data1, sel_a, a_mux_out );
input logic [31:0] pc_out;
input logic [31:0] reg_data1;
input logic sel_a;
output logic [31:0] a_mux_out;
always_comb
begin
        if ( sel_a ) begin
        a_mux_out = reg_data1;
        end
        else begin
        a_mux_out = pc_out;
        end
end
endmodule