onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipelined_testbench/clk
add wave -noupdate /pipelined_testbench/reset
add wave -noupdate /pipelined_testbench/i
add wave -noupdate /pipelined_testbench/dut/reggie/dat
add wave -noupdate -group {ID (Reg/Decode/controls)} /pipelined_testbench/dut/reggie/clk
add wave -noupdate -group {ID (Reg/Decode/controls)} /pipelined_testbench/dut/reggie/dat
add wave -noupdate -group {EX stage / ALU} /pipelined_testbench/dut/ALUResult
add wave -noupdate -group {EX stage / ALU} /pipelined_testbench/dut/ALU_Bin
add wave -noupdate -group {EX stage / ALU} /pipelined_testbench/dut/Da_EX
add wave -noupdate -group {WR Stage} /pipelined_testbench/dut/WriteData_WR
add wave -noupdate /pipelined_testbench/dut/RegWrite
add wave -noupdate /pipelined_testbench/dut/RegWrite_EX
add wave -noupdate /pipelined_testbench/dut/RegWrite_MEM
add wave -noupdate /pipelined_testbench/dut/RegWrite_WR
add wave -noupdate /pipelined_testbench/dut/reggie/WriteData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {44470144 ps} 0}
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
WaveRestoreZoom {0 ps} {133218750 ps}
