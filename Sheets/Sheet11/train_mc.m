% Monte Carlo simulation via control variates for train
M = 10e7; % define number of Monte Carlo runs
L = zeros(1,M); % initialize parameters
for i=1:M % perform Monte Carlo simulation
    L(i)=train_cv;
end
EV_train_cv = mean(L) % compute expected value
Variance_train_cv = var(L) % compute variance of Monte Carlo approximation