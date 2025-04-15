// Program Counter
module PC ( clk, reset, branch_pc_in, pc_out );
input  logic clk, reset;
input  logic [ 31:0 ] branch_pc_in;
output logic [ 31:0 ] pc_out;
always_ff @( posedge clk )
begin
        if ( reset ) begin
        pc_out <= 32'b0;
        end
        else begin
        pc_out <= branch_pc_in; 
        end
end
endmodule