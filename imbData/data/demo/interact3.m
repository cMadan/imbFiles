lastsub = input('What was the last subject number? ');

for sub = 1:lastsub
    disp(sprintf('Processing data from participant %.0f. %.0f percent complete...',sub,(sub-1)/lastsub*100))
    % load files and do analysis
end    
disp('All done! 100 percent complete.')