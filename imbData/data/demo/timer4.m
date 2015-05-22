tic

numbers = 1:1000;
nSum = 0;
for i = numbers
    nSum = nSum + numbers(i);
    if mod(i,100) == 0
        i
    end
end

elapsed4 = toc