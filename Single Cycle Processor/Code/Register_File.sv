// Register File
module Register_File ( clk, reset, reg_write, read_addr1, read_addr2, write_addr, writeback_data, read_data1, read_data2 );
input logic clk, reset, reg_write;
input logic  [4:0] read_addr1, read_addr2, write_addr;
input logic  [31:0] writeback_data;
output logic [31:0] read_data1, read_data2;
integer k;
logic [31:0] register_memory [31:0];
always_comb
begin
        read_data1 = register_memory[read_addr1];
        read_data2 = register_memory[read_addr2];
end
always_ff @( posedge clk ) begin
        if ( reset ) begin
                for ( k=0; k<32; k=k+1 ) begin
                register_memory[k] <= 32'h00000000;
                end
        end
        else if ( reg_write && write_addr != 5'b0 ) begin
                register_memory[write_addr] <= writeback_data;
        end
end
endmodule