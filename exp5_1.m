wp = 0.2; ws = 0.4; % normalized frequencies (in pi units) 
N = ceil(8/(ws-wp)); % estimate the filter order
win = hamming(N+1); % Hamming window used to get 53 dB attenuation
wc = (wp+ws)/2; % wc taken as average of wp and ws
b = fir1(N,wc,"low",win); % obtain numerator coefficients
[h w] = freqz(b,1); % frequency response in z-domain. Note: a = 1
plot((w/pi),20*log10(abs(h))); grid on;
title('FIR filter using Hamming window'); 
ylabel('Gain in dB'); xlabel('Normalized freq in pi units');