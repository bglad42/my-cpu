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
add wave -noupdate /pipelined_testbench/dut/dataMemory/mem
add wave -noupdate /pipelined_testbench/dut/RegWrite_WR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {645000000 ps} 0}
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
WaveRestoreZoom {0 ps} {1065750 ns}
