function [abs_error_MCM, rel_error_MCM, abs_error_OLAF, rel_error_OLAF, abs_error_UYR, rel_error_UYR] = prng_cat(u)

i = ceil(26.*u);                                                             % adapt uniform distribution to alphabet with 26 letters
n = length(u);

% CAT-test for word MCM
MCM = [13,3,13];                                                            % translate word in position in alphabet
tau_MCM = [];                                                               % initialize vector with indices of the positions where MCM is found
first_tau_MCM = find(i == MCM(1));

for j = first_tau_MCM                                                       % search for M, C, M occuring in a row
    if i(j+1) == MCM(2) && i(j+2) == MCM(3)
       tau_MCM = [tau_MCM j];
    end
end
abs_error_MCM = mean(diff(tau_MCM) - 26^3);                                 % calculate absolute average deviation from expected value                                     
rel_error_MCM = abs_error_MCM/26^3;                                         % calculate relative error


% CAT-test for word OLAF, similar to above
OLAF = [15,12,1,6];
tau_OLAF = [];
first_tau_OLAF = find(i == OLAF(1));

for j = first_tau_OLAF
    if i(j+1) == MCM(2) && i(j+2) == OLAF(3) && i(j+3) == OLAF(4)
       tau_OLAF = [tau_OLAF j];
    end
end
abs_error_OLAF = mean(diff(tau_OLAF) - 26^3);
rel_error_OLAF = abs_error_OLAF/26^3;


% CAT-test for word UYR, similar to above
UYR = [20,25,18];
tau_UYR = [];
first_tau_UYR = find(i == UYR(1));

for j = first_tau_UYR
    if i(j+1) == UYR(2) && i(j+2) == UYR(3)
       tau_UYR = [tau_UYR j];
    end
end
abs_error_UYR = mean(diff(tau_UYR) - 26^3);
rel_error_UYR = abs_error_UYR/26^3;


end



