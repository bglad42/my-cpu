onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /singleCycle_testbench/ClockDelay
add wave -noupdate /singleCycle_testbench/clk
add wave -noupdate /singleCycle_testbench/reset
add wave -noupdate /singleCycle_testbench/i
add wave -noupdate /singleCycle_testbench/dut/reggie/dat
add wave -noupdate /singleCycle_testbench/dut/dataMemory/mem
add wave -noupdate -group {Regfile diagnostics} /singleCycle_testbench/dut/reggie/RegWrite
add wave -noupdate -group {Regfile diagnostics} /singleCycle_testbench/dut/reggie/ReadData2
add wave -noupdate -group {Regfile diagnostics} /singleCycle_testbench/dut/reggie/ReadData1
add wave -noupdate -group {ALU Diagnostics} /singleCycle_testbench/dut/ALU/A
add wave -noupdate -group {ALU Diagnostics} /singleCycle_testbench/dut/ALU/B
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/ALUOp
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/ALUSrc
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/BrTaken
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/MemToReg
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/MemWrite
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/OpCodes
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/Reg2Loc
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/RegWrite
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/UncondBr
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/instr
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/negative
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/overflow
add wave -noupdate -group Controls /singleCycle_testbench/dut/broisthethinker/zero
add wave -noupdate -label PC /singleCycle_testbench/dut/current/q
add wave -noupdate -group {zero flag} /singleCycle_testbench/dut/zeroFlag/q
add wave -noupdate -group {zero flag} /singleCycle_testbench/dut/zeroFlag/d
add wave -noupdate -group {zero flag} /singleCycle_testbench/dut/zeroFlag/reset
add wave -noupdate -group {zero flag} /singleCycle_testbench/dut/zeroFlag/clk
add wave -noupdate -group {overflow Flag} /singleCycle_testbench/dut/overflowFlag/q
add wave -noupdate -group {overflow Flag} /singleCycle_testbench/dut/overflowFlag/d
add wave -noupdate -group {carryout flag} /singleCycle_testbench/dut/carryoutFlag/q
add wave -noupdate -group {carryout flag} /singleCycle_testbench/dut/carryoutFlag/d
add wave -noupdate -group {negative flag} /singleCycle_testbench/dut/negativeFlag/q
add wave -noupdate -group {negative flag} /singleCycle_testbench/dut/negativeFlag/d
add wave -noupdate /singleCycle_testbench/dut/instr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108074 ps} 0}
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
WaveRestoreZoom {52098 ps} {225774 ps}
