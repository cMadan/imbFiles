%% settings
lastsub = 5;
skipped = [ 4 ];

condD = [ .5 1 2 .5];
condDpen = [ 0 0 0 1.5 ];

%% analyses start here
sublist = setdiff(1:lastsub,skipped);

% initalize blank variables for storing ERs and RTs across participants
ERs = nan(length(sublist),4);
RTs = nan(length(sublist),4);

for sub = sublist

	% load the .mat file
	load(sprintf('subject4%02.0f',sub))
	
	% calculate the subject's means
    for cond = 1:length(condD)
        ERs(sub,cond) = mean(ER(find(D==condD(cond) & Dpen==condDpen(cond))));
        RTs(sub,cond) = mean(RT(find(D==condD(cond) & Dpen==condDpen(cond))));
    end
	
end

% let's see what we got
ERs
RTs