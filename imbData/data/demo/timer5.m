tic

numbers = 1:1000;
nSum = 0;
for i = numbers
    nSum = nSum + numbers(i);
    if mod(i,1) == 0
        i
    end
end

elapsed5 = toc