% 2

alpha = 1.4;                                          % define parameter alpha
beta = 0.7;                                           % define parameter beta


% Monte Carlo simulation for N = 10^4

N = 10e4;                                             % number of samples
dataset_10e4 = zeros(1,N);                            % initialize vector
for i = 1:N                                           % Monte Carlo run
    dataset_10e4(i) = distribution(alpha,beta);
end

MC_estimation_10e4 = mean(dataset_10e4);              % calculate Monte carlo estimator 


% Monte Carlo simulation for N = 10^5

N = 10e5;
dataset_10e5 = zeros(1,N);
for i = 1:N
    dataset_10e5(i) = distribution(alpha,beta);
end

MC_estimation_10e5 = mean(dataset_10e5);


% Monte Carlo simulation for N = 10^6

N = 10e6;
dataset_10e6 = zeros(1,N);
for i = 1:N
    dataset_10e6(i) = distribution(alpha,beta);
end

MC_estimation_10e6 = mean(dataset_10e6);


% Monte Carlo simulation for N = 10^7

N = 10e7;
dataset_10e7 = zeros(1,N);
for i = 1:N
    dataset_10e7(i) = distribution(alpha,beta);
end

MC_estimation_10e7 = mean(dataset_10e7);


% print results

fprintf('The Monte Carlo estimation for the expected value in the case of n=10e4 is %.4f .\n', MC_estimation_10e4);
fprintf('The Monte Carlo estimation for the expected value in the case of n=10e5 is %.4f .\n', MC_estimation_10e5);
fprintf('The Monte Carlo estimation for the expected value in the case of n=10e6 is %.4f .\n', MC_estimation_10e6);
fprintf('The Monte Carlo estimation for the expected value in the case of n=10e7 is %.4f .\n', MC_estimation_10e7);



% 95% CLT confidence intervalls for the four different values of N

confidence_level = 0.95;

[CLT_lower_10e4, CLT_upper_10e4] = CLT_interval(confidence_level, dataset_10e4);
[CLT_lower_10e5, CLT_upper_10e5] = CLT_interval(confidence_level, dataset_10e5);
[CLT_lower_10e6, CLT_upper_10e6] = CLT_interval(confidence_level, dataset_10e6);
[CLT_lower_10e7, CLT_upper_10e7] = CLT_interval(confidence_level, dataset_10e7);




% -------------------------------------------------------------------------



% inversion method to construct algorithm for the simulation of the distribution Fx

function [x] = distribution(alpha,beta)               % define function
    u = rand;                                         % sample uniform random variable                                                                                          
    if u == 0                                         % use algorithm 1 from the lecture
        x = -inf;
    elseif 0<u && u<=1
        x = (log(1-u)/(-1*alpha))^(1/beta);           % F^-1 for values u>0
    end
end                                                   % end functioin

