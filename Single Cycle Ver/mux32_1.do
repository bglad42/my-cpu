onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mux32_1_testbench/dut/out
add wave -noupdate /mux32_1_testbench/dut/i
add wave -noupdate /mux32_1_testbench/dut/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 43
configure wave -valuecolwidth 219
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
WaveRestoreZoom {0 ps} {42 ps}
