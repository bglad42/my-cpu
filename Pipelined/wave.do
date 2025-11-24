onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_testbench/clk
add wave -noupdate /pipelined_testbench/reset
add wave -noupdate /pipelined_testbench/i
add wave -noupdate -radix decimal /pipelined_testbench/dut/reggie/dat
add wave -noupdate /pipelined_testbench/dut/instr
add wave -noupdate /pipelined_testbench/dut/instr_ID
add wave -noupdate -radix decimal /pipelined_testbench/dut/newpc
add wave -noupdate -radix decimal /pipelined_testbench/dut/pc
add wave -noupdate -radix decimal /pipelined_testbench/dut/branchPC
add wave -noupdate -radix decimal /pipelined_testbench/dut/Imm
add wave -noupdate -radix decimal /pipelined_testbench/dut/Imm_EX
add wave -noupdate /pipelined_testbench/dut/RegWrite_ID
add wave -noupdate /pipelined_testbench/dut/RegWrite_EX
add wave -noupdate /pipelined_testbench/dut/RegWrite_WR
add wave -noupdate -radix decimal /pipelined_testbench/dut/ALU/A
add wave -noupdate -radix decimal /pipelined_testbench/dut/ALU/B
add wave -noupdate -radix decimal /pipelined_testbench/dut/ALU_Bin
add wave -noupdate -radix decimal /pipelined_testbench/dut/Imm_EX
add wave -noupdate /pipelined_testbench/dut/ALUSrc_EX
add wave -noupdate /pipelined_testbench/dut/ALUSrc
add wave -noupdate /pipelined_testbench/dut/ALUResult_EX
add wave -noupdate /pipelined_testbench/dut/ALUResult_MEM
add wave -noupdate /pipelined_testbench/dut/WriteData_WR
add wave -noupdate /pipelined_testbench/dut/ALU/finout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7742016 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 151
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 300
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {33796876 ps}
