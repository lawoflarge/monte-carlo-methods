function [u] = mcg2(z0,n)

z = zeros(1,n);                             % initialize vector
z(1) = mod(72*z0, 2^31-1);                  % calculate seed

for i = 2:n                                 % generate numbers
    z(i) = mod(72*z(i-1), 2^31-1);
end
u = z/(2^31-1);                             % calculate u values
end