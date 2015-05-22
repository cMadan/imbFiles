function [rho,p]=imbspear(x,y,tails)
% imbspear Spearman's correlation.
%
% Written by Christopher Madan.

if ~exist('tails')
    tails = 'both';
end

xs=sort(x);
vals=unique(xs);for v=vals',rset=find(x==v);x(find(x==v))=mean(rset);end;
ys=sort(y);
vals=unique(ys);for v=vals',rset=find(y==v);y(find(y==v))=mean(rset);end;

[rho,p]=imbcorr(x,y,tails);
