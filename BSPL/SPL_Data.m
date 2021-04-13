function SPL_Data_Syn(Datafrom)


Dataset=['data\NonSPL\',Datafrom];
load(Dataset)
X_Syn=X;
Y_Syn=Y;
T=size(X,1);
clear X Y

X_Train=cell(T,1);
Y_Train=cell(T,1);
X_Test=cell(T,1);
Y_Test=cell(T,1);

for t = 1:T
    
    fea=X_Syn{t};
    gnd=Y_Syn{t};
    
    n=10;
    X=zscore(fea);
    X=NonZeroX(X);
    y=fixlabel(gnd); % preprocess
    %cp = cvpartition(y,'k',10);    % 10-fold cross validation
    sigma = 0.1; % parameter of Gaussian noise
    delta = 0.2; % parameter of Dropout noise
    
 
    
    [~,V6]=SPL_LR(X,double(y), sigma, 'GaussianNoise', 'Balanced');
    
    V6=logical(V6);
    X_Train{t}=fea;
    Y_Train{t}=gnd;
    V6_Train{t}=V6;
    
    
    
%     rng(run_time);
%     indices = crossvalind('Kfold',y,n);
%     test = (indices == 1);   
    
    
    
%     X_Train{t}=fea(~test,:);
%     Y_Train{t}=gnd(~test);
%     V6_Train{t}=V6(~test,:);
%     X_Test{t}=fea(test,:);
%     Y_Test{t}=gnd(test);
    
end
save(['data\SPL\',Datafrom],'X_Train','Y_Train','V6_Train');