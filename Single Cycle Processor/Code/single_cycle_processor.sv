module single_cycle_processor (
    input logic clk,
    input logic reset
);
    // Internal signals
    logic [31:0]  pc_out, reg_data1, reg_data2, instruction, writeback_data, alu_result, imm_out, b_mux_out, data_mem_out, branch_pc_out, a_mux_out, pc_plus4_out, jump_data_mem_in;
    logic [3:0]   alu_op;
    logic [2:0]   branch_type;
    logic [1:0]   writeback_sel;
    logic reg_write, sel_b, read_enable, write_enable, branch_taken, sel_a;

    PC pc (
        .clk(clk),
        .reset(reset),
        .branch_pc_in(branch_pc_out),
        .pc_out(pc_out)
    );

    Instruction_Memory instruction_memory (
        .addr_in(pc_out), 
        .instruction_out(instruction)
    );

    Register_File register_file (
        .clk(clk),
        .reset(reset),
        .read_addr1(instruction[19:15]),
        .read_addr2(instruction[24:20]),
        .write_addr(instruction[11:7]),
        .writeback_data(writeback_data),
        .reg_write(reg_write),
        .read_data1(reg_data1),
        .read_data2(reg_data2)
    );

    Immediate_Gen imm_gen (
        .instruction_in(instruction),
        .immediate_out(imm_out)
    );

    B_Mux b_mux(
        .immediate_out(imm_out),
        .rdata2(reg_data2),
        .sel_B(sel_b),
        .B_Mux_out(b_mux_out)
    );

    Controller controller(
        .Inst(instruction),
        .reg_wr(reg_write),
        .sel_B(sel_b),
        .alu_op(alu_op),
        .rd_en(read_enable),
        .wr_en(write_enable),
        .wb_sel(writeback_sel),
        .sel_A(sel_a),
        .br_type(branch_type)
    );

    ALU alu(
        .A_Mux_out(a_mux_out),
        .B_Mux_out(b_mux_out),
        .alu_op(alu_op),
        .ALU_result(alu_result)
    );

    Data_Mem data_mem (
        .addr(alu_result),
        .wdata(reg_data2),
        .clk(clk),
        .reset(reset),
        .wr_en(write_enable),
        .rd_en(read_enable),
        .rdata(data_mem_out)
    );

    Data_Mem_mux data_mem_mux(
        .rdata(data_mem_out),
        .wb_sel(writeback_sel),
        .ALU_result(alu_result),
        .jump_dm_in(jump_data_mem_in),
        .wb_data(writeback_data)
    );

    Branch_Cond branch_cond(
        .rdata1(reg_data1),
        .rdata2(reg_data2),
        .br_type(branch_type),
        .br_taken(branch_taken)
    );

    BC_PC_Mux bc_pc_mux(
        .PCplus4_out(pc_plus4_out),
        .ALU_result(alu_result),
        .bc_pc_out(branch_pc_out),
        .br_taken(branch_taken)
    );

    A_Mux a_mux(
        .PC_out(pc_out),
        .rdata1(reg_data1),
        .sel_A(sel_a),
        .A_Mux_out(a_mux_out)
    );

    PCplus4 pcplus4(
        .pc_in(pc_out),
        .pc_plus4_out(pc_plus4_out)
    );

    Data_Mem_PCplus4 data_mem_pcplus4(
        .PC_out(pc_out),
        .jump_dm_in(jump_data_mem_in)
    );
endmodule