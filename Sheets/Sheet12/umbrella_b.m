% implement umbrella Monte Carlo simulation
function D_MC_mean = umbrella_b(p,m,n,M) % define function
    D_MC_results = zeros(1,M); % initialize result vector
    for i = 1:M % evaluate M Monte Carlo runs
        D_MC_results(i) = umbrella_walk_b(p,m,n);
    end
    D_MC_mean = mean(D_MC_results); % compute Monte Carlo estimator
end % end function