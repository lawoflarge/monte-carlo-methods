M = 10e5; % define number of Monte Carlo runs

% Monte Carlo simulation for random sums
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    L(i)=usum(M);
end
EV_usum = mean(L) % compute expected value
Variance_usum = var(L) % compute variance of Monte Carlo approximation

% Monte Carlo simulation for random sums via antithetic approach
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    L(i)=usum_anti(M);
end
EV_usum_anti = mean(L) % compute expected value
Variance_usum_anti = var(L) % compute variance of Monte Carlo approximation