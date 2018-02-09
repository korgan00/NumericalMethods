

function p = SucesionPI (N)
  %{
  p = zeros (1, N-1);
  p(1) = 2;
  
  for i = 2:(N-1)
    a = 2^(i-(1/2))
    b = 1-(4^(1-i))*(p(i-1)^2)
    c = sqrt(1-sqrt(b))
    p(i) = a * c;
  endfor
  %}
  
  n = [2:1:N];
  a = 2.^(n-(1/2));
  b = 4.^(1-n);
  
  p = zeros (1, N-1);
  p(1) = 2;
  for i = 2:(N-1)
    p(i) = a(i-1) * sqrt( 1 - sqrt( 1 - b(i-1) * p(i-1) ^2 ) );
  endfor
  
endfunction