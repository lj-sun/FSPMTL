function W=FSPVSTGMTL(X_Train,Y_Train)
% (FSP-VSTG-MTL)
% Codes for the following paper:
%   Sun, L., & Zhou, Y. (2020). FSPMTL: Flexible Self-Paced Multi-Task Learning. IEEE Access, 8, 132012-132020.

%% ���غ���·��
addpath(genpath('minFunc_2012'))
addpath(genpath('MALSAR'))
addpath(genpath('BSPL'))
addpath(genpath('VSTGMTL'))

%% �Բ�ѧϰ�׶�

%�����Բ�ѧϰ��������������׾���E
E=getE(X_Train,Y_Train);
L=6;

%% ������ѧϰ�׶�
T=size(X_Train,1);
D=size(X_Train{1},2);
W=zeros(D,T);
for l=1:L
    Xl=cell(T,1);
    Yl=cell(T,1);
    for t=1:T        
        Xl{t}=X_Train{t}((E{t}(:,l)),:);
        Yl{t}=Y_Train{t}((E{t}(:,l)),:);
    end
    Wl=VSTGMTL(Xl,Yl);
    W=W+Wl;
end
W=W./L;




