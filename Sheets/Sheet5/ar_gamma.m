% construct acceptance rejection algorithm 14

function [x] = ar_gamma(alpha,beta,lambda)
y = 1; u = 2;                                                               % initialize random variables                                                            % optimal parameter lambda > 0, compare notes
c_g = 1/(gamma(alpha)*(beta^(alpha))*lambda);
while u > (f(y,alpha,beta)/g(y,alpha,beta,lambda))
    u1 = rand;
    y = -log(u1)/lambda;                                                    % generate random variable with distribution according to pseudo
                                                                            % density g via inversion method of exponential distribution
    u = rand;                                                               % generate independent uniformly distributed random variable
end
x = y;                                                                      % set values
end




