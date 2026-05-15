function [p , r ,  ties] = chessduel(p1,d1,p2,d2,N) 
                                % rounds, points, tie counter
r = 0;
p = zeros(1,2);
ties = 0;


for i=1:N       
    u=rand;     

    if u<d1                     % draw,
        p = p + [0.5 0.5];      
    
    elseif u<d1+p1              % player A wins round
        p = p + [1 0];          
    
    else 
        p = p + [0 1];          % player B wins
    end 

    if abs(p(1)-p(2)) > N - i 
        r = r+1;
        break                   % game ends
    end

    r = r+1;
end

if p(1) == p(2)       
    tie = 1;                    % tie break
    
    while tie == 1         
        x=rand;               
        if x<d2             
            tie = 1;            % the tie break keeps going
        elseif x<d2+p2    
            tie = 0;
            p = p + [1 0];
        else 
            tie = 0;
            p = p + [0 1];  
        end                     % tie break ends
        ties = ties + 1;
    end
    
r = r+ties;                     % number of rounds
end