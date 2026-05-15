% (b)


Monte = 10e5;                                                               % number of MC runs

% run Monte Carlo simulation for p1 = 1/10

p1=1/10;                                                                    % define probability    


tic;                                                                        % start timer

dataset_p1 = zeros(1,Monte);
for i=1:Monte                                                               % Monte Carlo simulation 10^7-times
    dataset_p1(i) = twoconsecutivebadmillenium(p1);
end

average_twoconsecutivebadmillenium_p1 = mean(dataset_p1);                   % calculate Monte Carlo estimator for the expected value

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
    dataset_p2(i) = twoconsecutivebadmillenium(p2);
end

average_twoconsecutivebadmillenium_p2 = mean(dataset_p2);

time_p2 = toc;

% display elapsed time
fprintf('Elapsed time for p2=1/100: %.4f seconds\n', time_p2);

% calculate 95% CLT confidence intervals
confidence_level = 0.95;

[CLT_lower_p2, CLT_upper_p2] = CLT_interval(confidence_level, dataset_p2);



% -------------------------------------------------------------------------


% function to generate realisations of the event in (b)

function [count] = twoconsecutivebadmillenium(p)
    hit1 = 0;                       % initialize values
    hit2 = 0;
    count = 0;
    while hit2 ~= 1                 % as long as there have not been two consecutive bad milleniums keep going 
        u = rand;
        hit1 = ceil(p-u);           % algorithm 4 from lecture
        count = count+1;
        if hit1 == 1                % if one millenium has been bad, test for a second bad one immediately after
            u = rand;
            hit2 = ceil(p-u);       % algorithm 4 from lecture
        end
    end
end