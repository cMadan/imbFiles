tic

numbers = 1:1000;
nSum = 0;
for i = numbers
    nSum = nSum + numbers(i) % no more semicolon here!
end

elapsed3 = toc