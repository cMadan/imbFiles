function [h,p,ci,stats] = imbttest(x,y,a,tails)
% imbttest One-sample and paired-sample t-test.
%
% Written by Christopher Madan.

if ~exist('a')
    a = .05;
end

if ~exist('tails')
    tails = 'both';
end

n = length(x);
df = n-1;
sd = std(x - y);
sem = sd / sqrt(n);
m = mean(x - y);
t = m / ( sem );

p = imbtcdf(t,df);

if length(y) == 1
    m = mean(x);
end

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