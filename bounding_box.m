clc
clear all;

charac={'017','024','028','037','047','054','058','061','069','070','074','075','076','089','096','098','125','162','167','197'};%the 49th one in the 033 data loss.
for k=1:20
d_name = char(charac(k));
xfiles=dir(['FinalProject_BBOX\bbox_class',d_name,'\*.xml']);
xy_data=[];
for i=1:size(xfiles)
xDoc = xmlread(['FinalProject_BBOX\bbox_class',d_name,'\',xfiles(i).name]);
xmin1 = xDoc.getElementsByTagName('xmin');
xmin=str2num(xmin1.item(0).getFirstChild.getData);

xmax1 = xDoc.getElementsByTagName('xmax');
xmax=str2num(xmax1.item(0).getFirstChild.getData);

ymax1 = xDoc.getElementsByTagName('ymax');
ymax=str2num(ymax1.item(0).getFirstChild.getData);

ymin1 = xDoc.getElementsByTagName('ymin');
ymin=str2num(ymin1.item(0).getFirstChild.getData);

xy_data=[xy_data;xmin xmax ymin ymax]
end
save(['bounding_box\xy',d_name,'.mat'],'xy_data');
end