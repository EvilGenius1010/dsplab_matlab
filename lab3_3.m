x1 = [1 2 3 4 5 6 7 8]; 
x2 = [1 1 1 1]; 
N1 = length(x1); % length of the first sequence
N2 = length(x2); % length of the second sequence
N = max(N1,N2); % N is the maximum of N1 & N2
y = cconv(x1,x2,N); % direct computation of N-point circular convolution 
% DFT-IDFT method
X1 = fft(x1,N);
X2 = fft(x2,N);
Y = X1.*X2; % element by element multiplication of two DFTs
z = ifft(Y,N); % inverse DFT of the product gives circ. convolution
display(y); display(z);
% Linear convolution using the above method
yy = conv(x1,x2); % direct computation of linear convolution 
N = length(yy); % Length N = N1 + N2 - 1
X1 = fft(x1,N);
X2 = fft(x2,N);
Y = X1.*X2;

zz = ifft(Y,N); % Linear convolution using DFT-IDFT
display(yy); display(zz);
