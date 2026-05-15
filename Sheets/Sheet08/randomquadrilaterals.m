Monte=10e6;                                                                 % define number of Monte Carlo runs
successes=zeros(1,Monte);                                                   % initialize variables
n=5   ;                                                                        % value of n

for i=1:Monte                                                               % perform Monte Carlo simulation
    [P1, P2, P3, P4] = random_quadrilaterals(n);
    is_rectangle = isRectangle(P1, P2, P3, P4);                             % test if the four points form a rectangle
    if is_rectangle == true
        successes(i)=1;
    end

end

format long
p_n_Monte = sum(successes)/Monte                                            % give back Monte Carlo result
p_n_Analytical = nchoosek(n,2)^2 / nchoosek(n^2,4)                          % give back analytical result



function [P1, P2, P3, P4] = random_quadrilaterals(n)                        % function to generate four different points in an nxn grid of natural numbers
    P1 = [randi(n), randi(n)];                                              % generate random coordinates for the first point
    P2 = [randi(n), randi(n)];
    while isequal(P2, P1)                                                   % generate random coordinates for the second point, ensuring it's different from the first point
        P2 = [randi(n), randi(n)];                                          % choose random integer in the interval from 1 to n
    end
    P3 = [randi(n), randi(n)];                                              % generate random coordinates for the third point, ensuring it's different from the first two points
    while isequal(P3, P1) || isequal(P3, P2)                                % same logic as above
        P3 = [randi(n), randi(n)];
    end
    P4 = [randi(n), randi(n)];                                              % generate random coordinates for the fourth point, ensuring it's different from the first three points
    while isequal(P4, P1) || isequal(P4, P2) || isequal(P4, P3)
        P4 = [randi(n), randi(n)];                                          % same logic as above
    end
end



function is_rectangle = isRectangle(P1, P2, P3, P4)                         % function to check if the four points form a rectangle with vertical and horizontal sides
    points = [P1; P2; P3; P4];                                              % set up matrix with points
    all_permutations = perms([1; 2; 3; 4]);                                 % establish matrix with permutation of numbers from 1 to four in the 4 factorial rows
    is_rectangle = false;                                                   % initialize boolean variable

    for i=1:24                                                              % test rectangle condition for every possible permutation of points
        P1 = points(all_permutations(i,1) , :);
        P2 = points(all_permutations(i,2) , :);
        P3 = points(all_permutations(i,3) , :);
        P4 = points(all_permutations(i,4) , :);
        % check if at least two points are in one horizontal or vertical line
        % to prevent rhombuses being marked as rectangles
        if (P1(1)==P2(1)) && (P1(2)==P4(2))
            % utilize dot product of real vectors to check if the sides are perpendicular 
            if dot(P2-P1,P3-P2)==0 && dot(P3-P2,P4-P3)==0 && dot(P4-P3,P1-P4)==0 && dot(P1-P4,P2-P1)==0              
                is_rectangle = true;                                        % give back boolean value
            end
        end
    end
end

