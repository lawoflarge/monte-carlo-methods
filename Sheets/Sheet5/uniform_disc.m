% (a) uniform disc

Monte = 10^7;                                                               % number of samples

% acceptance-rejection-algorithm via uniform distribution on a square area

x_values = zeros(1,Monte);                                                  % initialize values
y_values = zeros(1,Monte);
i = 1;                                                                      % loop index

tic;
while i <= Monte
    x = 2*rand()-1;                                                         % generate random variable distributed according to Q_g
    u = rand;                                                               % generate random variable uniformly distributed on (0,1)
    y = 2*u-1;
    if norm([x,y]) <= 1                                                     % accept if euclidean norm is equal or less than 1
        x_values(i) = x;
        y_values(i) = y;
        i = i+1;                                                            % increase loop index i to make sure that the number of generated dots is "Monte"
    end                                                                 
end
time_acceptance_rejection = toc;                                            % stop time

figure;
scatter(x_values, y_values)                                                 % generate scatter plot of results
xlabel('X-axis');
ylabel('Y-axis');
title('Scatter Plot acceptance-rejection-algorithm Disc');
axis equal;                                                                 % equal aspect ratio


% algorithm via polar coordinates without rejection

x_values_2 = zeros(1,Monte);                                             % initialize values
y_values_2 = zeros(1,Monte);

tic;
for i = 1:Monte
    r = sqrt(rand);                                                         % generate random radii uniformly distributed between 0 and 1
    phi = 2*pi*rand;                                                        % generate random angles uniformly distributed between 0 and 2*pi
    x = r*cos(phi);                                                         % transform polar coordinates to Cartesian coordinates
    y = r*sin(phi);
    x_values_2(i) = x;
    y_values_2(i) = y;
end
time_polar_coordinates = toc;                                               % stop time

figure;
scatter(x_values_2, y_values_2)                                        % generate scatter plot of results
xlabel('X-axis');
ylabel('Y-axis');
title('Scatter Plot polar coordinates Disc');
axis equal;                                                                 % equal aspect ratio
