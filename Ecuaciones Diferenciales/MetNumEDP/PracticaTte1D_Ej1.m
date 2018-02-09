clc;
clear all;
close all;
format long;

q = 200;
S = 100;
D = 8.8*10^7;
l = 50;

h = 1;
a = 0;
b = l;
ua = 0;
ub = 0;
N = (b-a)/h -1;


mu = -1;
eta = 0;
sigma = -S/D;

f = @(x) ((-q.*l)./(2*D)).*x + (q./(2.*D))*(x.^2);

[x1,u1] = bvp(a,b,N,mu,eta,sigma,f,ua,ub);

zeroFun = @(x) x*0;
maxDeflFun = @(x) (x.^0)/10;
plot(x1, zeroFun(x1), x1, u1, x1, maxDeflFun(x1));
legend('zero', 'a) deflexion', 'b) max deflexion');
title("\nDeflexion de la placa\nSupera la deflexion maxima de la normativa");
