x0 = 0;  % initial value of x
y10 = 95;  % initial value of y
y20 = 5; % initial value of z
y30 = 0;
xf = 4;  % final value of x
h = 0.01;  % first value of step size
tol = 0.001;  % value of tolerance
i = 0;
 

     n = ceil((xf-x0)/h);  % number of elements
     h = (xf-x0)/n;       % step size such that the final value coincides with xf
     x = x0:h:xf;      % defining the array x
     [y1,y2,y3] = rk3(x0,y10,y20,y30,xf,h);
     figure(1)
     plot(x,y1);
     figure(2)
     plot(x,y2);
     figure(3)
     plot(x,y3);
     