function [b] = plasmide_random(n)
                                                           % n pieces of equal length
b = 0;                                                     % 1 = both genes are in the same piece of genome and not repressed by DNA methylation, 0 = not

x1 = rand;                                                 % generate uniform random variables
x2 = rand;
M1 = rand;
M2 = rand;

cuts = sort(rand(1,n));                                          % n random cutting points

z = "False";

for i = 1:n-1
    if cuts(i)<=x1 && x1<cuts(i+1) && cuts(i)<=x2 && x2<cuts(i+1) 	   % same piece of genome
        b = 1;
        if M1<=M2
            if M1 <= x1 && x1 < M2                            % gene 1 repressed by DNA methylation
                b = 0;
            elseif M1 <= x2 && x2 < M2                        % gene 2 repressed by DNA methylatio
                b = 0;
            else
                b = 1;
                z = "True";
                break
            end
        elseif M1>M2
            if M1 <= x1 || x1 < M2                            % gene 1 repressed by DNA methylation
                b = 0;
            elseif M1 <= x2 || x2 < M2                        % gene 2 repressed by DNA methylation
                b = 0;
            else
                b = 1;
                z = "True";
                break
            end
        end
    end
end

if z == "False" && (cuts(n)<=x1 ||  x1<cuts(1)) && (cuts(n)<=x2 ||  x2<cuts(1))       % circular genome, test end
    b = 1;
        if M1<=M2
            if M1 <= x1 && x1 < M2                            % gene 1 repressed by DNA methylation
                b = 0;
            elseif M1 <= x2 && x2 < M2                        % gene 2 repressed by DNA methylatio
                b = 0;
            else
                b = 1;
            end
        elseif M1>M2
            if M1 <= x1 || x1 < M2                            % gene 1 repressed by DNA methylation
                b = 0;
            elseif M1 <= x2 || x2 < M2                        % gene 2 repressed by DNA methylation
                b = 0;
            else
                b = 1;
            end
        end
end