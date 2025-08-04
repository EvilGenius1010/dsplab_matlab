%function is y[𝑛] − 0.6𝑦[𝑛 – 1] − 0.16𝑦[𝑛– 2] = 5𝑥[𝑛].

a=[1,-0.6,-0.16]; % y coefficients
b=[5,0,0]; % x coefficients
N=16; % length
x=[1,zeros(1,N-1)]; 
h=filter(b,a,x); % xcoeffs, ycoeffs, input
n=0:N-1;
stem(n,h);
title('unit impulse response');
