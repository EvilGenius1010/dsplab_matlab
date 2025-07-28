n=0:10;
u=[n>=0];
u5=[(n-5)>=0];
x=u-u5;
y=[1,2,3,4,5];
x_t=1:15;
z=conv(x,y); 
stem(x_t,z,'*g');
grid on;    
