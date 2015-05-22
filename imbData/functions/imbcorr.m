function [r,p]=imbcorr(x,y,tails)
% imbcorr Pearson's correlation.
%
% Written by Christopher Madan.

if ~exist('tails')
    tails = 'both';
end

x = (x - mean(x));
y = (y - mean(y));
r = dot(x,y) / (sqrt(dot(x,x)) * sqrt(dot(y,y)));

n = length(x);
t = r / sqrt( (1-r^2)  / (n-2) );

p = tcdf(t,n-2);
if strcmp(tails,'both')
    p = 1 - (abs(p - .5) * 2);
elseif strcmp(tails,'left')
    % p = p;
elseif strcmp(tails,'right')
    p = 1 - p;
end