clc;
clear all;
close all;

format long;

L = 1;
T = 10;
xspan = [0,L];
tspan = [0,T];
IncT = 0.05;
IncX = 0.02;
nstep = [L/IncX, T/IncT];

theta = 0.5; 
alpha = 1;
u0 = @(x) x*0;
g = @(x, t) x.^2.*(x-1);
f = @(x, t) 2*t - x.^2 + 10*x.*t;

coef_estab = alpha * (1-2*theta) * IncT/IncX^2

[x,u] = heattheta(xspan,tspan,nstep,theta,alpha,u0,g,f);

plot(x,u);