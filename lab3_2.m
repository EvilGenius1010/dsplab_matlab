f = 50; Fs = 1000;
t = 0:(1/Fs):(20/f); % 20 cycles of input
x = sin(2*pi*f*t); 
X = fft(x,256); % 256-point DFT
subplot(211); stem(abs(X)); 
ylabel('Magnitude'); title('DFT');
subplot(212); stem(angle(X)); 
ylabel('Phase'); xlabel('Samples --->')
L = length(X)/2; % take half of the samples (0 to pi radians)
f = (0:(L-1))/L*(Fs/2); % convert sample numbers into frequency in Hz
figure; subplot(211); plot(f,abs(X(1:L))); 
ylabel('Magnitude'); title('DTFT');
subplot(212); plot(f,angle(X(1:L))); 
ylabel('Phase'); xlabel('Frequency in hertz');