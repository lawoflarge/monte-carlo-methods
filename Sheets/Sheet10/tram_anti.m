% implement the antithetic Monte Carlo simulation
function [Monte_Carlo_estimator, empirical_variance, running_time] = tram_anti(n,M) % define function
    tic % start timer
    L = zeros(1,M); % set up parameter
    for j=1:M % perform Monte Carlo simulation
        T1 = 20*rand(); % sample arrving time T uniformly distributed on (0,20)
        T2 = 20-T1; % set up antithetic sampled arriving time
        W1 = 20-T1; % set up initial minimum waiting time
        W2 = 20-T2; % set up initial minimum waiting time mirrored on symmetry point y=10
            for i=2:n % sample n uniformly distributed tram arrival times
                X1 = 20*rand(); % generate independent stopping time of tram
                if T1<X1 && (X1-T1)<W1 % tram has to arrive afterwards and provide shorter time frame to wait
                    W1 = X1-T1; % update waiting time with minimum value
                end
                X2 = 20-X1; % generate symmetric stopping time of tram
                if T2<X2 && (X2-T2)<W2 % tram has to arrive afterwards and provide shorter time frame to wait
                    W2 = X2-T2; % update antithetic waiting time with minimum value
                end
            end
            L(j)=(W1 + W2)/2; % write Monte Carlo simulation result
    end
    Monte_Carlo_estimator = mean(L); % compute expected value
    empirical_variance = var(L); % compute variance of Monte Carlo approximation
    running_time = toc; % stop time
end % end function