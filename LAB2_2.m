% y(n) = 1/3 [x(n) + x(n −1) + x(n − 2)] + 0.95y(n −1) − 0.9025y(n − 2)

%{
filter function assumes zero initial conditions but we can simulate 
non zero conditions using the filtic() function.
filtic(yeqn,xeqn,ypast,xpast) is the syntax.
%}

a = [1 -0.95 0.9025]; % y coeffs all one side 
b = [1 1 1]/3; % x coeffs
yi = [-2 -3]; % Initial conditions of y
xi = [1 1]; % Initial conditions of x
ic = filtic(b,a,yi,xi); % converts past input xi and past output yi into
% initial conditions which is required for the computation of output
n = 0:100;
u = [n>=0];
display(n);
x = 3*cos(n*pi/3).*u; % input signal 
y = filter(b,a,x,ic); % o/p signal
subplot(211), plot(n,x); title('input signal')
subplot(212), plot(n,y); title('output signal')