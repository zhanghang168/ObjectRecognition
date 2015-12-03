function cverror=svm_test_fun(m)
dir_space={'017','024','028','037','047','054','058','061','069','070','074','075','076','089','096','098','125','162','167','197'};
global Big_sift;
Big_sift=[];
for i=1:20
    char_n=char(dir_space(i));
    for j=1:m
        load(['sift_features\',char_n,'_',num2str(j),'.mat']);
        d=D(:,1:16);
        Big_sift=[Big_sift;d(:)'];
    end
end
save('feature_20.mat','Big_sift');
load('feature_20.mat');%the Sift features after resizing(four categories).
A=[ones(m,1);2*ones(m,1);3*ones(m,1);4*ones(m,1);5*ones(m,1);6*ones(m,1);7*ones(m,1);8*ones(m,1);9*ones(m,1);10*ones(m,1);11*ones(m,1);12*ones(m,1);13*ones(m,1);14*ones(m,1);15*ones(m,1);16*ones(m,1);17*ones(m,1);18*ones(m,1);19*ones(m,1);20*ones(m,1)];
global obj;
obj = fitcdiscr(double(Big_sift),A,'discrimType','diaglinear');
cvmodel = crossval(obj,'kfold',20);
cverror = kfoldLoss(cvmodel);
disp(cverror);
end