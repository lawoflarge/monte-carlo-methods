% (a) implement methods from lecture
% see functions in seperate files


% (b) compare running times for the 5 algorithms
s = 10e6;                                                                   % define number of samples
tic
for i=1:s
    x=ar_cauchy;
end
time_ar_cauchy=toc;                                                         % stop running time for ar_cauchy-algorithm

tic
for i=1:s
    x=boxmuller;
end
time_boxmuller=toc;                                                         % stop running time for boxmuller-algorithm

tic
for i=1:s
    x=polar;
end
time_polar=toc;                                                             % stop running time for polar-algorithm

tic
for i=1:s
    x=randn;                                                                                            
end
time_randn=toc;                                                             % stop running time for randn-algorithm                    

tic
for i=1:s                         
    x=norminv(rand);                                                        
end
time_norminv=toc;                                                           % stop running time for norminv-algorithm



% plot results in bar char
x = 1:5;
y = [time_ar_cauchy, time_boxmuller, time_polar, time_randn, time_norminv];
bar(x,y)
hold on
for i = 1:numel(x)
    text(x(i), y(i), num2str(y(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
end
hold off
title("comparison running times");
xlabel("algorithm");
ylabel("compotational time in s");
set(gca, "XTick", 1:numel(x), "XTickLabel", {"ar_cauchy", "boxmuller", "polar", "randn", "norminv"});



