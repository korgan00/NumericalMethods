clc;
clear all;
close all;
format long;

f = @(t,i) (t-1).*(i-(i.^2));
y0 = 1/2;
tspan = [0 2];
h = 0.004;

[t,y2] = rk2(f,tspan,y0,3/h);

pos1_24 = lookup(t, 1.24);

sol = @(t) exp((1/2)*(t.^2)-t)./(1+exp((1/2)*(t.^2)-t));

sol1 = sol(t);

solValue1_24 = sol1(pos1_24)

err = abs(y2 - sol1);

rk2Err1_24 = err(pos1_24)

figure
subplot(2,2,1);
plot(t, y2, t, sol1);
legend("aprox", "Exacta");
title("RK2")

subplot(2,2,2);
plot(t, err);
title("RK2 ERROR")


[t,y3] = rk3(f,tspan,y0,3/h);

err = abs(y3 - sol1);
rk3Err1_24 = err(pos1_24)

subplot(2,2,3);
plot(t, y3, t, sol1);
legend("aprox", "Exacta");
title("RK3")

subplot(2,2,4);
plot(t, err);
title("RK3 ERROR")


if(rk2Err1_24 < rk3Err1_24)
  disp("RK2 es mas preciso")
else
  disp("RK3 es mas preciso")
endif

disp("\n\n")



t2 = [0:10^-6:2];
sol2 = sol(t2);
allTIntervalSol = t2(find(sol2<0.4));
allTIntervalRK2 = t(find(y2<0.4));
allTIntervalRK3 = t(find(y3<0.4));

aSol = allTIntervalSol(1)
bSol = allTIntervalSol(end)
disp("\n")
aRK2 = allTIntervalRK2(1)
bRK2 = allTIntervalRK2(end)
disp("\n")
aRK3 = allTIntervalRK3(1)
bRK3 = allTIntervalRK3(end)




