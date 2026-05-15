% implement rainfall Monte Carlo simulation
function X = rainfall % define function
    lambda = 2.9; % define parameters for Poisson and Weibull distribution
    alpha = 0.8;
    beta = 3^(-1*alpha); 
    b = beta; % transform parameters, as Matlab uses a different version of the pdf, see help center
    a = (1/alpha)^(1/b);
    S = poissrnd(lambda); % generate poisson distributed random variable with parameter lambda=2.9
    X = sum(wblrnd(a,b,1,S)); % generate S-times and independt Weibull distribution and compute sum
end % end function