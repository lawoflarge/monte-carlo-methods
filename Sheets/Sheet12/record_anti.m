% implement the antithetic rocket science Monte Carlo simulation
function [EV_record_anti, Variance_record_anti] = record_anti(n,k) % define function
    L = zeros(1,k); % initialize parameters
    for i=1:k % perform k Monte Carlo runs
        U = rand(1,n); % generate n iid uniformly distributed random variables
        X1 = -log(U); % use inverse transformation method to generate original 
        X2 = -log(1-U); % and antithetic exponential samples with parameter lambda=1
        R1 = X1(n) > max(X1(1,1:end-1)); % evaluate if X1_n is the new height record
        R2 = X2(n) > max(X2(1,1:end-1)); % evaluate if the antithetic X2_n is the new height record
        L(i) = (R1+R2)/2; % average the results to obtain final answer
    end
    EV_record_anti = mean(L); % compute expected value
    Variance_record_anti = var(L); % compute variance of Monte Carlo approximation
end % end function