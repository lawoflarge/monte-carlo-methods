% 1 (b)
function x = loggamma(alpha,beta,c)                                         % define loggamma function
    y=0;u=2;                                                                % initialize variables
    while u>g(y,beta,alpha)*h(y,c)                                          % acceptance-rejection algorithm 14
        v=rand; y=tan(pi*(v-1/2));                                          % generate random variable with standard Cauchy distribution, compare to §xample 2.26 of the lecture
        u=rand;                                                             
    end
    x=y;                                                                    % set value
end


function g_y = g(y,beta,alpha)                                              % compute function g
    if y<=1
        g_y=0;
    else
        g_y=1/(beta^alpha) * y^-(1/beta+1) * log(y)^(alpha-1);
    end
end


function h_y = h(y,c)                                                       % compute function h
    h_y=c * 1/(pi*(1+y^2));
end