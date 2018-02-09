function F = NewtonSysFun(x) 
  F(1,1) = 3*x(1)^2 - x(2)^2;
  F(2, 1) = 3*x(1)*x(2)^2 - x(1)^3 - 1;
endfunction