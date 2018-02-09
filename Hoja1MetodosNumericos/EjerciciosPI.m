format long

N = [1:1000:1000000];

subplot(3,1,1)
plot(N, abs(arrayfun(@MontecarloPI, N)' - pi))
title("Ej1 : Error de Montecarlo PI")


N = [1:1:20];
subplot(3,1,2)
%arrayfun (@SerieSumPI, N)'
serie = arrayfun(@SerieSumPI, N)';
plot(N, abs(serie - pi));
title(strcat ("Ej2: Serie PI\nSerie == pi en la iteracion:", num2str(find(serie == pi)(1))))


N = 30;
its = [1:1:N-1]';
relErr = abs(pi - SucesionPI(N)')./pi;
subplot(3,2,5)
plot(its, relErr)
title("Ej3: Sucesion PI\nError relativo al calcular PI")
subplot(3,2,6)
plot([14:1:18], relErr(13:17))
title("Ej3: Sucesion PI\nDetalle del intervalo 14-18")


