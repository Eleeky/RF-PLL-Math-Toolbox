function [ fft_in_mag fft_in_angle ] = PlotPhaseNoise( signal, Fs, ...
    freq_start, freq_stop, log_mag_start, log_mag_stop )
%PLOTPHASENOISE Plots phase noise result of the input signal
%   signal: time-domain signal input; Fs: sampling frequency;
%   freq_start/freq_stop: start and stop frequency of log plot;
%   log_mag_start/log_mag_stop: start and stop log-magnitude of log plot;
%   freq_center: center frequency (carrier) of the input signal

fprintf('====== ZHANG YINING TOOLBOX V1 ======\n==>starting calculation\n');
signal = signal - mean(signal);
fft_result = fft(signal);

[dat I] = max(abs(fft(signal)));

fprintf('==>auto-searched carrier power: %f\n', dat / length(signal));

% compute x_axis value
x_value = Fs/length(signal) : Fs/length(signal) : Fs;
x_value = x_value - I / length(signal);

fprintf('==>auto-searched carrier frequency: %f\n', I / length(signal));

fft_result = fft_result / sqrt(length(signal));

semilogx(x_value, 20*log10(abs(fft_result )) - 20*log10(abs(fft_result(I))) ...
                  - 10*log10(Fs/length(signal)));
                  
xlabel('Frequency');
ylabel('Phase Noise dBc/Hz');

axis([freq_start, freq_stop, log_mag_start, log_mag_stop]);

fft_in_mag = abs(fft_result);
fft_in_angle = angle(fft_result);

end

