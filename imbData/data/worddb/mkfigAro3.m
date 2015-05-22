fid = fopen('JanschewitzB386appB.txt','r');
formatstring = [ '%s %s' repmat(' %f',1,19) ];
worddata=textscan(fid,formatstring,'headerlines',5,'delimiter','\t');
fclose(fid);

types=unique(worddata{2}(1:460));
for i=1:length(types)
    mAro(i)=mean(worddata{18}(find(strcmp(worddata{2},types{i}))));
    stdAro(i)=std(worddata{18}(find(strcmp(worddata{2},types{i}))));
    nWord(i)=sum(strcmp(worddata{2},types{i}));
end
semAro = stdAro./sqrt(nWord);

bar(mAro,'facecolor',imbhex2color('91D2E2'))
hold on
errorbar(1:7,mAro,semAro,'.k','markersize',1)
axis([0 8 1 9])
set(gca,'XTickLabel',types)
set(gca,'TickDir','out')
xlabel('Word Type')
ylabel('Mean Rating')
title('Arousal')
plot([0 8],[1 1],'k')
box off
hold off