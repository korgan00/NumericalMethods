clc;
clear all;
close all;

f = @(t,i) 10*(2-i);
y0 = 1;
tspan = [0 3];
h1 = 0.3;
h2 = 0.15;
h3 = 0.05;

[t1,y1] = feuler(f,tspan,y0,3/h1);
[t2,y2] = feuler(f,tspan,y0,3/h2);
[t3,y3] = feuler(f,tspan,y0,3/h3);

t03fe = y3(lookup(t3, 0.3))

sol = @(t) 2-exp(-10*t);

sol1 = sol(t1);
sol2 = sol(t2);
sol3 = sol(t3);

feuErr1 = abs(y1 - sol1);
feuErr2 = abs(y2 - sol2);
feuErr3 = abs(y3 - sol3);

figure
subplot(2,2,1);
plot(t1, y1, t1, sol1);
legend("aprox", "Exacta");
title("T1 feuler")

subplot(2,2,2);
plot(t2, y2, t2, sol2);
legend("aprox", "Exacta");
title("T2 feuler")

subplot(2,2,3);
plot(t3, y3, t3, sol3);
legend("aprox", "Exacta");
title("T3 feuler")

subplot(2,2,4);
plot(t2, feuErr2, t3, feuErr3);
legend("Error2", "Error3");
title("ERROR")



[t1,y1] = beuler(f,tspan,y0,3/h1);
[t2,y2] = beuler(f,tspan,y0,3/h2);
[t3,y3] = beuler(f,tspan,y0,3/h3);

t03be = y3(lookup(t3, 0.3))


beuErr1 = abs(y1 - sol1);
beuErr2 = abs(y2 - sol2);
beuErr3 = abs(y3 - sol3);

figure
subplot(2,2,1);
plot(t1, y1, t1, sol1);
legend("aprox", "Exacta");
title("T1 beuler")

subplot(2,2,2);
plot(t2, y2, t2, sol2);
legend("aprox", "Exacta");
title("T2 beuler")

subplot(2,2,3);
plot(t3, y3, t3, sol3);
legend("aprox", "Exacta");
title("T3 beuler")

subplot(2,2,4);
plot(t1, beuErr1, t2, feuErr2, t3, feuErr3);
legend("Error1", "Error2", "Error3");
title("ERROR")


[t1,y1] = cranknic(f,tspan,y0,3/h1);
[t2,y2] = cranknic(f,tspan,y0,3/h2);
[t3,y3] = cranknic(f,tspan,y0,3/h3);

t03cn = y3(lookup(t3, 0.3))
%t1 = t1';
%t2 = t2';
%t3 = t3';

cnErr1 = abs(y1 - sol1);
cnErr2 = abs(y2 - sol2);
cnErr3 = abs(y3 - sol3);

figure
subplot(2,2,1);
plot(t1, y1, t1, sol1);
legend("aprox", "Exacta");
title("T1 cranknic")

subplot(2,2,2);
plot(t2, y2, t2, sol2);
legend("aprox", "Exacta");
title("T2 cranknic")

subplot(2,2,3);
plot(t3, y3, t3, sol3);
legend("aprox", "Exacta");
title("T3 cranknic")

subplot(2,2,4);
plot(t1, cnErr1, t2, cnErr2, t3, cnErr3);
legend("Error1", "Error2", "Error3");
title("ERROR")


feErr03 = feuErr3(lookup(t3, 0.3))

beErr03 = beuErr3(lookup(t3, 0.3))

cnErr03 = cnErr3(lookup(t3, 0.3))
