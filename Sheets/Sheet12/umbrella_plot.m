% (a)
M = 10e5; % define number of Monte Carlo runs
% Monte Carlo simulation for umbrella random walk with m=1 and n=1 as well
% as m=4 and n=2
plotUmbrella(1,1,M)
plotUmbrella(4,2,M)

% (b)
M = 10e5; % define number of Monte Carlo runs
% Monte Carlo simulation for umbrella random walk with m=1 and n=1 in
% Example 5.13 (with transport according to rainy days)
plotUmbrella_b(1,1,M)

function plotUmbrella(m,n,M) % function to plot Umbrella walk for different p
    p_values = (2:2:99) / 100; % compute x-values
    D_values = zeros(1, 49);
    for i = 1:49 % perform Monte Carlo simulation for D-value for every value of p
        D_values(i) = umbrella(p_values(i),m,n,M); % save result
    end
    figure;
    plot(p_values, D_values, 'b-', 'LineWidth', 3); % plot results
    xlabel('p'); % x-label
    ylabel('D(p)'); % y-label
    title('Result of umbrella Markov process for different values of p');
end

function plotUmbrella_b(m,n,M) % function to plot Umbrella walk b for different p
    p_values = (2:2:99) / 100; % compute x-values
    D_values = zeros(1, 49);
    for i = 1:49 % perform Monte Carlo simulation for D-value for every value of p
        D_values(i) = umbrella_b(p_values(i),m,n,M); % save result
    end
    figure;
    plot(p_values, D_values, 'b-', 'LineWidth', 3); % plot results
    xlabel('p'); % x-label
    ylabel('D(p)'); % y-label
    title('Result of umbrella process with transport according to rainy days');
end