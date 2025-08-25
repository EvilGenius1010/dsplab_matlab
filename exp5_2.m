wp = 0.5; ws = 0.3; % normalized frequencies (in pi units) 
N = ceil(8/(wp-ws)); % estimate the order of the filter
win = hanning(N+1); % Hanning window used to get 44 dB attenuation
wc = (wp+ws)/2; % wc taken as average of wp and ws
b = fir1(N,wc,"high",win); % obtain numerator coefficients
[h w] = freqz(b,1); % frequency response in z-domain
plot((w/pi),20*log10(abs(h))); grid on;
title('FIR HPF using Hanning window'); 
ylabel('Gain in dB'); xlabel('Normalized freq in pi units');
