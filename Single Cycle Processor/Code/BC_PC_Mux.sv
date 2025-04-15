// Branch Condition and Program Counter Multiplexer
module BC_PC_Mux (alu_result, pc_plus4_out, branch_taken, branch_pc_out);
input logic [31:0] alu_result;
input logic [31:0] pc_plus4_out;
input logic branch_taken;
output logic [31:0] branch_pc_out;
always_comb
begin
        if ( branch_taken ) begin
        branch_pc_out = alu_result;
        end
        else begin
        branch_pc_out = pc_plus4_out;
        end
end
endmodule