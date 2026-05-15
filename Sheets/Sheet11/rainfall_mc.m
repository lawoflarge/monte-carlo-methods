M = 10e4; % define number of Monte Carlo runs

% Monte Carlo simulation for rainfall
L = zeros(1,M); % initialize parameters
tic % start timer
for i=1:M % perform Monte Carlo simulation
    u = rainfall;
    L(i)=(u<5);
end
running_time_rainfall = toc % stop running time
EV_rainfall = mean(L) % compute expected value
Variance_rainfall = var(L) % compute variance of Monte Carlo approximation


% Monte Carlo simulation for rainfall with stratified sampling
L = zeros(1,M); % initialize parameters
tic % start timer
[EV_rainfall_strata, variance_rainfall_strata] = rainfall_strata(M) % give back probability estimate and variance 
running_time_rainfall_strata = toc % stop running time