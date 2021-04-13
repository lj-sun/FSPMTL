function elt=getelt(Xt_Train,Y_Traint)

X=zscore(Xt_Train);
X=NonZeroX(X);
y=fixlabel(Y_Traint); % preprocess
sigma = 0.1; % parameter of Gaussian noise
[~,elt]=SPL_LR(X,double(y), sigma, 'GaussianNoise', 'Balanced');
elt=logical(elt);

