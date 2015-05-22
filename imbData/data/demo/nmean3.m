data = rand(5,4);
data(2,2) = NaN;
data

dim = 2;

% count the non-NaNs
notnan = sum(~isnan(data),dim);

% replace the NaN with a zero
data0 = data;
data0(isnan(data)) = 0;

nm = sum(data0,dim)./notnan