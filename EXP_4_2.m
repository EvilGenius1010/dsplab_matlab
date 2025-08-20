fp = 100; wp = 2*pi*fp; % frequency in radians/sec
fs = 500; ws = 2*pi*fs;
rp = 1; rs = 40; 
[N,wc] = buttord(wp,ws,rp,rs,'s') % obtain order and cut-off frequency
[b,a] = butter(N,wc,'s'); % obtain num and den coefficients
[h,w] = freqs(b,a); % obtain frequency response in s-domain
f = w/(2*pi); % convert frequency to Hz
semilogx(f,20*log10(abs(h))); 
grid on; title('Frequency response'); 
ylabel('Magnitude in dB'); xlabel('Frequency in Hz');