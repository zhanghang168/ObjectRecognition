% function []=buildin_svm_test()
test_classes={'017','024','028','037','047','054','058','061','069','070','074','075','076','089','096','098','125','162','167','197'};
% test_classes={'017','024','028','037','047','054','058','061'};

[labels,data]=get_sift_features_by_test_classes(test_classes);
% 
% global SIFT_VECTOR_SIZE;
% global SIFT_VECTOR_NUM;
% data_size=0;
% for i=1:size(test_classes,2)
%     class_name=char(test_classes(i));
%     image_files=dir(['finalProjectData\class',class_name,'\*.JPEG']);
%     data_size=data_size+size(image_files,1);
% end
% data=zeros(data_size,SIFT_VECTOR_NUM*SIFT_VECTOR_SIZE);
% labels=zeros(data_size,1);
% test_id=0;
% 
% for i=1:size(test_classes,2)
%     class_name=char(test_classes(i));
%     image_files=dir(['finalProjectData\class',class_name,'\*.JPEG']);
%     for j=1:size(image_files)
%         test_id=test_id+1;
%         [~,file_name,~]=fileparts(image_files(j).name);
%         [~,D]=get_sift_features_by_file(class_name,file_name);
%         DD=D(:,1:SIFT_VECTOR_NUM);
%         data(test_id,:)=DD(:)';
%         labels(test_id,1)=i;
%     end
%     i
% end
%%   svm
% load('feature_20.mat');%the Sift features after resizing(four categories).
% A=[ones(100,1);2*ones(100,1);3*ones(100,1);4*ones(100,1);5*ones(100,1);6*ones(100,1);7*ones(100,1);8*ones(100,1);9*ones(100,1);10*ones(100,1);11*ones(100,1);12*ones(100,1);13*ones(100,1);14*ones(100,1);15*ones(100,1);16*ones(100,1);17*ones(100,1);18*ones(100,1);19*ones(100,1);20*ones(100,1)];
% obj = fitcdiscr(double(big_sift),A,'discrimType','diaglinear');
% cvmodel = crossval(obj,'kfold',20);
% cverror = kfoldLoss(cvmodel)
% label = predict(obj,double(big_sift(307,:)))
% end
data=double(data);

%% pca
[coeff,score,latent,tsqured,explained]=pca(data);
pca_dim=find((cumsum(latent)./sum(latent))>0.95,1,'first');
pca_data=score(:,1:pca_dim);
pca_data=score;

%% linear
linear_model = fitcdiscr(double(pca_data),labels,'discrimType','diaglinear');

%% cross valicate
cvmodel = crossval(linear_model,'kfold',10);
cverror = kfoldLoss(cvmodel)

%% predict
predict_labels=zeros(size(labels));
for i=1:size(labels)
    predict_labels(i,1) = predict(linear_model,pca_data(i,:));
end
find(predict_labels~=labels)

%% svm
% data=pca_data;
% svm_model=svmtrain(labels,data);
% [predicted_label, accuracy, prob_estimates] = svmpredict(labels, data, svm_model);
% accuracy
