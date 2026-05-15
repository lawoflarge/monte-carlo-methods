Monte = 10e7;                                                               % number of Monte Carlo runs
samples=zeros(1,Monte);                                                     % initialize variables
trials=zeros();
r=1.4971;                                                                   % optimal r value derived via numerical methods

for i=1:Monte                                                               % Monte Carlo simulation
    [x,round]=ar(r);
    samples(i)=x;
    trials(i)=round;
end

histogram(samples, 'Normalization', 'pdf', 'EdgeColor', 'none');            % plot sample to see if they look like Gaussian bell curve
acceptance_probability_MC = Monte/sum(trials);                              % compute acceptance probability by dividing succesful trials by total trials

