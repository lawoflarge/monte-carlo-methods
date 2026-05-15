x0=2025;
y0=2025;
n=10e3;

% CODE KOMMENTIEREN

u_mcg = mcg(x0,n);
errors_mcg = prng_cat(u_mcg);

u_cg = cg(x0,y0,n);
errors_cg = prng_cat(u_cg);