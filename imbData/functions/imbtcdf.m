function p = imbtcdf(t,df);
% imbtcdf CDF for t-distribution.
%
% Written by Christopher Madan.

x = t^2 / (df + t^2) ;
p = ( 1 + sign(t) * betainc( x, .5, df/2 ) ) / 2;
