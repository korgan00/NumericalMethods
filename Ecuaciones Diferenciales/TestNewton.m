close all
clear all
format long

f = @(x) x.^3+4*x.^2-10;
df = @(x) 3*x.^2+8*x;
ejex = @(x) 0*x;
x0 = 2;
tol = 10^(-3);
nmax = 1000;

I = [-10:0.01:10];

plot(I, f(I), I, ejex(I), I, df(I))

[zero, res, niter] = newton(f,df,x0,tol,nmax)