function [h,p,ci,stats] = imbttest(x,y,a,tails)
% imbttest2 Two-sample t-test with equal variances.
% Cannot calculate t for unequal variances.
%
% Written by Christopher Madan.

if ~exist('a')
    a = .05;
end

if ~exist('tails')
    tails = 'both';
end


nx = length(x);
ny = length(y);
dfx = nx-1;
dfy = ny-1;
df = dfx + dfy;
s2x = var(x);
s2y = var(y);
sd = sqrt(( dfx*s2x + dfy*s2y) / df);

sem = sd * sqrt(1/nx + 1/ny);
m = mean(x) - mean(y);
t = m / ( sem );

p = imbtcdf(t,df);

if strcmp(tails,'both')
    p = 1 - (abs(p - .5) * 2);
    crit = imbtinv(1-(a/2),df) * sem;
    ci = [ m-crit m+crit ];
elseif strcmp(tails,'left')
    % p = p;
    crit = imbtinv(1-a,df) * sem;
    ci = [ -Inf m+crit ];
elseif strcmp(tails,'right')
    p = 1 - p;
    crit = imbtinv(1-a,df) * sem;
    ci = [ m-crit Inf ];
end

h = p < a;

stats.tstat = t;
stats.df    = df;
stats.sd    = sd;