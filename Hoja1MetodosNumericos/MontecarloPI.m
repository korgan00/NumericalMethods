
function p = MontecarloPI (N)
  coords = rand(N, 2); #N pairs x,y

  sqCoords = coords .* coords; # x^2 , y^2
  sumSqCoords = sqCoords(:,1) + sqCoords(:,2); # x^2 + y^2

  M = sum(sumSqCoords <= 1); #count inside circle

  p = (M*4)/N;
endfunction