% only load the data for a few subjects for now
lastsub = 5;
skipped = [ 4 ];

sublist = setdiff(1:lastsub,skipped);

% initalize blank variables for storing ERs and RTs across participants
ERs = nan(length(sublist),4);
RTs = nan(length(sublist),4);

for sub = sublist

	% load the .mat file
	load(sprintf('subject4%02.0f',sub))
	
	% calculate the subject's mean error rates
	ERs(sub,1) = mean(ER(find(D==.5 & Dpen==0)));
	ERs(sub,2) = mean(ER(find(D==1 & Dpen==0)));
	ERs(sub,3) = mean(ER(find(D==2 & Dpen==0)));
	ERs(sub,4) = mean(ER(find(D==.5 & Dpen==1.5)));
	
	% response times too
	RTs(sub,1) = mean(RT(find(D==.5 & Dpen==0)));
	RTs(sub,2) = mean(RT(find(D==1 & Dpen==0)));
	RTs(sub,3) = mean(RT(find(D==2 & Dpen==0)));
	RTs(sub,4) = mean(RT(find(D==.5 & Dpen==1.5)));
	
end

% let's see what we got
ERs
RTs