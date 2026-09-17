onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {CLK & RST}
add wave -noupdate -color Magenta /tb_cpu/UUT/clk
add wave -noupdate -color Cyan /tb_cpu/UUT/reset
add wave -noupdate -divider {Instruction Fetch}
add wave -noupdate /tb_cpu/UUT/pc_out
add wave -noupdate /tb_cpu/UUT/instruction
add wave -noupdate /tb_cpu/UUT/opcode
add wave -noupdate /tb_cpu/UUT/address
add wave -noupdate -divider {Datapath & RAM}
add wave -noupdate -color {Orange Red} /tb_cpu/UUT/acc_out
add wave -noupdate /tb_cpu/UUT/alu_result
add wave -noupdate /tb_cpu/UUT/memory_data_out
add wave -noupdate -divider Flags
add wave -noupdate -expand -group Flags -color Yellow /tb_cpu/UUT/flag_Z
add wave -noupdate -expand -group Flags /tb_cpu/UUT/flag_C
add wave -noupdate -expand -group Flags /tb_cpu/UUT/flag_N
add wave -noupdate -divider {Control signals}
add wave -noupdate -expand -group {Control Signals } /tb_cpu/UUT/pc_inc
add wave -noupdate -expand -group {Control Signals } /tb_cpu/UUT/pc_load
add wave -noupdate -expand -group {Control Signals } /tb_cpu/UUT/acc_load
add wave -noupdate -expand -group {Control Signals } /tb_cpu/UUT/mem_write
add wave -noupdate -expand -group {Control Signals } /tb_cpu/UUT/alu_op
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {262500 ps}
