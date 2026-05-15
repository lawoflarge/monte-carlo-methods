n=10e7;                     % sample length


% (c)

WORD = [];
n=10e7;                     % sample length




% search for 3-letter word and initial values x0 and z0
tic
for x0 = 1:10e5
    for z0 = 1:10e5
        for a = 1:26
            for b = 1:26
                for c = 1:26
                    u_mcg = mcg(x0,n);
                    u_mcg2 = mcg2(z0,n);

                    rel_error_WORD_mcg = cat_search(u_mcg,a,b,c);
                    rel_error_WORD_mcg2 = cat_search(u_mcg2,a,b,c);

                    if abs(rel_error_WORD_mcg) < 0.1 && abs(rel_error_WORD_mcg2) < 0.1
                        WORD = [a,b,c];
                        initial_values = [x0, z0];
                        break       % leave loop if fit is found
                    end
                end
            end
        end
    end
end
toc


% results

disp(WORD)
disp(initial_values)


% Chi statistic

[D_3, quantiles_3] = prng_chi_5(u_mcg);
disp([D_3, quantiles_3])

[D_3, quantiles_3] = prng_chi_5(u_mcg2);
disp([D_3, quantiles_3])

% computational time

time = toc;

% display elapsed time
fprintf('Elapsed time: %.4f seconds\n', time);
