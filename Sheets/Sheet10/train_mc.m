% Monte Carlo simulation for train
M = 10e7; % define number of Monte Carlo runs
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    L(i)=train;
end
EV_train = mean(L) % compute expected value
Variance_train = var(L) % compute variance of Monte Carlo approximation

% Monte Carlo simulation for train antithetic
M = 10e7; % define number of Monte Carlo runs
K = zeros(1,M); % initialize parameters
for i=1:M % perform antithetic Monte Carlo simulation
    K(i)=train_anti;
end
EV_train_anti = mean(K) % compute expected value
Variance_train_anti = var(K) % compute variance of Monte Carlo approximation
