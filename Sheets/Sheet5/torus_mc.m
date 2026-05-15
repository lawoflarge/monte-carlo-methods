% torus Monte Carlo

Monte = 10^7;                                                               % number of Monte Carlo runs
R=3; 
r=1;                                                                        % set parameters

% approximation of the volume of the torus via the acceptance-rejection algorithm (the acceptance probability) for the 10^7 samples


accepted = zeros(1,Monte);                                                  % initialize values

for i = 1:Monte                                                             % run Monte Carlo simulation
    accepted(i) = torus_acceptance(R,r);
end

volume_rectangular_cuboid = 8*8*2;                                          % calulate volume of box: lenth*width*height
probability_acceptance = mean(accepted);                                    % law of large numbers approximates chance of acceptance for 10^7 Monte Carlo runs                    
approximation_volume_torus = probability_acceptance*volume_rectangular_cuboid;                    % calulate volume of torus by multiplying probability of success with volume of the rectangular cuboid




% second Monte Carlo approximation

Monte = 10^6;

success = zeros(1,Monte);                                                   % initialize values

for i = 1:Monte                                                             % run MC simulation
    success(i) = torus_coordinates(R,r);
end

probability_success = mean(success);

[CLT_lower, CLT_upper] = CLT_interval(0.95, success);                       % compute 95% confidence interval



% -------------------------------------------------------------------------


% function to generate random points inside rectangular cuboid and check,
% if they are part of the torus

function accepted = torus_acceptance(R,r)
    x = unifrnd(-4,4);                                                      % generate random variable x on rectangular cuboid
    y = unifrnd(-4,4);                                                      % generate random variable y on rectangular cuboid
    z = unifrnd(-1,1);                                                      % generate random variable z on rectangular cuboid
    if  vecnorm([x,y]) <= (R+r) && vecnorm([vecnorm([x,y]) - R,z]) <= r     % accept if euclidean norm matches the requirements of being inside the torus
        accepted = 1;
    else
        accepted = 0;
    end                                                                 
end



function success = torus_coordinates(R,r)
    x=0; y=0; z=0;                                                          % initialize variables
    while  vecnorm([x,y]) > (R+r) || vecnorm([vecnorm([x,y]) - R,z]) > r    % repeat until euclidean norm matches the requirements of being inside the torus
    x = unifrnd(-4,4);                                                      % generate random variable x on rectangular cuboid
    y = unifrnd(-4,4);                                                      % generate random variable y on rectangular cuboid
    z = unifrnd(-1,1);                                                      % generate random variable z on rectangular cuboid
    end
    if vecnorm([x,y,z]-[1,1,1])<=2                                          % requirements are matched
        success = 1;
    else
        success = 0;                                                        % failure
    end
end