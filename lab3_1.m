N=32; 
n=0:(N-1); 
w=n*2*pi/N;
x=(0.5).^n; 
X=fft(x);% compute Fourier transform of the signal
subplot(211); plot(w,abs(X)); ylabel('Magnitude'); title('DTFT of signals');
subplot(212); plot(w,angle(X)); 
ylabel('Phase angle'); xlabel('Frequency in radians ---->')
figure; subplot(211); stem(n,abs(X)); ylabel('Magnitude'); title('DFT');
subplot(212); stem(n,angle(X)); ylabel('Phase angle'); xlabel('Sample numbers ---->'); 
