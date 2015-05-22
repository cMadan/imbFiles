%% settings
lastsub = 20;
skipped = [ ];

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

% stats on the sample
mERs = mean(ERs(sublist,:));
semERs = std(ERs(sublist,:))./sqrt(length(sublist));
mRTs = mean(RTs(sublist,:));
semRTs = std(RTs(sublist,:))./sqrt(length(sublist));

%% figure
xticks = {'.5','1','2','.5+1.5'};
subplot(2,1,1)
bar(mERs,'facecolor',[ .6 .6 .8 ])
hold on
errorbar(1:4,mERs,semERs,'.k','markersize',1)
xlabel('Delay Condition')
ylabel('Error Rate')
axis([ .5 4.5 0 .3 ])
set(gca,'XTick',1:4)
set(gca,'YTick',0:.05:.3)
set(gca,'XTickLabel',xticks)
set(gca,'TickDir','out')
box off
hold off

subplot(2,1,2)
bar(mRTs,'facecolor',[ .6 .6 .8 ])
hold on
errorbar(1:4,mRTs,semRTs,'.k','markersize',1)
xlabel('Delay Condition')
ylabel('Reaction Time (s)')
axis([ .5 4.5 .6 1 ])
plot([0 5],[.6 .6],'k')
set(gca,'XTick',1:4)
set(gca,'YTick',.6:.1:1)
set(gca,'XTickLabel',xticks)
set(gca,'TickDir','out')
box off
hold off
