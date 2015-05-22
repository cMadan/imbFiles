function [nm,notnan] = nmean6(data,dim)

if ~exist('dim')
    dim = 1;
end

% count the non-NaNs
notnan = sum(~isnan(data),dim);

% replace the NaN with a zero
data0 = data;
data0(isnan(data)) = 0;

nm = sum(data0,dim)./notnan;