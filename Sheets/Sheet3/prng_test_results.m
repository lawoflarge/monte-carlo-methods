x0=2025;                    % initial values
y0=2025;
n=10e7;                     % sample length

% (a)

% calculate errors for multiplicative congruential generator
u_mcg = mcg(x0,n);
[abs_error_MCM_mcg, rel_error_MCM_mcg, abs_error_OLAF_mcg, rel_error_OLAF_mcg, abs_error_UYR_mcg, rel_error_UYR_mcg] = prng_cat(u_mcg);
MCG = [abs_error_MCM_mcg, rel_error_MCM_mcg, abs_error_OLAF_mcg, rel_error_OLAF_mcg, abs_error_UYR_mcg, rel_error_UYR_mcg]';

% calculate errrors for combined generator
u_cg = cg(x0,y0,n);
[abs_error_MCM_cg, rel_error_MCM_cg, abs_error_OLAF_cg, rel_error_OLAF_cg, abs_error_UYR_cg, rel_error_UYR_cg] = prng_cat(u_cg);
CG = [abs_error_MCM_cg, rel_error_MCM_cg, abs_error_OLAF_cg, rel_error_OLAF_cg, abs_error_UYR_cg, rel_error_UYR_cg]';

% generate table to display results
Errors = {'Absolute error MCM'; 'Relative error MCM'; 'Absolute error OLAF'; 'Relative error OLAF'; 'Absolute error UYR'; 'Relative error UYR'};
Table = table(Errors, MCG , CG);
disp(Table)

