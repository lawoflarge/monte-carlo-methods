% implement the standard Monte Carlo simulation
function J = train_anti % define function
    U = rand(1,9); % sample nine uniformly distributed random variables
    X1 = 2.5 + U(1); % compute x values
    X2 = 2 + U(2);
    X3 = 1.5 + 0.2 * (U(3) + U(4) - 1) / 2;
    X4 = 2.5 + (U(5) + U(6) - 1) / 2;
    X5 = 4.5 + (U(7) + U(8) + U(9) - 3/2) / 3;
    X = [X1, X2, X3, X4, X5]; % condense random vector
    y = [3, 2.5, 1.5, 2.5, 4.5]; % symmetry vector of X
    X_t = 2*y - X; % perform reflection to obtain transformed random bector
    J1 = min([X(1)+X(2), X(3)+X(4)+X(2), X(3)+X(5), X(1)+X(4)+X(5)]); % derive minimum of ways from Mannheim to London for the original random vector
    J2 = min([X_t(1)+X_t(2), X_t(3)+X_t(4)+X_t(2), X_t(3)+X_t(5), X_t(1)+X_t(4)+X_t(5)]); % derive minimum of ways from Mannheim to London for the transformed random vector
    J = 1/2 * (J1 + J2); % compute sample for the antithetic Monte Carlo estimator
end