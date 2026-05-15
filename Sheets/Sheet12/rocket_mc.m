% (b)

k = 10e6; % define number of Monte Carlo runs
N = [2,3,4,5,10,20,30,40,50]; % set up input parameters n
Analytical_EV = 1./N; % analytical results
EV_record = zeros(1,9); % define result vectors
Variance_record = zeros(1,9);
EV_record_anti = zeros(1,9); % define result vectors
Variance_record_anti = zeros(1,9);

% Monte Carlo simulation for record
for n=1:length(N)
    [EV_record(n), Variance_record(n)] = record(N(n),k);
end

% Monte Carlo simulation for record anti
for n=1:length(N)
    [EV_record_anti(n), Variance_record_anti(n)] = record_anti(N(n),k);
end

T = table(N', Analytical_EV', EV_record', Variance_record', EV_record_anti', Variance_record_anti'); % generate table
T = renamevars(T,["Var1","Var2","Var3","Var4","Var5","Var6"],["N","Analytical_EV", "EV_record", "Variance_record", "EV_record_anti", "Variance_record_anti"]);
disp(T); % show table

