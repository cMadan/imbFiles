function nm = nmean4(data,dim)

% count the non-NaNs
notnan = sum(~isnan(data),dim);

% replace the NaN with a zero
data0 = data;
data0(isnan(data)) = 0;

nm = sum(data0,dim)./notnan;