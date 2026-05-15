function [D_2, quantiles_2, D_3, quantiles_3] = prng_chi(u)

alphabet = [1,2,3,4,5,6,7,8,9,10];                                          % implement alphabet of 10 letters
i = ceil(10*u);

O_2 = [];                                                                   % initialize observed relative frequencies for words of length 2 and 3
O_3 = [];

E_2 = (1/length(alphabet)^2)*ones(1,(length(alphabet))^2);                  % expected frequencies for words of length 2 and 3
E_3 = (1/length(alphabet)^3)*ones(1,(length(alphabet))^3);

count = 0;

% implement Chi test for 2 letter words
for o1 = alphabet
    for o2 = alphabet
        for k = i
            if k == o1 && k+1 == o2
                count = count+1;
            end
        end
        O_2 = [O_2 count/(length(alphabet))^2];                             % observed frequency
        count = 0;
    end
end

% Chi squared statistic
D_2 = sum((O_2-E_2).^2./E_2);

% compare to quantiles of chi squared distribution
Q_2 = (size(O_2, 1) - 1) * (size(O_2, 2) - 1);
quantiles_2 = chi2inv([0.75, 0.90, 0.95, 0.99], Q_2);





count = 0;

% implement Chi test for 3 letter words
for o1 = alphabet
    for o2 = alphabet
        for o3 = alphabet
            for k = i
                if k == o1 && k+1 == o2
                    count = count+1;
                end
            end
            O_3 = [O_3 count/(length(alphabet))^3];                             % observed frequency
            count = 0;
        end
    end
end

% Chi squared statistic
D_3 = sum((O_3-E_3).^2./E_3);

% compare to quantiles of chi squared distribution
Q_3 = (size(O_3, 1) - 1) * (size(O_3, 2) - 1);
quantiles_3 = chi2inv([0.75, 0.90, 0.95, 0.99], Q_3);

end