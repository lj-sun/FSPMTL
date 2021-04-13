% (FSPMTL)
% Codes for the following paper:
%   Sun, L., & Zhou, Y. (2020). FSPMTL: Flexible Self-Paced Multi-Task Learning. IEEE Access, 8, 132012-132020.
clear

%% 加载数据
data=load('data\Syn1_Instance_300.mat');
[X_Train,Y_Train,X_Test,Y_Test]=getTrainAndTestdata(data);


%% FSPVSTGMTL
W=FSPVSTGMTL(X_Train,Y_Train);
% 测试模型
T = size(X_Test,1);
Y_test_hat = cell(T,1);
for t = 1:T
    Y_test_hat{t} = sign(1./(1+exp(-X_Test{t}*W(:,t)))-0.5);
end
Y_test_vec = cell2mat(Y_Test);
Y_test_hat_vec = cell2mat(Y_test_hat);
LastEval=F1_measure(Y_test_vec,Y_test_hat_vec);
fprintf(sprintf('FSPVSTGMTL模型的F1值: %f\n',LastEval));

%% VSTGMTL
W=VSTGMTL(X_Train,Y_Train);
% 测试模型
T = size(X_Test,1);
Y_test_hat = cell(T,1);
for t = 1:T
    Y_test_hat{t} = sign(1./(1+exp(-X_Test{t}*W(:,t)))-0.5);
end
Y_test_vec = cell2mat(Y_Test);
Y_test_hat_vec = cell2mat(Y_test_hat);
LastEval=F1_measure(Y_test_vec,Y_test_hat_vec);
fprintf(sprintf('VSTGMTL模型的F1值: %f\n',LastEval));
