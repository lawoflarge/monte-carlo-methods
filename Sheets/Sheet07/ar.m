function [x,round] = ar(r)                                                  % define acceptance rejection algorithm
round=0;                                                                    % count number of trials
while true
    round = round + 1;                                                      % endless loop until successful attempt
    u=rand();                                                               % generate uniformly distributed indeptendent random variables
    v=rand();   
    y=sqrt(2)*tan(pi*(u-1/2));                                              % generate Cauchy distribution via inverse transformation method
if abs(y)<=r                                                                % Cauchy acceptance rejection algorithm in the middle section (-r,r)
    if v <= f(y)/g(y)                                                         
        x=y;
        return;                                                             % return if accepted
    end
elseif abs(y)>r                                                             % Gaussian tail simulation
    y = - log(u)/r;                                                         % generate exponential distribution
    if abs(y)>r && v <= f(y)/h(y,r)                                         % conditional probability that |y| is larger than r, exponential distribution is memoryless
        z=randi([0,1])*2-1;                                                 % generate discrete random variable with 1/2 chance on -1 and 1/2 chance on 1
        x=z*y;                                                              % 50% chance to get a point in the right or left tail respectively
        return                                                              % return if accepted
    end
end
end
end


function f = f(y)                                                           % density of normal distributioni
    f = 1/sqrt(2*pi)*exp(-y^2/2);
end

function g = g(y)                                                           % pseudo density of Cauchy
    g = 1/sqrt(2*pi)*1/(1+y^2/2);
end

function h = h(y,r)                                                         % pseudo density of Gaussian tails
    h = f(r)*exp(-r*(y-r));
end