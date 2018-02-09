close all
clear all
clc
format long

n = 4;
A1_2 = A1_1 = [15  6  8 11;
                6  6  5  3; 
                8  5  7  6;
               11  3  6  9];
b = [1 1 1 1]';

A2_2 = A2_1 = A1_1 * A1_1;
A3_2 = A3_1 = A2_1 * A1_1;
A4_2 = A4_1 = A3_1 * A1_1;



% A1
%% LUGAUSS
A1_1 = lugauss(A1_1);

L = eye(n) + tril(A1_1, -1);
U = triu(A1_1);
y = L \ b;
x_lugauss_A1 = U \ y


%% LU
[L, U, P] = lu(A1_2);
y = L \ b;
x_lu_A1 = U \ y

%% \b
x_A1_b = A1_2 \ b



% A2
%% LUGAUSS
A2_1 = lugauss(A2_1);

L = eye(n) + tril(A2_1, -1);
U = triu(A2_1);
y = L \ b;
x_lugauss_A2 = U \ y


%% LU
[L, U, P] = lu(A2_2);
y = L \ b;
x_lu_A2 = U \ y

%% \b
x_A2_b = A2_2 \ b


% A3
%% LUGAUSS
A3_1 = lugauss(A3_1);

L = eye(n) + tril(A3_1, -1);
U = triu(A3_1);
y = L \ b;
x_lugauss_A3 = U \ y


%% LU
[L, U, P] = lu(A3_2);
y = L \ b;
x_lu_A3 = U \ y

%% \b
x_A3_b = A3_2 \ b



% A4
%% LUGAUSS
A4_1 = lugauss(A4_1);

L = eye(n) + tril(A4_1, -1);
U = triu(A4_1);
y = L \ b;
x_lugauss_A4 = U \ y


%% LU
[L, U, P] = lu(A4_2);
y = L \ b;
x_lu_A4 = U \ y

%% \b
x_A4_b = A4_2 \ b