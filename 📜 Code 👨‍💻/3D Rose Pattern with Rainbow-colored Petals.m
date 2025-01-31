% Parameters
n = 800;  % Number of points
A = 2.5;  % Adjusted A to widen the petals
B = 1.27689;
C = 8;
petalNum = 2.8;  % Reduced petalNum to adjust the petal shape and size
scaleFactor = 3;  % Scaling factor to enlarge the rose

% Generate the radial and angular coordinates
r = linspace(0, 1, n);
theta = linspace(-2, 20*pi, n);
[R, THETA] = ndgrid(r, theta);

% Define the rose curve and phi based on the given equations
x = 1 - (1/2)*((5/4)*(1 - mod(petalNum*THETA, 2*pi)/pi).^2 - 1/4).^2;
phi = (pi/2)*exp(-THETA/(C*pi));

% Calculate the y and R2 components
y = A*(R.^2).*(B*R - 1).^2.*sin(phi);
R2 = x.*(R.*sin(phi) + y.*cos(phi));

% Parametric coordinates for the 3D surface plot
X = R2 .* sin(THETA);
Y = R2 .* cos(THETA);
Z = x .* (R .* cos(phi) - y .* sin(phi));

% Apply scaling to expand the rose pattern
X = X * scaleFactor;  % Scale the X coordinates
Y = Y * scaleFactor;  % Scale the Y coordinates
Z = Z * scaleFactor;  % Scale the Z coordinates

% Create a rainbow colormap for the surface plot
rainbow_map = jet(n);  % Use the "jet" colormap for a rainbow effect

% Plotting the surface with rainbow color map
figure;
surf(X, Y, Z, Z, 'LineStyle', 'none');  % Use Z to color the surface
view([-40.50, 42.00]);  % Set the view angle

% Apply the rainbow colormap
colormap(rainbow_map);

% Add titles and labels
title(['               3D Rose Pattern with Rainbow-Colored Petals']);
xlabel('X');
ylabel('Y');
zlabel('Z');
colorbar;  % Show color scale