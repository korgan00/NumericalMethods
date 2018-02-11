clc;
clear all;
close all;
format long;
graphics_toolkit('gnuplot');

EULER_EXPLICITO = 0;
T = 30;
L = 2;
alpha = 0.004;

f = @(x, t) 2 - x + e^(-2*t);
g = @(x, t) ( 2/(1 + (t-(1/2)).^2) ) - ( x.*(2-x) );

u0 = inline('2.*(1 - x).^2.*(heaviside(x-1/2)-heaviside(x-3/2))', 'x');


xspan = [0, L];
tspan = [0, T];
nstep = [L / 0.02, T / 0.06];

theta = EULER_EXPLICITO;
[x1,u1] = heattheta(xspan, tspan, nstep, theta, alpha, u0, g, f);


nstep = [L / 0.02, T / 0.05];
theta = EULER_EXPLICITO;
[x2,u2] = heattheta(xspan, tspan, nstep, theta, alpha, u0, g, f);

subplot(2, 2, 1);
plot(x1, u1);
title("A: DeltaT = 0.06: INESTABLE");
subplot(2, 2, 2);
plot(x2, u2);
title("B: DeltaT = 0.05: ESTABLE");


posX = 0.96;

idx = find(x2 == posX);
heatXPost = u2(idx);
heatXPre = u0(idx);

subplot(2, 2, 3);
plot([1,2], [heatXPre, heatXPost]);
if (heatXPost < heatXPre)
  title(["C: El punto " num2str(posX,'%02d')  " se ha enfriado"])
elseif (heatXPost > heatXPre)
  title(["C: El punto " num2str(posX,'%02d')  " se ha calentado"])
else
  title(["C: El punto " num2str(posX,'%02d')  " tiene la misma temperatura"])
end


a = 0;
b = L = 2;
ua = 0 ; 
ub = uL = 0;
h = 0.02;
N = ((b - a) / h) - 1; 
mu = alpha; 
eta = 0; 
sigma = 0;
f = @(x) 2 - x;

uex = @(x) (1 / alpha) * (((1/6).*x^3) - x^2 + ((4/3) * x));

[x1, u1] = bvp(a, b, N, mu, eta, sigma, f, ua, ub);

subplot(2, 2, 4);
plot(x1, u1);
title("D: BVP");

printf("Temperatura "); maxima = max(u1)
printf("Error "); cometido = max(u1) - uex(x1(find(max(u1) == u1)))


tol = 10^-3;
nmax = 1000;
x0_1 = 0;
x0_2 = 2;
df = @(x) (1/alpha) * (((1/2) .* x^2) - (2 .* x) +  (4/3));

printf("NEWTON\n");

[zero1, res, niter1] = newton(@(x)(uex(x) - 75), df, x0_1, tol, nmax);
[zero2, res, niter2] = newton(@(x)(uex(x) - 75), df, x0_2, tol, nmax);

printf("Hay mas de 75 grados en el "); intervaloNewton = [zero1 zero2]


phi = @(x) x - (uex(x) - 75)/ df(x);
[xN1, niterN1] = puntofijo2(phi, x0_1, tol, nmax);
[xN2, niterN2] = puntofijo2(phi, x0_2, tol, nmax);

printf("Hay mas de 75 grados en el "); intervaloPuntoFijo = [xN1 xN2]


diferenciaPrecision = intervaloNewton - intervaloPuntoFijo
diferenciaIteraciones = [niter1 niter2] - [niterN1 niterN2]

%Exacta
