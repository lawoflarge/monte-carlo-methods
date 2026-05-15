n=10e7;                     % sample length


% (b)

x0 = 2017;                  % initial values
y0 = 2017;
z0 = 1889;

u_mcg2 = mcg2(z0,n);        % generate output
u_mcg = mcg(x0,n);
u_cg = cg(x0,y0,n);



% Chi Squared test

[D_2, quantiles_2, D_3, quantiles_3] = prng_chi(u_mcg2);
chitest_u_mcg2 = [D_2, quantiles_2, D_3, quantiles_3];
disp(chitest_u_mcg2)

[D_2, quantiles_2, D_3, quantiles_3] = prng_chi(u_mcg);
chitest_u_mcg = [D_2, quantiles_2, D_3, quantiles_3];
disp(chitest_u_mcg)

[D_2, quantiles_2, D_3, quantiles_3] = prng_chi(u_cg);
chitest_u_cg = [D_2, quantiles_2, D_3, quantiles_3];
disp(chitest_u_cg)