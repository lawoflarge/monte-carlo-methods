% (d) Monte Carlo simulation for tram
M = 10e6; % define number of Monte Carlo runs
N = 10; % maximum number of tram arrivals

% set up parameters
EV_tram = zeros(1,N);
Variance_tram = zeros(1,N);
Running_time_tram = zeros(1,N);
EV_tram_anti = zeros(1,N);
Variance_tram_anti = zeros(1,N);
Running_time_tram_anti = zeros(1,N);
EV_tram_analytical = 20./(2:N+1); % compute analytical expected values

% compute function values
for n=1:10
    [EV_tram(n), Variance_tram(n), Running_time_tram(n)] = tram(n,M); % Monte Carlo simulation for tram standard
    [EV_tram_anti(n), Variance_tram_anti(n), Running_time_tram_anti(n)] = tram_anti(n,M); % Monte Carlo simulation for tram antithetic
end

% set up table
T = table(EV_tram_analytical', EV_tram', EV_tram_anti', Variance_tram', Variance_tram_anti', Running_time_tram', Running_time_tram_anti', 'VariableNames', {'W(n)_analytical', 'W(n)_tram', 'W(n)_tram_anti', 'Variance_tram','Variance_tram_anti', 'Running_time_tram', 'Running_time_tram_anti'});
T.Properties.RowNames = {'n=1', 'n=2', 'n=3', 'n=4', 'n=5', 'n=6', 'n=7', 'n=8', 'n=9', 'n=10'}; % define row names
disp(T) % display table
