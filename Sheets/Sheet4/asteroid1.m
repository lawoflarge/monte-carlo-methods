% (a)


Monte = 10e6;                                                               % number of MC runs

% run Monte Carlo simulation for p1 = 1/10

p1=1/10;                                                                    % define probability


tic;                                                                        % start timer

dataset_p1 = zeros(1,Monte);
for i=1:Monte
    dataset_p1(i) = firstbadmillenium(p1);                                  % Monte Carlo simulation 10^7-times
end

average_firstbadmillenium_p1 = mean(dataset_p1);                            % calculate Monte Carlo estimator for the expected value

time_p1 = toc;                                                              % stop time

% display elapsed time
fprintf('Elapsed time for p1=1/10: %.4f seconds\n', time_p1);

% calculate 95% CLT confidence intervals
confidence_level = 0.95;

[CLT_lower_p1, CLT_upper_p1] = CLT_interval(confidence_level, dataset_p1);


% -------------------------------------------------------------------------


% run Monte Carlo simulation for p2 = 1/100
% equivalent to the code above except for the probably p2

p2=1/100;


tic;

dataset_p2 = zeros(1,Monte);
for i=1:Monte
    dataset_p2(i) = firstbadmillenium(p2);
end

average_firstbadmillenium_p2 = mean(dataset_p2);

time_p2 = toc;

% display elapsed time
fprintf('Elapsed time for p2=1/100: %.4f seconds\n', time_p2);

% calculate 95% CLT confidence intervals
confidence_level = 0.95;

[CLT_lower_p2, CLT_upper_p2] = CLT_interval(confidence_level, dataset_p2);



% -------------------------------------------------------------------------


% function to generate realisations of the event in (c)

function [count] = firstbadmillenium(p)         % start function
    hit = 0;                                    % initialize values
    count = 0;
    while hit ~= 1                              % as long as the first bad millenium did not occur, repeat and add one time unit to the counter
        u = rand;                               % sample uniform distribution
        hit = ceil(p-u);                        % generate Bernoulli distribution via algorithm 4
        count = count+1;
    end
end                                             % end function