make SIM=verilator

rm -rf sim_build __pycache__ results.xml

if [ -f "dump.fst" ]; then
    gtkwave dump.fst
fi