
% [t_value sig] = textread('OUT_SP.dat');

PlotPhaseNoise(sig, 1e10, 8.1251234e8, 1, 100e6, -160, -20);

%%
signal = sig;
Fs = 1e10;
freq_center = 8.1251234e8;



fprintf('====== ZHANG YINING TOOLBOX V1 ======\n==>starting calculation\n');

fft_result = fft(signal);
carrier_power = abs(fft_result(round(freq_center/Fs*length(signal))))^2;

fprintf('==>normalized carrier power: %f\n', carrier_power / length(signal));

% compute x_axis value
x_value = Fs/length(signal) : Fs/length(signal) : Fs;
x_value = x_value - freq_center;

fft_result = fft_result / length(signal);

semilogx(x_value, 20*log10(abs(fft_result )) - 10*log10(carrier_power));
xlabel('Frequency');
ylabel('Phase Noise dBc/Hz');

axis([freq_start, freq_stop, log_mag_start, log_mag_stop]);