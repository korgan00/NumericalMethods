close all
clear all
clc
format long

f = @(x) x.^3+4*x.^2-10;
ejex = @(x) 0*x;
a = 1;
b = 2;
tol = 10^(-8);
nmax = 1000;

I = [-1:0.01:2];

%plot(I, f(I), I, ejex(I))

[zero, res, niter] = bisection(f, a, b, tol, nmax);

df = @(x) 3*x.^2+8*x;
x0 = b;
[zero, res, niter] = newton(f, df, x0, tol, nmax);

vx0 = [0.5;0.5];
[x, F, niter] = newtonsys(@NewtonSysFun, @NewtonSysJac, vx0, tol, nmax);



phiV = @(x) 3*x./(1+x);
phiP = @(x) 3*x.^2./(1+x.^2);
diag = @(x) x;


I = [-0.1:0.01:4];
subplot(2,1,1);
plot(I, phiV(I), I, diag(I));
subplot(2,1,2);
plot(I, phiP(I), I, diag(I));

x01 = -0.1;
x02 = 1.9;
[x, niter] = puntofijo2(phiV,x01,tol,nmax)
[x, niter] = puntofijo2(phiV,x02,tol,nmax)

[x, niter] = puntofijo2(phiP,x01,tol,nmax)
[x, niter] = puntofijo2(phiP,x02,tol,nmax)
