function [b] = plasmide_equal(n) 
                                                           % n pieces of equal length
b = 0;                                                     % 1 = both genes are in the same piece of genome and not repressed by DNA methylation, 0 = not

x1 = rand;                                                 % generate uniform random variables
x2 = rand;
M1 = rand;
M2 = rand;


for i = 0:n-1
    if i/n<=x1 && x1<(i+1)/n && i/n<=x2 && x2<(i+1)/n 	   % same piece of genome
            b = 1;
        if M1<=M2
            if M1 <= x1 && x1 < M2                            % gene 1 repressed by DNA methylation
                b = 0;
            elseif M1 <= x2 && x2 < M2                        % gene 2 repressed by DNA methylatio
                b = 0;
            else
                b = 1;
                break
            end
        elseif M1>M2
            if M1 <= x1 || x1 < M2                            % gene 1 repressed by DNA methylation
                b = 0;
            elseif M1 <= x2 || x2 < M2                        % gene 2 repressed by DNA methylatio
                b = 0;
            else
                b = 1;
                break
            end
        end
    end
end