function g = g(x,alpha,beta,lambda)                                         % calculate function g
    if x > 0                                                                % indicator function
        g = exp(-1*lambda*x)/(gamma(alpha)*beta^alpha);
    else
        g = 0;
    end
end