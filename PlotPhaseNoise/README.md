# Plotting phase noise and spectrum
This folder is for plotting the phase noise and spectrum of a time-sampled signal. Usually used in PLL calculations.

# File Description
## PlotPhaseNoise.m
The function to be used.
## plotPhaseNoise1.m / FFT.m
DONT USE THIS ONE, ONLY FOR REFERENCE! This file is taken from antique database to show the original calculation process we used.
## test.m
The testing script of PlotPhaseNoise.m
## OUT_PN.dat / OUT_SP.dat
PN is for the sampled periods, SP is for the sampled signal. In short, PN gives you a sequence of how much the period is for each cycle,
while SP directly gives you the sampled signal.

SP is sampled at 10GHz.
