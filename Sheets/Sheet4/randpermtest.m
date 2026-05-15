% 3

M = 10000;                                  % number of samples for every value of N                                                                        

time_randperm = zeros(1,200);               % initialize variables to measure average computational time
time_algorithm7 = zeros(1,200);
time_algorithm8 = zeros(1,200);

N = 10*(1:200);                             % define set of integers

for n = N

% MATLAB randperm algorithm

tic;
for z = 1:M                                 % repeat procedure for 10^4 samples for every single method     
    x = randperm(n);                        % use build-in Matlab randperm function
end

time_randperm(n/10) = toc/M;                % stop computational time           


% algorithm 7 by sorting (Lecture)

tic;
for z = 1:M
    u = rand(1,n);                          % use algorithm 7 from the lecture
    [v_sorted, idx] = sort(u);
    x = idx;
end

time_algorithm7(n/10) = toc/M;              % stop computational time




% algorithm 8 by exchange / Durstenfeld (Lecture)

tic;
for z = 1:M
    x = 1:n;                                % use algorithm 8 from the lecture
    for i = n:-1:2
        u = rand;
        j = floor(i*u + 1);
        x_i = x(i);
        x_j = x(j);
        x(i) = x_j;
        x(j) = x_i;
    end
    x;
end

time_algorithm8(n/10) = toc/M;              % stop computational time

end



% plot results
figure;
plot(N, time_randperm, 'LineWidth', 2);     % plot three line charts in a common plot
hold on                                     % hold on
plot(N, time_algorithm7, 'LineWidth', 2);
plot(N, time_algorithm8, 'LineWidth', 2);

title('Comparison of running times of three algorithms for random permutation'); % assign a title as well as axis labelling
xlabel('N');
ylabel('computational time in seconds');
legend('Randperm', 'Algorithm 7', 'Algorithm 8');                                % define legend of chart
hold off



% for large N the Durstenfeld algorithm is the fastest one with a computational time
% proportional to N whereas the other two algorithms take more time
% (proportional to N*log(N) 