function [u] = mcg(x0,n)

x = zeros(1,n);                                 % initialize vector
x(1) = mod((1771^2)*x0, 2^31-1);                % calculate starting value

for i = 2:n                                     % multiplicative congruential generator
    x(i) = mod((1771^2)*x(i-1), 2^31-1);
end
u = x/(2^31-1);                                 % calculate u values
end