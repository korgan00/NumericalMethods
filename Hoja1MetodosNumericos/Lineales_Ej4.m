close all
clear all
clc
format long


A = [2, 1; 1, 3];
b = [1; 0];
x0 = [1; 1/2];
xReal = [3/5 -1/5]';
M1 = [];
M2 = [];
maxit = 1000;
tol = 10 ^ (-5);


[xJacobi, iterJacobi, errListJacobi] = itermethErr(A, b, x0, maxit, tol, 'J')
[xGaussSeidel, iterGaussSeidel, errListGauss] = itermethErr(A, b, x0, maxit, tol, 'G')
[x, flag, relres, iterPCG, resvec, eigest] = pcg(A, b, tol, maxit, M1, M2, x0)

errListPCG = [];
for i = resvec(2:iterPCG+1,:)'
  errListPCG = [errListPCG norm(i)]
endfor

resJacobi = [xJacobi-xReal];
resGauss = [xGaussSeidel-xReal];

subplot(3,1,1);
plot([1:1:iterJacobi], errListJacobi);
title("Jacobi residual per iteration");
subplot(3,1,2);
plot([1:1:iterGaussSeidel], errListGauss);
title("GaussSeidel residual per iteration");
subplot(3,1,3);
plot([1:1:iterPCG], errListPCG);
title("PCG residual per iteration");