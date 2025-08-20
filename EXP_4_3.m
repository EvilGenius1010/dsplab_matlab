wp = 0.2*pi; ws = 0.3*pi;
rp = 1; rs = 15; 
[N wc] = buttord(wp,ws,rp,rs,'s') % Order and cutoff frequency of analog filter
[bs as] = butter(N,wc,'s'); % num and den coefficients in s-domain
[bz az] = impinvar(bs,as); % coefficients in z-domain using impulse invar (T=1)
[h w] = freqz(bz,az); % frequency response in z-domain
plot((w/pi),20*log10(abs(h))); grid on;
title('Frequency response'); ylabel('Magnitude in dB'); xlabel('Frequency in pi units');
