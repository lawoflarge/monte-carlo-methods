% implement the rocket science Monte Carlo simulation
function [EV_record] = recordC(n,k,alpha) % define function
    L = zeros(1,k); % initialize parameters
    for i=1:k % perform k Monte Carlo runs
        X = zeros(1,n);
        for j=1:n
            X(j) = exprnd(1/(1+alpha*j)); % generate n iid exponential distributed random variables with parameter lambda=1/(1+alpha*j) as Matlab defines Exp different
        end
        L(i) = X(n) > max(X(1,1:end-1)); % evaluate if X_n is the new height record
    end
    EV_record = mean(L); % compute expected value
end % end function