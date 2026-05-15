% implement the random sum Monte Carlo simulation
function X = usum(n) % define function
    U = rand(1,n); % generate n independent uniformly distributed random variables
    X = sum(cumprod(U)); % compute sum of cumulative product of U's
end % end function