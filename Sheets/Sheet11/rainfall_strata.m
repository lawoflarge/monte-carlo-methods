% implement rainfall Monte Carlo simulation
function [EV_rainfall_strata, variance_rainfall_strata] = rainfall_strata(n) % define function
    lambda = 2.9; % define parameters for Poisson and Weibull distribution
    alpha = 0.8;
    beta = 3^(-1*alpha);
    b = beta; % transform parameters, as Matlab uses a different version of the pdf, see help center
    a = (1/alpha)^(1/b);
    % compute weights pi and run numbers ni for the strata Ai
    p0 = poisspdf(0,lambda); % S follows a discrete Poisson distribution
    p1 = poisspdf(1,lambda);
    p2 = poisspdf(2,lambda);
    p3 = poisspdf(3,lambda);
    p4 = poisspdf(4,lambda);
    p5 = poisspdf(5,lambda);
    p6 = 1-(p0+p1+p2+p3+p4+p5); % use complementary probability
    n0 = ceil(n*p0);
    n1 = ceil(n*p1);
    n2 = ceil(n*p2);
    n3 = ceil(n*p3);
    n4 = ceil(n*p4);
    n5 = ceil(n*p5);
    n6 = ceil(n*p6);
    % generate random variables in specific strata following the
    % conditional probability measure
    X0 = zeros(1,n0); % stratum with S=0
    for j =1:n0
        X0(j) = (0 < 5); % zero Weibull random variables are generated
    end
    X1 = zeros(1,n1); % stratum with S=1
    for j = 1:n1
        X1(j) = (sum(wblrnd(a,b,1,1)) < 5); % generate sum of 1 independent Weibull random variables
    end
    X2 = zeros(1,n2); % stratum with S=2
    for j = 1:n2
        X2(j) = (sum(wblrnd(a,b,1,2)) < 5); % generate sum of 2 independent Weibull random variables
    end
    X3 = zeros(1,n3); % stratum with S=3
    for j = 1:n3
        X3(j) = (sum(wblrnd(a,b,1,3)) < 5); % generate sum of 3 independent Weibull random variables
    end
    X4 = zeros(1,n4); % stratum with S=4
    for j = 1:n4
        X4(j) = (sum(wblrnd(a,b,1,4)) < 5); % generate sum of 4 independent Weibull random variables
    end
    X5 = zeros(1,n5); % stratum with S=5
    for j = 1:n5
        X5(j) = (sum(wblrnd(a,b,1,5)) < 5); % generate sum of 5 independent Weibull random variables
    end
    X6 = zeros(1,n6); % stratum with S>=6
    for j = 1:n6
        S=0;
        while S<6 % reject Poissoon distributed S until it is in stratum A6
            S = poissrnd(lambda);
        end
        X6(j) = (sum(wblrnd(a,b,1,S)) < 5); % generate sum of S independent Weibull random variables
    end
    % give back stratified Monte Carlo estimator
    EV_rainfall_strata = p0/n0*sum(X0) + p1/n1*sum(X1) + p2/n2*sum(X2) ...
    + p3/n3*sum(X3) + p4/n4*sum(X4) + p5/n5*sum(X5) + p6/n6*sum(X6); % compute expected value via formula from lecture
    variance_rainfall_strata = var([X0, X1, X2, X3, X4, X5, X6]); % compute variance of all samples
end % end function