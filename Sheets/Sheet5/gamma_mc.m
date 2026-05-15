% 1 (b)

Monte = [100, 1000, 10000, 100000];
mean_gamma = zeros(1,4);
CLT_lower = zeros(1,4);
CLT_upper = zeros(1,4);

alpha = 7/6;                                                                % initialize
beta = 5/4;
lambda = 0.7;                                                               % use lamnbda = 0.7 for optimal performacne
expected_value_analytical = alpha*beta;                                     % calculate analytical result

for m = 1:4
gamma = zeros(1,Monte(m));                                                  % initialize MC variable

for i = 1:Monte(m)
    gamma(i) = ar_gamma(alpha,beta,lambda);                                 % Monte Carlo approximation of the mean of a Gamma distribution
end

mean_gamma(m) = mean(gamma);                                                % calculate results
[CLT_lower(m), CLT_upper(m)] = CLT_interval(0.99, gamma);                   % 99% confidence intervals

end


% summarize results in table
columnNames = {'Number of MC runs', 'Mean of Gamma distribution', '99% CLT lower bound', '99% CLT upper bound'};   % column names
T = table(Monte', mean_gamma', CLT_lower', CLT_upper', 'VariableNames', columnNames);  % generate table
disp(T);