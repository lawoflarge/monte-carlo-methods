% implement the random sum Monte Carlo simulation via antithetic sampling
function X = usum_anti(n) % define function
    U1 = rand(1, n/2); % generate n/2 independent uniformly distributed random variables
    U2 = 1 - U1; % generate the antithetic counterparts with symmetry to y=0.5
    U = [U1, U2]; % combine U1 and U2 to get n random variables
    X = sum(cumprod(U)); % compute the cumulative product and then the sum
end % end function