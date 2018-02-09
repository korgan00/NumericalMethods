clc;
clear all;
close all;

f = @(x) x*0;
a = 0; b = 1;
h = 0.1;
N = (b-a)/h -1;
V1 = 1; V2 = 25; V3 = 100;
mu = 1;
eta = V1;
sigma = 0;

ua = 0; ub = 1;

[x1,u1] = bvp(a,b,N,mu,V1,sigma,f,ua,ub);
[x2,u2] = bvp(a,b,N,mu,V2,sigma,f,ua,ub);
[x3,u3] = bvp(a,b,N,mu,V3,sigma,f,ua,ub);

sol = @(x, v) (exp(v*x)-1)./(exp(v)-1);
subplot(1,3,1);
plot(x1, u1, x1, sol(x1, V1));
legend('aprox', 'exacta');
title('V=1');
subplot(1,3,2);
plot(x2, u2, x2, sol(x2, V2));
legend('aprox', 'exacta');
title('V=25');
subplot(1,3,3);
plot(x3, u3, x3, sol(x3, V3));
legend('aprox', 'exacta');
title('V=100');


[x1,u1] = bvpModificado(a,b,N,mu,V1,sigma,f,ua,ub);
[x2,u2] = bvpModificado(a,b,N,mu,V2,sigma,f,ua,ub);
[x3,u3] = bvpModificado(a,b,N,mu,V3,sigma,f,ua,ub);

figure
sol = @(x, v) (exp(v*x)-1)./(exp(v)-1);
subplot(1,3,1);
plot(x1, u1, x1, sol(x1, V1));
legend('aprox', 'exacta');
title('V=1');
subplot(1,3,2);
plot(x2, u2, x2, sol(x2, V2));
legend('aprox', 'exacta');
title('V=25');
subplot(1,3,3);
plot(x3, u3, x3, sol(x3, V3));
legend('aprox', 'exacta');
title('V=100');