% algorithm 15 via AR + Cauchy
function x = ar_cauchy                                                      % define function
stop=0;
while stop==0                                                               % repeat until random variable is sampled
    u=rand; v=rand;                                                         % generate independent uniformly distributed random variables
    y=sqrt(2)*tan(pi*(u-1/2));
    if v <= (1+y^2/2)*exp(-y^2/2)                                           % acceptance-rejection step
        x=y;                                                                % set value and end algorithm
        stop=1;
    end
end
end