function f = f(x,alpha,beta)                                                % calculate function f
    if x > 0                                                                % indicator function
        f = x^(alpha-1)*exp(-x/beta)/(gamma(alpha)*beta^alpha);
    else
        f = 0;
    end
end