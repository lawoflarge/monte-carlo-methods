% implement the standard Monte Carlo simulation
function [Monte_Carlo_estimator, empirical_variance, running_time] = tram(n,M) % define function
    tic % start timer
    L = zeros(1,M); % set up parameter
    for j=1:M % perform Monte Carlo simulation
        T = 20*rand(); % sample arrving time T uniformly distributed on (0,20)
        W = 20-T; % set up initial minimum waiting time
            for i=2:n % sample n uniformly distributed tram arrival times
                X = 20*rand(); % generate independent stopping time of tram
                if T<X && (X-T)<W % tram has to arrive afterwards and provide shorter time frame to wait
                    W = X-T; % update waiting time with minimum value
                end
            end
            L(j)=W; % write Monte Carlo simulation result
    end
    Monte_Carlo_estimator = mean(L); % compute expected value
    empirical_variance = var(L); % compute variance of Monte Carlo approximation
    running_time = toc; % stop time
end % end function