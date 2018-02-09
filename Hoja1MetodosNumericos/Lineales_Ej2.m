close all
clear all
clc
format long

      
A = [[0 0.06 0.14 0.25 0.31 0.47 0.60 0.70]; ones(1,8)]';
b = [0 0.08 0.14 0.20 0.23 0.25 0.28 0.29]';

[Q, R] = qr(A);

Qt = Q(:, 1:2); Rt = R(1:2,:);
xstar = Rt\(Qt' * b);

sigma = xstar(1)
epsilon = xstar(2)