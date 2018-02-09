close all
clear all
clc
format long


f = @(x) x.^7 - x - cos(x) + 1;
df = @(x) 7 * x.^6 + sin(x) - 1;
ddf = @(x) 42 * x.^5 + cos(x);
I = [-1.2:0.01:1.2];
ejex = @(x) 0*x;
tol = 10^(-5);
nmax = 1000;


subplot(3,1,1);
plot(I, ejex(I), I, f(I));
subplot(3,1,2);
plot(I, ejex(I), I, df(I));
subplot(3,1,3);
plot(I, ejex(I), I, ddf(I));

%{
a1 = -1.2;
b1 = -1;
[zero, res, niter] = bisection(f, a1, b1, tol, nmax);

a2 = -0.5;
b2 = 0.5;
[zero, res, niter] = bisection(f, a2, b2, tol, nmax);

a3 = 0.5;
b3 = 1.5;
[zero, res, niter] = bisection(f, a3, b3, tol, nmax);
%}


a1 = 0;
b1 = 1;
[zero, res, niter] = bisection(df, a1, b1, tol, nmax);

localMin = zero

a2 = -1;
b2 = 0;
[zero, res, niter] = bisection(df, a2, b2, tol, nmax);

localMax = zero

a3 = -1;
b3 = 1;
[zero, res, niter] = bisection(ddf, a3, b3, tol, nmax);

inflexion = zero

newtonSysF = @(x) [x(1).^2 + x(2).^2 - 1; f(x(1)) - x(2)]
newtonSysJ = @(x) [2*x(1), -2*x(2); df(x(1)), df(0)]

vx0 = [0.5;0.5];
[x, F, niter] = newtonsys(@newtonSysF, @NewtonSysJac, vx0, tol, nmax);
