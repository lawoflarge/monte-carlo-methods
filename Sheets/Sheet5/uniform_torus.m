% (c) uniform torus

Monte = 10^4;                                                               % number of samples

% acceptance-rejection-algorithm via uniform distribution on the smallest
% box for the torus

R=3; 
r=1;                                                                        % set parameters
x_values = zeros(1,Monte);                                                  % initialize values
y_values = zeros(1,Monte);
z_values = zeros(1,Monte);
i = 1;                                                                      % loop index

while i <= Monte
    x = unifrnd(-4,4);                                                      % generate random variable x on rectangular cuboid
    y = unifrnd(-4,4);                                                      % generate random variable y on rectangular cuboid
    z = unifrnd(-1,1);                                                      % generate random variable z on rectangular cuboid
    if  vecnorm([x,y]) <= (R+r) && vecnorm([vecnorm([x,y]) - R,z]) <= r     % accept if euclidean norm matches the requirements of being inside the torus
        x_values(i) = x;
        y_values(i) = y;
        z_values(i) = z;
        i = i+1;                                                            % increase loop index i to make sure that the number of generated dots is "Monte"
    end                                                                 
end

figure;
scatter3(x_values, y_values, z_values)                                      % generate scatter plot of results
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Scatter Plot acceptance-rejection-algorithm Torus');
axis equal;                                                                 % equal aspect ratio



% algorithm via polar coordinates without rejection

x_values_2 = zeros(1,Monte);                                                % initialize values
y_values_2 = zeros(1,Monte);
z_values_2 = zeros(1,Monte);

for i = 1:Monte
    radius = sqrt(unifrnd(0,r));                                            % generate random radii uniformly distributed between the inner raidus r
    theta = 2*pi*rand;                                                      % generate random angles uniformly distributed between 0 and 2*pi
    phi = 2*pi*rand;                                                        % generate random angles uniformly distributed between 0 and 2*pi
    x = (R + radius * cos(phi)) * cos(theta);                               % transform polar coordinates to Cartesian coordinates using the parametric equations
    y = (R + radius * cos(phi)) * sin(theta);
    z = radius .* sin(phi);
    x_values_2(i) = x;
    y_values_2(i) = y;
    z_values_2(i) = z;
end

figure;
scatter3(x_values_2, y_values_2, z_values_2)                                 % generate scatter plot of results
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Scatter Plot polar coordinates Torus');
axis equal;                                                                 % equal aspect ratio
