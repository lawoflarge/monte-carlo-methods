% 1 (c)
Monte=[10e3,10e4,10e5];                                                     % define Monte Carlo runs
alpha=3/2; beta=1/3;                                                        % set parameters
probabilities=zeros(1,length(Monte));                                       % initialize output vectors 
CLT_upper=zeros(1,length(Monte));
CLT_lower=zeros(1,length(Monte));

c=pi/(beta^(alpha)*gamma(alpha))*2 * exp((beta-alpha*beta)*(1-1/beta)/(beta-1)) * ((beta-alpha*beta)/(beta-2))^(alpha-1);               % calculate optimal value of c>1
disp(c)

for m=1:3
success=zeros(1,Monte(m));
    for i=1:Monte(m)                                                        % perform Monte-Carlo simulatoin
        if loggamma(alpha,beta,c)<=2
            success(i)=1;
        end
    end
    probabilities(m)=mean(success);                                         % obtain probabilities
    [CLT_lower(m), CLT_upper(m)]=CLT_interval(0.95, success);                % compute confidence intervals
end


% display results of Monte Carlo simulation in a table
headers = ["number of Monte Carlo runs", "Monte Carlo approximation for P(X<=2)", "95%-confidence interval lower bound", "95%-confidence interval upper bound"];
T=table(Monte',probabilities',CLT_lower',CLT_upper', VariableNames=headers);
tableTitle = 'Monte Carlo approximation for alpha=3/2 and beta=1/3';
disp(tableTitle);
disp(T)

