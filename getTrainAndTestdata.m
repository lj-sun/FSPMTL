function [X_Train,Y_Train,X_Test,Y_Test]=getTrainAndTestdata(data)
rng(1)
X_all=data.X;
Y_all=data.Y; 
T=size(X_all,1);
X_Train=cell(T,1);
Y_Train=cell(T,1);
X_Test=cell(T,1);
Y_Test=cell(T,1);
n=10;
for t = 1:T
    indices = crossvalind('Kfold',Y_all{t},n);
    test = (indices == 1);       
    X_Train{t}=X_all{t}(~test,:);
    Y_Train{t}=Y_all{t}(~test,:);
    X_Test{t}=X_all{t}(test,:);
    Y_Test{t}=Y_all{t}(test,:);
end