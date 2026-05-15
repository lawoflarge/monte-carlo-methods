% implement the standard Monte Carlo simulation
function J = train % define function
    U = rand(1,9); % sample nine uniformly distributed random variables
    X1 = 2.5 + U(1); % compute x values
    X2 = 2 + U(2);
    X3 = 1.5 + 0.2 * (U(3) + U(4) - 1) / 2;
    X4 = 2.5 + (U(5) + U(6) - 1) / 2;
    X5 = 4.5 + (U(7) + U(8) + U(9) - 3/2) / 3;
    J = min([X1+X2, X3+X4+X2, X3+X5, X1+X4+X5]); % derive minimum of ways from Mannheim to London
end