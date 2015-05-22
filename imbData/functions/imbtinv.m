function t = imbtinv(p,df);
% imbtinv Inverse CDF for t-distribution.
%
% Written by Christopher Madan.

p = p - .5;
z = betaincinv(2 * abs(p), df/2, .5, 'upper');
t = sign(p) .* sqrt( df .* ( (1-z) ./ z) );
