lastsub = 5;
skipped = [ ];

sublist = setdiff(1:lastsub,skipped);

for sub = sublist
	load(sprintf('subject4%02.0f',sub))
end
