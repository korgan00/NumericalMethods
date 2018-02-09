function J = NewtonSysJac(x)
  J(1, 1) = 6*x(1);
  J(1, 2) = -2*x(2);
  J(2, 1) = 3*x(2)^2 - 3*x(1)^2;
  J(2, 2) = 6*x(1)*x(2);
endfunction