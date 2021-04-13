function F=F1_measure(real_targets,presion_targets)

labelall=tabulate([presion_targets;real_targets]);
labelcomtent=labelall(:,1);
labelnum=size(labelall,1);
P=zeros(labelnum,1);
R=zeros(labelnum,1);
for i=1:labelnum
true=labelcomtent(i);
TP=size(real_targets((real_targets==true & presion_targets==true),:),1);
FP=size(real_targets((real_targets~=true & presion_targets==true),:),1);
FN=size(real_targets((real_targets==true & presion_targets~=true),:),1);
TN=size(real_targets((real_targets~=true & presion_targets~=true),:),1);
P(i)=TP/(TP+FP);
R(i)=TP/(TP+FN);
end

preccision=mean(P);
recall=mean(R);

F=2*preccision*recall/(preccision+recall);