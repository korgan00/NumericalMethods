clc;
clear all;
close all;
format long;


f = @(x, y) 8*pi^2 * sin(2*pi.*x) * cos(2*pi.*y);

h1 = 1 / 10;
h2 = 1 / 20;
h3 = 1 / 30;

a = c = 0; 
b = d = 1;

bound = @(x) sin(2*pi.*x);
uex = @(x, y) sin(2*pi.*x) * cos(2*pi.*y);

nxy1 = (b - a) / h1;
nxy2 = (b - a) / h2;
nxy3 = (b - a) / h3;

[u1, x1, y1, error1] = poissonfd(a, c, b, d, nxy1, nxy1, f, bound, uex);
[u2, x2, y2, error2] = poissonfd(a, c, b, d, nxy2, nxy2, f, bound, uex);
[u3, x3, y3, error3] = poissonfd(a, c, b, d, nxy3, nxy3, f, bound, uex);


subplot(2, 2, 1);
mesh(x1, y1, u1);
title("h1=1/10");
subplot(2, 2, 2);
mesh(x2, y2, u2);
title("h2=1/20");
subplot(2, 2, 3);
mesh(x3, y3, u3);
title("h3=1/30");
subplot(2, 2, 4);
plot([1 2 3], [error1, error2, error3]);
title("Error para h1, h2 y h3");