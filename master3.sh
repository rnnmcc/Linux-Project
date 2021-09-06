#!/bin/bash

# run bash script that modifies lorenz_x.py
./modlorenz.sh

# run qsub script that generates the data
qsub lorenz.qsub

# hold on until the first job is done, then run qsub script that creates the plot
qsub -hold_jid lorenz ./plot.qsub

exit 0

