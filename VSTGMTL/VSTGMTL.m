function W_mnist=VSTGMTL(Train_X,Train_Y)

opts.max_iter =500;
opts.max_iter_fista =300;
opts.max_iter_ADMM=50;
opts.rel_tol  =10^-3;
opts.rel_tol_fista=10^-3;
opts.tol_ADMM=10^-2;
opts.rho=2;
%% classification
% VSTG_MTL_logistic requires minFunc by Schmidit, 2005 
% (https://www.cs.ubc.ca/~schmidtm/Software/minFunc.html)
K=5;

hyp2= [2^-3,2^-3,2^-3,3];
[U_mnist,V_mnist,~] =VSTG_MTL_logistic(Train_X,Train_Y,K,hyp2,opts);
W_mnist = U_mnist*V_mnist;
% T = size(X_test,1);
% Y_test_hat = cell(T,1);
% for t = 1:T
%     Y_test_hat{t} = sign(1./(1+exp(-X_test{t}*W_mnist(:,t)))-0.5);
% end
% Y_test_vec = cell2mat(Y_test);
% Y_test_hat_vec = cell2mat(Y_test_hat);
% Err = mean(Y_test_vec~=Y_test_hat_vec);
% zheng=length(find(Y_test_hat_vec==1))
% fprintf(sprintf('Error Rate: %f\n',Err));