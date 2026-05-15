a1=0.863855;                                                                % optimal a1 parameter derived in other MATLAB script              

% define the objective function
obj = @(x) ( 1/(sqrt(2*pi)) * exp(-x^2/2) - a1 * ((3-x^2)/8 * (abs(x)>=0 && abs(x)<=1) + ((3-abs(x))^2)/16 * (abs(x)>1 && abs(x)<=3)) )  / ( (abs(x)<=(3/2)) * (4/9) * (3/2-abs(x)) );

% plot function to get a sense of a reasonable starting point for recursion
x = linspace(-1, 1, 1000);                                                  % define the range of x values for plotting
y = arrayfun(obj, x);                                                       % compute the corresponding y values for the function
plot(x, y);                                                                 % plot graph
xlabel('x');
ylabel('f(x)');
title('Plot of f');
grid on;

% call the newton function top minimize the objective function
newton(obj);


% define newton optimization algorithm
function newton(obj)
    function df = deriv(x)                                                  % define the derivative function of the objective function
        eps = 10e-8;                                                        % form the differential quotient according to which the derivative is defined
        df = (obj(x + eps) - obj(x - eps)) / (2 * eps);
    end

    function d2f = sec_deriv(x)                                             % define the second derivative of the objective function
        eps = 10e-8;                                                        % analogue to above
        d2f = (obj(x + eps) - 2 * obj(x) + obj(x - eps)) / eps^2;
    end

    x0 = 1;                                                                 % initialize starting point
    tol = 10e-10;                                                           % set convergence criteria
    max_iterations = 10e6;                                                  % set maximum number of steps to prevent crash

    x = x0;                                                                 % newton's method optimization
    for iter = 1:max_iterations                                             % approximate until condition is met
        df = deriv(x);
        d2f = sec_deriv(x);
        step = - df / d2f;                                                  % compute Newton step
        x_new = x + step;                                                   % compare Numerical Mathematics lecture
        if abs(x_new - x) < tol                                             % check desired convergence
            break;
        end
        x = x_new;                                                          % set new x value
    end

    % output result
    if iter < max_iterations
        fprintf('Optimization converged in %d iterations.\n', iter);       
        fprintf('Optimal solution: x = %f, f(x) = %f\n', x, obj(x));
    else
        fprintf('Optimization did not converge within the maximum number of iterations.\n');
    end
end

