%% defining the rk3 function
function [y1,y2,y3] = rk3(x0,y10,y20,y30,xf,h)
n = ceil((xf-x0)/h);  % number of elements
x = zeros(n,1);   % defining the x array
y1 = zeros(n,1);   % defining the y array
y2 = zeros(n,1);   % defining the z array
y3 = zeros(n,1);
% defining all the coefficients for RK3 method
a1=1/6;
a2=4/6;
a3=1/6;
p1=1/2;
p2=1;
q11=1/2;
q21=-1;
q22=2;

% defining the initial values of x,y,z and final value of x
x(1) = x0; 
y1(1) = y10;
y2(1) = y20;
y3(1) = y30;
x(n) = xf;
h = (xf-x0)/n;  % step size such that the final value coincides with xf

for i = 1:n  % this loop calculates x,y,z arrays using rk3 method

    k1 = f1(x(i),y1(i),y2(i),y3(i));
    l1 = f2(x(i),y1(i),y2(i),y3(i));
    m1 = f3(x(i),y1(i),y2(i),y3(i));
    k2 = f1(x(i)+p1*h,y1(i)+k1*q11*h,y2(i)+l1*q11*h,y3(i)+m1*q11*h);
    l2 = f2(x(i)+p1*h,y1(i)+k1*q11*h,y2(i)+l1*q11*h,y3(i)+m1*q11*h);
    m2 = f3(x(i)+p1*h,y1(i)+k1*q11*h,y2(i)+l1*q11*h,y3(i)+m1*q11*h);
    k3 = f1(x(i)+p2*h,y1(i)+k1*q21*h+k2*q22*h,y2(i)+l1*q21*h+l2*q22*h,y3(i)+m1*q21*h+m2*q22*h);
    l3 = f2(x(i)+p2*h,y1(i)+k1*q21*h+k2*q22*h,y2(i)+l1*q21*h+l2*q22*h,y3(i)+m1*q21*h+m2*q22*h);
    m3 = f3(x(i)+p2*h,y1(i)+k1*q21*h+k2*q22*h,y2(i)+l1*q21*h+l2*q22*h,y3(i)+m1*q21*h+m2*q22*h);
    
    phi1 = a1*k1+a2*k2+a3*k3;
    phi2 = a1*l1+a2*l2+a3*l3;
    phi3 = a1*m1+a2*m2+a3*m3;

    x(i+1) = x(i) + h;
    y1(i+1) = y1(i) + h*phi1;
    y2(i+1) = y2(i) + h*phi2;
    y3(i+1) = y3(i) + h*phi3;
end
return
end