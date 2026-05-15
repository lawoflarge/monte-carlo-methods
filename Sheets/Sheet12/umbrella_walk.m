function D = umbrella_walk(p,m,n) % implement function to model one random walk
    D = 0; % initialize parameters
    S = "home";
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
            elseif x == 0 && S == "home" % if it does not rain the mathematician does not take an umbrella
                S = "office"; % change location
            elseif x == 0 && S == "office" % if it does not rain the mathematician does not take an umbrella
                S = "home"; % change location
            end
            if m < 0 || n < 0 % the mathematician has gotten wet, leave while-loop
                break
            end
        end
end % end function