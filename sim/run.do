vlib work
vlog *.v
vsim -voptargs=+acc work.tb_CPU.v
do wave.do
run -all
wave zoomfull