T=textread('OUT_PN.dat');
% T=textread('C:\Users\uuuks\Desktop\osc_fir.dat');
%/usrtmp/lst13/simulation/BBCP_FRAC_MASH3_PH4_DLY_SIM_BARON/spectre/schematic/netlist/I59.dat');
%/usrtmp/lst13/simulation/BBCP_FRAC_MASH3_PH4_SIM_QUEEN_v2/spectre/schematic/netlist/I59.dat');
%/home/lst13/matlab/BBPLL_spetrum/COMP_DLY_0508/SLDSM3_PH16_INPUTPN_DLY_PN.dat');
%/usrtmp/lst13/simulation/BBCP_FRAC_SLDSM3_PH16_DLY_SIM_QUEEN/spectre/schematic/netlist/I149.dat');
%/home/lst13/Desktop/test/bbpfd/I72.dat');
%/usrtmp/lst13/simulation/BBPLL_INT_SIM_KING/spectre/schematic/netlist/I46.dat');
%/usrtmp/lst13/simulation/BBCP_FRAC_MASH3_PH16_SIM_BARON/spectre/schematic/netlist/I59.dat');
%/home/lst13/matlab/BBPLL_spetrum/COMP_BBCP_BW1M_0422/MASH3_PH1_PN.dat');
%/usrtmp/lst13/simulation/BBCP_FRAC_MASH3_PH16_SIM_KING/spectre/schematic/netlist/I59.dat');
F=1./T;
T_mean=mean(T);
DeltaT=T-T_mean;
%DeltaT = [T(:, 2) - T_mean(2)];
tj=cumsum(DeltaT);
tj=tj-mean(tj);
phi_e=tj*2*pi/T_mean;
nfft=length(phi_e);
Ffft=1/(nfft*T_mean);
ffft=0:Ffft:Ffft*(nfft-1);
w=hann(nfft);
%F_mean=mean(F);
PHI_E=fft(phi_e.*w)/sum(w);
% db=20*log10(abs(PHI_E));
% FFFT=ffft.';
% minusdb=-db;
% minusdbc=minusdb+10*log(FFFT);
% dbc=-minusdbc;
figure(2);
semilogx(ffft,20*log10(abs(PHI_E))-10*log10(1/T_mean/nfft),'r','LineWidth', 0.01);
% semilogx(ffft,20*log10(abs(PHI_E)),'r','LineWidth', 0.01);
% semilogx(ffft,dbc,'g');
xlabel('Frequency');
% ylabel('Phase Noise |FFT|^2 [dB]');
ylabel('Phase Noise [dBc/Hz]');
Xstick_pos=([0 0 0 0]);
%legend('VCO output');
axis([1e5 1e8 -160 -40]);
% grid on;
hold on;