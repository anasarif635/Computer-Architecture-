// ALU
module ALU ( a_mux_out, b_mux_out, alu_op, alu_result );
input  logic [31:0]  a_mux_out, b_mux_out;
input  logic [3:0 ]  alu_op;
output logic [31:0]  alu_result;
always_comb
begin
        case (alu_op)
        4'd0    :alu_result = a_mux_out + b_mux_out;
        4'd1    :alu_result = a_mux_out - b_mux_out;
        4'd2    :alu_result = a_mux_out << b_mux_out;
        4'd3    :alu_result = ($signed   (a_mux_out)) < ( $signed(b_mux_out) );
        4'd4    :alu_result = ($unsigned (a_mux_out)) < ($unsigned(b_mux_out));
        4'd5    :alu_result = a_mux_out ^ b_mux_out; 
        4'd6    :alu_result = a_mux_out >>  b_mux_out[4:0];
        4'd7    :alu_result = a_mux_out >>> b_mux_out[4:0];
        4'd8    :alu_result = a_mux_out | b_mux_out;
        4'd9    :alu_result = a_mux_out & b_mux_out;
        4'd10   :alu_result = (a_mux_out < b_mux_out) ? 1:0 ;
        4'd11   :alu_result = ($unsigned(a_mux_out) < $unsigned(b_mux_out)) ? 1:0 ;
        4'd12   :alu_result = b_mux_out;
        default :alu_result = a_mux_out + b_mux_out;
        endcase
end
endmodule