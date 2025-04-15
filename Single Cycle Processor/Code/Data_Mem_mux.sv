// Data Memory Multiplexer
module Data_Mem_mux ( jump_data_mem_in, alu_result, read_data, writeback_data, writeback_sel );
input logic  [ 31:0 ] jump_data_mem_in;
input logic  [ 31:0 ] alu_result;
input logic  [ 31:0 ] read_data;
input logic  [ 1:0  ] writeback_sel;
output logic [ 31:0 ] writeback_data;
always_comb
begin
        case ( writeback_sel )
        2'b00: writeback_data = alu_result; 
        2'b01: writeback_data = read_data;
        2'b10: writeback_data = jump_data_mem_in;
        default: writeback_data = alu_result;
        endcase
end
endmodule