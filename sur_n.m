clear;
x = -pi:0.1:pi;
y = -pi:0.1:pi;
[X, Y] = meshgrid(x, y);
Z = 20 - X.^2 - Y.^2;
surf(X, Y, Z);
shading interp;

hold on;

f = @(x, y) 20 - x.^2 - y.^2;

x0 = 0;
y0 = -1;
z0 = f(x0, y0);

h = 0.000001;
f_der_x = (f(x0+h, y0) - f(x0, y0)) / h;
f_der_y = (f(x0, y0+h) - f(x0, y0)) / h;

n_ort = [-f_der_x -f_der_y 1] / sqrt((f_der_x)^2 + (f_der_y)^2 + 1);

x_norm = [x0 x0+n_ort(1)];
y_norm = [y0 y0+n_ort(2)];
z_norm = [z0 z0+n_ort(3)];

plot3(x_norm, y_norm, z_norm);
axis equal;
