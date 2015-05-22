% only load the data for a few subjects for now
lastsub = 5;
skipped = [ ];

sublist = setdiff(1:lastsub,skipped);

% initalize blank variables for storing ERs and RTs across participants
ERs = nan(length(sublist),4);
RTs = nan(length(sublist),4);

for sub = sublist

	% load the .mat file
	load(sprintf('subject4%02.0f',sub))
	
	% calculate the subject's mean error rates
	ERsub(1) = mean(ER(find(D==.5 & Dpen==0)));
	ERsub(2) = mean(ER(find(D==1 & Dpen==0)));
	ERsub(3) = mean(ER(find(D==2 & Dpen==0)));
	ERsub(4) = mean(ER(find(D==.5 & Dpen==1.5)));
	
	% response times too
	RTsub(1) = mean(RT(find(D==.5 & Dpen==0)));
	RTsub(2) = mean(RT(find(D==1 & Dpen==0)));
	RTsub(3) = mean(RT(find(D==2 & Dpen==0)));
	RTsub(4) = mean(RT(find(D==.5 & Dpen==1.5)));
	
	% store these values for later
    ERs(sub,:) = ERsub;
    RTs(sub,:) = RTsub;
end

% let's see what we got
ERs
RTs