close all
clear all
clc
format long


A = [3 2; 2 6];
b = [2; -8];
x0 = [0; 0];
nmax = 1000;
tol = 10^(-6);

[x, iter] = itermeth(A,b,x0,nmax,tol, 'J');
printf("Hacen falta %d iteraciones para una tolerancia %f\n\n", iter, tol)


for i = 1:iter
    [x, iter2] = itermeth(A, b, x0, i, tol, 'J');
    printf("Iteracion %d: [%f; %f]\n", i, x(1), x(2));
end
