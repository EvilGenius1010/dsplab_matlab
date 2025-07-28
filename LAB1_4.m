x=[3,11,7,0,-1,4,2]; % first sequence
nx=-3:3; % index for signal x
ny=nx+2; % index for signal x delayed by 2
w=randn(1,length(x)); % random sequence generation
y=x+w; % second sequence
ns=nx(1)+ny(1); % starting index
ne=nx(length(x))+ny(length(y)); % ending index
nz=ns:ne; % index for correlation output
z=xcorr(x,y); % cross correlation
stem(nz,z,'*r');
title('cross correlation');