// PC + 4
module PCplus4 ( pc_in, pc_plus4_out );
input  logic [ 31:0 ] pc_in;
output logic [ 31:0 ] pc_plus4_out;
always_comb
begin
        pc_plus4_out = pc_in + 32'h4;
end
endmodule