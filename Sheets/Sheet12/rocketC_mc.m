% (c)

k = 10e6; % define number of Monte Carlo runs
N = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]; % set up input parameters n
Analytical_EV = 1./N; % analytical results
EV_record_ordinary = zeros(1,29); % define result vectors
EV_record_alpha_01 = zeros(1,29);
EV_record_alpha_05 = zeros(1,29);

% Monte Carlo simulation for record
for n=1:length(N)
    EV_record_ordinary(n) = recordC(N(n),k,0);
    EV_record_alpha_01(n) = recordC(N(n),k,0.1);
    EV_record_alpha_05(n) = recordC(N(n),k,0.5);
end

% plotting the results using loglog
figure;
hold on;
loglog(N, Analytical_EV, 'DisplayName', 'Analytical-EV');
loglog(N, EV_record_ordinary, 'DisplayName', 'EV-record-ordinary');
loglog(N, EV_record_alpha_01, 'DisplayName', 'EV-record-alpha-01');
loglog(N, EV_record_alpha_05, 'DisplayName', 'EV-record-alpha-05');
hold off;
% adding labels and title
xlabel('n');
ylabel('EV');
title('Log-Log Plot of Rocket Science Monte Carlo Simulation');
legend show;