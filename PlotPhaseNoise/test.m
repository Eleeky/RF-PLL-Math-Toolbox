
% [t_value sig] = textread('OUT_SP.dat'); % uncomment this sentence to read-in signal from file

[mag, angle] = PlotPhaseNoise(sig, 1e10, 1, 100e6, -160, -20);

plot(20*log10(mag));
ylim([-100, 50]); % since we have removed DC of signal, the fft plot will give you an extremely
                  % small number on mag(1). Remember to take care of it.
