% b)
M = 10e4; % define number of Monte Carlo runs

% Monte Carlo simulation for random sums b)
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    u = usum(M);
    L(i)=(0<=u && u<=1);
end
EV_usum = mean(L) % compute expected value
Variance_usum = var(L) % compute variance of Monte Carlo approximation

% Monte Carlo simulation for random sums via antithetic approach b)
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    u = usum_anti(M);
    L(i)=(0<=u && u<=1);
end
EV_usum_anti = mean(L) % compute expected value
Variance_usum_anti = var(L) % compute variance of Monte Carlo approximation

% Monte Carlo simulation for random sums via control variates b)
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    u = usum_cv(M);
    L(i)=(0<=u && u<=1);
end
EV_usum_cv = mean(L) % compute expected value
Variance_usum_cv = var(L) % compute variance of Monte Carlo approximation