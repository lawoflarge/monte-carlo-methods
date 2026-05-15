function [u] = cg(x0,y0,n)

x = zeros(1,n);                             % initialize x
y = zeros(1,n);                             % initialize y
x(1) = mod(1999*x0, 13^5);                  % calculate seeds
y(1) = mod(1871*y0, 1889);

for i = 2:n                                 % combined generator
    x(i) = mod(1999*x(i-1), 13^5);
    y(i) = mod(1871*y(i-1), 1889);
end
u = mod(x/13^3 + y/17^3 , 1);               % calculate u values
end