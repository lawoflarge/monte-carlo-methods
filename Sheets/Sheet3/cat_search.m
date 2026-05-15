function [rel_error_WORD] = cat_search(u,a,b,c)


% CAT test

tau_WORD = [];
i = ceil(26.*u);
first_tau_WORD = find(i == a);

for j = first_tau_WORD                                                      
    if i(j+1) == b && i(j+2) == c
       tau_WORD = [tau_WORD j];
    end
end

abs_error_WORD = mean(diff(tau_WORD) - 26^3);
rel_error_WORD = abs_error_WORD/26^3;                                       % give back relative error                                    