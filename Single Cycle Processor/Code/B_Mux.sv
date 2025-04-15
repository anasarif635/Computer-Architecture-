// ALU Input B Mux
module B_Mux (reg_data2, imm_out, sel_b, b_mux_out);
input logic [31:0] reg_data2;
input logic [31:0] imm_out;
input logic sel_b;
output  logic [31:0] b_mux_out;
always_comb
begin
        if ( sel_b ) begin
        b_mux_out = imm_out;
        end
        else begin
        b_mux_out = reg_data2;
        end
end
endmodule