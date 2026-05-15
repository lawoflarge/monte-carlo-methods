Monte = 10e6;
n = [2 3 4 5 6 7 8 9 10];
confidence = 0.9;
chebychev_constant = sqrt(1 / (1 - confidence));

% test

no_sucesses_test = 0;
for i=1:Monte
        [b] = plasmide_random(1);
        no_sucesses_test = no_sucesses_test + b;
end
probability_test = no_sucesses_test/Monte;


% equal length

no_sucesses_equal = zeros(1,9);
probability_equal = zeros(1,9);

values_equal = zeros(1,Monte);
Chebychev_bottom_equal = zeros(1,9);
Chebychev_top_equal = zeros(1,9);
CLT_bottom_equal = zeros(1,9);
CLT_top_equal = zeros(1,9);

for j = n
    for i=1:Monte
        [b] = plasmide_equal(j);
        no_sucesses_equal(j-1) = no_sucesses_equal(j-1) + b;
        values_equal(i) = no_sucesses_equal(j-1)/i;

    end
    probability_equal(j-1) = no_sucesses_equal(j-1)/Monte;

    Chebychev_bottom_equal(j-1) = mean(values_equal) - chebychev_constant * std(values_equal);
    Chebychev_top_equal(j-1) = mean(values_equal) + chebychev_constant * std(values_equal);

    std_error_equal = std(values_equal) / sqrt(n(end));
    z_equal = norminv((1 + confidence) / 2, 0, 1);
    CLT_bottom_equal(j-1) = mean(values_equal) - z_equal * std_error_equal;
    CLT_top_equal(j-1) = mean(values_equal) + z_equal * std_error_equal;
end


% random length

no_sucesses_random = zeros(1,9);
probability_random = zeros(1,9);

values_random = zeros(1,Monte);
Chebychev_bottom_random = zeros(1,9);
Chebychev_top_random = zeros(1,9);
CLT_bottom_random = zeros(1,9);
CLT_top_random = zeros(1,9);

for j = n
    for i=1:Monte
        [b] = plasmide_random(j);
        no_sucesses_random(j-1) = no_sucesses_random(j-1) + b;
        values_random(i) = no_sucesses_random(j-1)/i;

    end
    probability_random(j-1) = no_sucesses_random(j-1)/Monte;

    Chebychev_bottom_random(j-1) = mean(values_random) - chebychev_constant * std(values_random);
    Chebychev_top_random(j-1) = mean(values_random) + chebychev_constant * std(values_random);
    % intalled Statistics and Machine Learning Toolbox for performance
    std_error_ranodom = std(values_random) / sqrt(n(end));
    z_random = norminv((1 + confidence) / 2, 0, 1);
    CLT_bottom_random(j-1) = mean(values_random) - z_random * std_error_ranodom;
    CLT_top_random(j-1) = mean(values_random) + z_random * std_error_ranodom;
end


% table

Spalten  = {'no. cuts', 'Chebychev_bottom', 'Chebychev_top', 'Probability', 'CLT_bottom', 'CLT_top'};

results_equal = table(n', Chebychev_bottom_equal', Chebychev_top_equal', probability_equal', CLT_bottom_equal', CLT_top_equal', 'VariableNames', Spalten);
display(results_equal)

results_random = table(n', Chebychev_bottom_random', Chebychev_top_random', probability_random', CLT_bottom_random', CLT_top_random', 'VariableNames', Spalten);
display(results_random)


% plot

plot(n,probability_equal,'-r', 'LineWidth', 2, 'DisplayName', 'probability equal');
xlabel('n')
ylabel('probability')
legend('show')
hold on
plot(n,probability_random, '--b', 'LineWidth', 2, 'DisplayName', 'probability random');
hold off