// Instruction Memory
module Instruction_Memory ( addr_in, instruction_out );
input  logic [ 31:0 ] addr_in;
output logic [ 31:0 ] instruction_out;
integer k;
logic [ 31:0 ] instruction_memory_reg [31:0];
always_comb
begin
        instruction_out = instruction_memory_reg[addr_in >> 2];
end
initial
begin
        for ( k=0; k<32; k=k+1) begin
        instruction_memory_reg[k ] = 32'h00000000;
        end
        instruction_memory_reg[1 ] = 32'h123450b7;
        instruction_memory_reg[2 ] = 32'h12345117;
        instruction_memory_reg[3 ] = 32'h00a00113;
        instruction_memory_reg[4 ] = 32'h01400093;
        instruction_memory_reg[5 ] = 32'h0080006f;
        instruction_memory_reg[6 ] = 32'h01e00113;
        instruction_memory_reg[7 ] = 32'h001101b3;
        instruction_memory_reg[8 ] = 32'h003022a3;
        instruction_memory_reg[9 ] = 32'h00502303;
        instruction_memory_reg[10] = 32'h00008067;
        instruction_memory_reg[11] = 32'h00000013;
        instruction_memory_reg[12] = 32'h0;
        instruction_memory_reg[13] = 32'h0;
        instruction_memory_reg[14] = 32'h0;
        instruction_memory_reg[15] = 32'h0;
end
endmodule