% (b) uniform ring

Monte = 10^3;                                                               % number of samples

% acceptance-rejection-algorithm via uniform distribution on a square area

R=4; 
r=2;                                                                        % set parameters
x_values = zeros(1,Monte);                                                  % initialize values
y_values = zeros(1,Monte);
i = 1;                                                                      % loop index

while i <= Monte
    x = 8*rand()-4;                                                         % generate random variable x on square area
    y = 8*rand-4;                                                           % generate random variable y on square area
    if norm([x,y]) <= R && norm([x,y]) >= r                                 % accept if euclidean norm is between r and R
        x_values(i) = x;
        y_values(i) = y;
        i = i+1;                                                            % increase loop index i to make sure that the number of generated dots is "Monte"
    end                                                                 
end

figure;
scatter(x_values, y_values)                                                 % generate scatter plot of results
xlabel('X-axis');
ylabel('Y-axis');
title('Scatter Plot acceptance-rejection-algorithm Ring');
axis equal;                                                                 % equal aspect ratio


% algorithm via polar coordinates without rejection

x_values_2 = zeros(1,Monte);                                             % initialize values
y_values_2 = zeros(1,Monte);

for i = 1:Monte
    radius = sqrt(rand * (R^2 - r^2) + r^2);                                % generate random radii uniformly distributed between the inner raidus r and outer radius R
    phi = 2*pi*rand;                                                        % generate random angles uniformly distributed between 0 and 2*pi
    x = radius*cos(phi);                                                    % transform polar coordinates to Cartesian coordinates
    y = radius*sin(phi);
    x_values_2(i) = x;
    y_values_2(i) = y;
end

figure;
scatter(x_values_2, y_values_2)                                        % generate scatter plot of results
xlabel('X-axis');
ylabel('Y-axis');
title('Scatter Plot polar coordinates Ring');
axis equal;                                                                 % equal aspect ratio
