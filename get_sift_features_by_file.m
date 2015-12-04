function [F,D]=get_sift_features_by_file(class_name,file_name)
    if exist(['sift_features\',class_name,'_',file_name,'.mat'],'file')
        load(['sift_features\',class_name,'_',file_name,'.mat'],'F','D');
    else
        bounding_box=get_bounding_box_by_file(class_name,file_name);
        bounding_box(bounding_box==0)=1;
        xmin=bounding_box(1);
        xmax=bounding_box(2);
        ymin=bounding_box(3);
        ymax=bounding_box(4);
        origin_image = imread(['finalProjectData\class',class_name,'\',file_name,'.JPEG']);
        cut_image=origin_image(ymin:ymax,xmin:xmax);
        resize_image=imresize(cut_image,[200,200]);
%         figure(1),imshow(cut_image);
%         figure(2),imshow(resize_image);
        [F,D]=vl_sift(single(resize_image));%sift features to be changed
        save(['sift_features\',class_name,'_',file_name,'.mat'],'F','D');
    end
end