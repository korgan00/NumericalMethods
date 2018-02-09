close all
clear all
clc
format long


f = @(x) x.^4 -1 - e.^(-x).*x.^2;
df = @(x) e.^(-x) .* x .*(-2 + x + 4 * e.^x .* x.^2);
I = [0:0.01:2];
ejex = @(x) 0*x;
x_y = @(x) x;
tol = 10^(-6);
nmax = 1000;

#{
subplot(2,2,1);
plot(I, f(I), I, ejex(I));
subplot(2,2,2);
plot(I, df(I), I, ejex(I));
#}

phiN = @(x) x - f(x)/df(x);
phi1 = @(x) (1 + e.^(-x) .* x.^2).^(1/4);
phi2 = @(x) x + f(x);

subplot(3,1,1);
plot(I, phiN(I), I, ejex(I), I, x_y(I));
title("phiN" )
subplot(3,1,2);
plot(I, phi1(I), I, ejex(I), I, x_y(I));
title("phi1")
subplot(3,1,3);
plot(I, phi2(I), I, ejex(I), I, x_y(I));
title("phi2")


x01 = 1;
x02 = 1.5;
[xN1, niterN1] = puntofijo2(phiN,x01,tol,nmax)
[xN2, niterN2] = puntofijo2(phiN,x02,tol,nmax)

[x11, niter11] = puntofijo2(phi1,x01,tol,nmax)
[x12, niter12] = puntofijo2(phi1,x02,tol,nmax)

[x21, niter21] = puntofijo2(phi2,x01,tol,nmax)
[x22, niter22] = puntofijo2(phi2,x02,tol,nmax)