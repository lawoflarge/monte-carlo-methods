function D = umbrella_walk_b(p,m,n) % implement function to model one random walk
    D = 0; % initialize parameters
    S = "home";
    xxx = [0,0,0]; % extending vector that tracks the weather on the last three walks
        while true % start random walk
            D = D+1; % count new day
            x = (rand() < p); % event that it rains or not with probability p
            if x == 1 && S == "home" % if it rains the mathematician transports an umbrella from one place to the other
                m = m-1;
                n = n+1;
                S = "office"; % change location
            elseif x == 1 && S == "office" % if it rains the mathematician transports an umbrella from one place to the other
                m = m+1;
                n = n-1;
                S = "home"; % change location
            elseif x == 0 && S == "home" && sum(xxx(end-2:end))>=1 % if it does not rain and it rained at least once on the last three walks the mathematician takes an umbrella with probability 1/2
                S = "office"; % change location
                c = (rand() < 1/2); % symmetric coinflip if the mathematician takes an umbrella or not
                if c==1 % move umbrella to other location
                    m = m-1;
                    n = n+1;
                end
            elseif x == 0 && S == "office" && sum(xxx(end-2:end))>=1 % if it does not rain and it rained at least once on the last three walks the mathematician takes an umbrella with probability 1/2
                S = "home"; % change location
                c = (rand() < 1/2); % symmetric coinflip if the mathematician takes an umbrella or not
                if c==1 % move umbrella to other location
                    m = m+1;
                    n = n-1;
                end
            elseif x == 0 && S == "home" % if it does not rain and the weather was nice the last three times the mathematician does not take an umbrella
                S = "office"; % change location
            elseif x == 0 && S == "office" % if it does not rain and the weather was nice the last three times the mathematician does not take an umbrella
                S = "home"; % change location
            end
            if m < 0 || n < 0 % the mathematician has gotten wet, leave while-loop
                break
            end
            xxx = [xxx, x]; % add the new weather entry
        end
end % end function