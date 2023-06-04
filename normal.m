function normal(f, x0, y0)
  x = -pi:0.1:pi;
  y = -pi:0.1:pi;
  [X, Y] = meshgrid(x, y);
  Z = f(X,Y);
  surf(X, Y, Z);
  shading interp;
  hold on;

  z0 = f(x0, y0);

  h = 0.000001;
  f_dx = (f(x0+h, y0) - f(x0, y0)) / h;
  f_dy = (f(x0, y0+h) - f(x0, y0)) / h;

  n_ort = [-f_dx -f_dy 1] / sqrt((f_dx)^2 + (f_dy)^2 + 1);

  x_norm = [x0 x0 + n_ort(1)*20];
  y_norm = [y0 y0 + n_ort(2)*20];
  z_norm = [z0 z0 + n_ort(3)*20];

  plot3(x_norm, y_norm, z_norm);
  axis equal;
  hold off;
end
