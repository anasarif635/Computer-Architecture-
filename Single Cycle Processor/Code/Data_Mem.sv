// Data Memory
module Data_Mem ( clk, reset, write_enable, read_enable, addr_in, write_data, read_data_out );
input  logic clk, reset, write_enable, read_enable;
input  logic [31:0] addr_in, write_data;
output logic [31:0] read_data_out;
integer k;
logic [31:0] data_memory [31:0];
always @(posedge clk)
begin
        if ( reset ) begin
        for ( k=0; k<32; k=k+1 ) begin
                data_memory[k] <= 32'h00000000;
        end      
        end
        else if ( write_enable && addr_in != 32'h0 ) begin
        data_memory[addr_in] <= write_data;
        end
end
always_comb
begin
        if ( read_enable ) begin
        read_data_out = data_memory[addr_in];
        end
        else begin
        read_data_out = 32'h00000000;
        end
end
endmodule