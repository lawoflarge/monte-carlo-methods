% algorithm 17 via polar method
function x = polar                                                           % define function
stop=0;
while stop==0                                                               % repeat until random variable is sampled
    u=2*rand-1; v=2*rand-1;                                                 % generate independent uniformly distributed random variables on [-1,1]
    if 0<u^2+v^2 && u^2+v^2<1                                               % check condition
        x=u*sqrt(-2*log(u^2+v^2))/(u^2+v^2);                                % set values and end algorithm
        y=u*sqrt(-2*log(u^2+v^2))/(u^2+v^2);                                                                
        stop=1;
    end
end
end