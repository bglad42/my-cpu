onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_testbench/clk
add wave -noupdate /pipelined_testbench/reset
add wave -noupdate /pipelined_testbench/i
add wave -noupdate /pipelined_testbench/dut/reggie/dat
add wave -noupdate /pipelined_testbench/dut/Da
add wave -noupdate /pipelined_testbench/dut/Da_cntrl
add wave -noupdate /pipelined_testbench/dut/Da_EX
add wave -noupdate /pipelined_testbench/dut/Da_forward
add wave -noupdate /pipelined_testbench/dut/DAddr
add wave -noupdate /pipelined_testbench/dut/DAddr_EX
add wave -noupdate /pipelined_testbench/dut/Daddr_MEM
add wave -noupdate /pipelined_testbench/dut/Db
add wave -noupdate /pipelined_testbench/dut/Db_cntrl
add wave -noupdate /pipelined_testbench/dut/Db_EX
add wave -noupdate /pipelined_testbench/dut/Db_forward
add wave -noupdate /pipelined_testbench/dut/Db_MEM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22500000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {66609376 ps}
