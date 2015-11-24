% dir_space={'017','024','028','037','047','054','058','061','069','070','074','075','076','089','096','098','125','162','167','197'};
% Big_sift=[];
% for i=1:20
%     char_n=char(dir_space(i));
%     for j=1:100
%         load(['sift_features\',char_n,'_',num2str(j),'.mat']);
%         d=D(:,1:16);
%         Big_sift=[Big_sift;d(:)'];
%     end
% end
% save('feature_20.mat','Big_sift');
%%   svm
load('feature_20.mat');%the Sift features after resizing(four categories).
A=[ones(100,1);2*ones(100,1);3*ones(100,1);4*ones(100,1);5*ones(100,1);6*ones(100,1);7*ones(100,1);8*ones(100,1);9*ones(100,1);10*ones(100,1);11*ones(100,1);12*ones(100,1);13*ones(100,1);14*ones(100,1);15*ones(100,1);16*ones(100,1);17*ones(100,1);18*ones(100,1);19*ones(100,1);20*ones(100,1)];
obj = fitcdiscr(double(Big_sift),A,'discrimType','diaglinear');
cvmodel = crossval(obj,'kfold',20);
cverror = kfoldLoss(cvmodel)
label = predict(obj,double(Big_sift(307,:)))