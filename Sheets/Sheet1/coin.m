function [c , r] = coin(n,a) 
                                    % n players, a coins

r = 0;                              % number of rounds
c = a*ones(1,n);                    % starting coins
coins_aside = 0;                    % initial set of coins on the side

while min(c)>0
    u=rand(1,n);                    % generate random numbers       
    x=(u<1/2);                     
    
    if sum(x==1)==n || sum(x==1)==0 % all or no coins show heads
        c=c-ones(1,n);              % all coins are put aside
        coins_aside= coins_aside+n;
    
    elseif sum(x==1)==1             % exactly one coin shows head           
       
        if max(coins_aside)==0      % set is empty
            c=c-(x==0);             % no coin
            coins_aside=coins_aside + n-1;

        else                        % set is not empty
            c=c-(x==0)+(x==1);      % player gets a coin
            coins_aside=coins_aside + n-2;
        end

    else                            % if >=2 and <n coins show head
        c=c-(x==0);                 % only that players get their coins back
    end

    r=r+1;                          % rounds plus one
end



