charac={'017','024','028','037','047','054','058','061','069','070','074','075','076','089','096','098','125','162','167','197'};%the 49th one in the 033 data loss.
for k=1:20
d_name = char(charac(k));
xfiles=dir(['finalProjectData\class',d_name,'\*.jpeg']);
load(['bounding_box\xy',d_name,'.mat']);
[m,n]=find(xy_data==0);
xy_data(m,n)=1;
for i=1:size(xfiles)
I = imread(['finalProjectData\class',d_name,'\',xfiles(i).name]);    

xmin=xy_data(i,1);
xmax=xy_data(i,2);
ymin=xy_data(i,3);
ymax=xy_data(i,4);

I1=I(ymin:ymax,xmin:xmax);
I2=imresize(I1,[200,200]);%
%figure(1),imshow(I1);
%figure(2),imshow(I2);

[F,D]=vl_sift(single(I2));%sift features to be changedi
%pca()
 save(['sift_features\',d_name,'_',num2str(i),'.mat'],'D');
end
end