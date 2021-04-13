function E=getE(X_Train,Y_Train)

T=size(X_Train,1);
for t = 1:T
    elt=getelt(X_Train{t},Y_Train{t});
    E{t}=elt;       
end