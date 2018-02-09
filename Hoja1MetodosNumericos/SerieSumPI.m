
function p = SerieSumPI (N)
  
M = [0:1:N];
pArr = arrayfun(@(m) ((16^-m) *( 4/(8*m+1) - (2/(8*m+4) + 1/(8*m+5) + 1/(8*m+6)) )), M);

p = sum(pArr);

endfunction