% function to compute CLT confidence intervalls

function [CLT_lower, CLT_upper] = CLT_interval(confidence_level, dataset)   % output: CLT confidence interval, input: confidence level and data points
    epsilon = 1-confidence_level;                                           % calculate epsion
    n = length(dataset);
    variance = var(dataset);                                                % calculate variance and mean of the measuring points
    average = mean(dataset);
    u = norminv(1-epsilon/2);                                               % determine quantiles of the normal distribution with Matlab's build-in function

    CLT_lower = average-u*sqrt(variance/n);                                 % compute upper and lower interval limit according to the formula
    CLT_upper = average+u*sqrt(variance/n);
end                                                                         % end function