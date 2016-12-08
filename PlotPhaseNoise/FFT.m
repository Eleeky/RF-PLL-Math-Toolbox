[t v]=textread('OUT_SP.dat');
% [t v]=textread('G:\Nan_PLL\spectrum\I40.dat');
%/usrtmp/lst13/simulation/BBPLL_INT_SIM_KING/spectre/schematic/netlist/I36.dat');
%/usrtmp/lst13/simulation/BBCP_FRAC_MASH3_PH16_SIM_BARON/spectre/schematic/netlist/I36.dat');
%/home/lst13/matlab/BBPLL_spetrum/usrtmp/lst13/simulation/BBCP_FRAC_SLDSM3_PH16_DLY_SIM_QUEEN/spectre/schematic/netlist/I149.dat');/COMP_INTFRAC_MULPH_0414/INT_new.dat');
%/home/lst13/matlab/BBPLL_spetrum/COMP_MULTIPHASE_MASH2_3_SLDSM3_0410/MASH3_PH16.dat');
%/usrtmp/lst13/simulation/BBPLL_FRAC_SLDSM3_PH16_SIM_QUEEN/spectre/schematic/netlist/I36.dat');
%/usrtmp/lst13/simulation/BBPLL_FRAC_MASH3_PH16_SIM_QUEEN/spectre/schematic/netlist/I36.dat');
%/home/lst13/matlab/BBPLL_spetrum/COMP_MULTIPHASE_MASH2_0406/MASH2_PH16_new.dat');
%/usrtmp/lst13/simulation/BBPLL_FRAC_SIM_QUEEN/spectre/schematic/netlist/I36.dat');
%/home/lst13/matlab/BBPLL_spetrum/COMP_FIR/SLDSM2_FIR8.dat');
%home/lst13/matlab/BBPLL_spetrum/COMP_DSMMODS/SLDSM2.dat
N=length(v);
initial_time=10e-6;
end_time=t(N);
sampling_time=1e-10;
n=fix(initial_time/sampling_time);
vx=zeros(N-n+1,1);
tx=zeros(N-n+1,1);
Nx=length(vx);
for i=1:(N-n+1);
    vx(i)=v(n-1+i);
end
for i=1:(N-n+1);
    tx(i)=t(n-1+i);
end
   
vx=vx.*kaiser(Nx,20);
k=fft(vx);
h=abs(k)/length(k);
b=max(h);
V=20*log10(h/b);

%V = filter(ones(1, 20)/20, 1, V); %filter the spur

f=(tx-initial_time)/(end_time-initial_time)/sampling_time; 
 ftargt=1.6e8;
 figure(4);
plot(f,V+2.2,'r');
axis([800e6 912.5e6 -100 0]);
xlabel('Hz');
ylabel('POWER SPECTRAL DENSITY(dBc/Hz)');grid on;
hold on;
