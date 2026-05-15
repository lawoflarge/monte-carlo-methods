% implement the random sum Monte Carlo simulation via antithetic sampling
function Y = usum_cv(n) % define function
    U = rand(1,n); % generate n independent uniformly distributed random variables
    X = sum(cumprod(U)); % compute sum of cumulative product of U2's
    b = 1.9836; % set up optimal value for b
    Y = X + b * (1/2 - 1/2); % give back Y-value
end % end function