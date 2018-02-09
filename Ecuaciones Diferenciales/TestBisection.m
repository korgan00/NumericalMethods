close all
clear all
format long

f = @(x) x.^3+4*x.^2-10;
ejex = @(x) 0*x;
a = 1;
b = 2;
tol = 10^(-3);
nmax = 1000;

I = [-1:0.01:2];

plot(I, f(I), I, ejex(I))

[zero, res, niter] = bisection(f,a,b,tol,nmax)